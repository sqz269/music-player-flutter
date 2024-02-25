import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/extensions/api_object_extension.dart';
import 'package:tlmc_player_app/models/queue_track.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';

enum RepeatMode {
  none,
  one,
  all,
}

class QueueService {
  final _logger = Get.find<LoggingService>().getLogger("QueueService");

  final RxList<QueuedTrack> _queue = <QueuedTrack>[].obs;
  RxList<QueuedTrack> get queue => _queue;

  final RxInt _currentIndex = (-1).obs;
  RxInt get currentIndex => _currentIndex;

  final Rx<QueuedTrack?> _currentTrack = Rx<QueuedTrack?>(null);
  Rx<QueuedTrack?> get currentTrack => _currentTrack;

  final RxBool _isShuffled = false.obs;
  RxBool get isShuffled => _isShuffled;

  bool get hasNext => _currentIndex.value < _queue.length - 1;
  bool get hasPrevious => _currentIndex.value > 0;

  int get remainingTracks => _queue.length - _currentIndex.value - 1;

  final IAudioService _audioService = Get.find<IAudioService>();

  int _trackIndex = 0;

  QueueService() {
    _audioService.onComplete.listen((event) {
      _logger.i("Track completed");
      if (hasNext) {
        playNext();
      } else {
        _logger.i("Reached end of queue");
        // _currentIndex.value = _queue.length;
        // _currentTrack.value = null;
      }
    });
  }

  // #region Add Track Methods
  void _addTrack(
    QueuedTrack track, {
    int? position,
    bool playImmediately = false,
  }) {
    _addTracks([track], position: position, playImmediately: playImmediately);
  }

  void _addTracks(
    List<QueuedTrack> tracks, {
    int? position,
    bool playImmediately = false,
  }) {
    if (tracks.isEmpty) {
      _logger.w("No tracks to add");
      return;
    }

    _logger.i(
      "Adding ${tracks.length} tracks to queue",
    );
    if (position != null && playImmediately) {
      _logger.e(
        "Cannot play immediately and specify a position at the same time",
      );
      return;
    }

    if (position != null && (position < 0 || position > _queue.length)) {
      _logger.e("Position must be between 0 and ${_queue.length}");
    }

    if (playImmediately) {
      _queue.insertAll(_currentIndex.value + 1, tracks);
      playNext();
    } else if (position != null) {
      _queue.insertAll(position, tracks);
    } else {
      _queue.addAll(tracks);
    }

    if (currentIndex.value == -1 || currentIndex.value >= _queue.length) {
      playNext();
    }
  }

  Future<int?> addTracksById(
    List<String> trackIds, {
    int? position,
    bool playImmediately = false,
    String groupTag = "default",
  }) async {
    // Fetch tracks from API
    TrackGetMultipleResp? response;
    try {
      var albumApi = AlbumApi(Get.find<ApiClientProvider>().getApiClient());
      response = await albumApi.getTracks(requestBody: trackIds);
    } catch (e) {
      _logger.e("Failed to fetch tracks from API: $e");
      return null;
    }

    if (response == null) {
      return null;
    }

    if (response.notFound!.isNotEmpty) {
      _logger.w(
        "Some tracks were not found: ${response.notFound!.join(", ")}",
      );
    }

    // restore the order of the tracks
    response.tracks!.sort((a, b) {
      var aPos = trackIds.indexOf(a.id!);
      var bPos = trackIds.indexOf(b.id!);
      return aPos.compareTo(bPos);
    });

    // construct QueuedTrack objects
    var queuedTracks = response.tracks!
        .map(
          (e) => QueuedTrack(
            track: e,
            index: _trackIndex++,
            groupTag: groupTag,
          ),
        )
        .toList();

    _addTracks(
      queuedTracks,
      position: position,
      playImmediately: playImmediately,
    );

    return queuedTracks.length;
  }

  Future<int?> addTrackById(
    String trackId, {
    int? position,
    bool playImmediately = false,
    String groupTag = "default",
  }) async {
    // Fetch track from API
    // Add track to queue
    return addTracksById(
      [trackId],
      position: position,
      playImmediately: playImmediately,
      groupTag: groupTag,
    );
  }

  // #endregion

  // #region Remove Track Methods

  QueuedTrack? removeByQueueItemId(String queueItemId) {
    var index =
        _queue.indexWhere((element) => element.queueItemId == queueItemId);
    if (index == -1) {
      return null;
    }

    var removedTrack = _queue.removeAt(index);
    if (index < _currentIndex.value) {
      _currentIndex.value--;
    } else if (index == _currentIndex.value) {
      _audioService.stop();
      _currentIndex.value = -1;
    }

    return removedTrack;
  }

  QueuedTrack removeByIndex(int index) {
    if (index < 0 || index >= _queue.length) {
      throw Exception("Index out of range");
    }

    var removedTrack = _queue.removeAt(index);
    if (index < _currentIndex.value) {
      _currentIndex.value--;
    } else if (index == _currentIndex.value) {
      _audioService.stop();
      _currentIndex.value = -1;
    }

    return removedTrack;
  }

  int removeByGroupTag(String groupTag, {bool futureOnly = false}) {
    int removedCount = 0;
    int startRange = futureOnly ? _currentIndex.value : 0;

    for (var i = _queue.length - 1; i > startRange; i--) {
      if (_queue[i].groupTag == groupTag) {
        _queue.removeAt(i);
        removedCount++;
      }
    }

    return removedCount;
  }

  void clearQueue() {
    _queue.clear();
  }

  // #endregion

  // #region Other Methods

  void reorderQueue(int oldIndex, int newIndex) {
    var track = _queue.removeAt(oldIndex);
    _queue.insert(newIndex, track);
    // update tracks internal index

    if (oldIndex == _currentIndex.value) {
      _currentIndex.value = newIndex;
    } else if (oldIndex < _currentIndex.value &&
        newIndex >= _currentIndex.value) {
      _currentIndex.value--;
    } else if (oldIndex > _currentIndex.value &&
        newIndex <= _currentIndex.value) {
      _currentIndex.value++;
    }
  }

  void shuffle() {
    // before shuffling, record the current index for each track
    for (var i = 0; i < _queue.length; i++) {
      _queue[i].index = i;
    }

    _queue.shuffle();
  }

  void unshuffle() {
    if (!_isShuffled.value) {
      return;
    }

    // only unshuffle tracks after the current index
    var startRange = _currentIndex.value + 1;
    var tracksToUnshuffle = _queue.sublist(startRange);

    // sort the tracks by their original index
    tracksToUnshuffle.sort((a, b) => a.index.compareTo(b.index));

    // insert the unshuffled tracks back into the queue
    _queue.replaceRange(startRange, _queue.length, tracksToUnshuffle);

    isShuffled.value = false;
  }
  // #endregion

  // #region Queue Management Methods

  Future<bool> skipTo(int index) async {
    if (index < 0 || index >= _queue.length) {
      return false;
    }

    _currentIndex.value = index;
    _currentTrack.value = _queue[_currentIndex.value];
    await _audioService.play(
      _currentTrack.value!.track.toTrackInfo(),
    );
    return true;
  }

  Future<bool> playNext() async {
    if (!hasNext) {
      return false;
    }

    return skipTo(_currentIndex.value + 1);
  }

  Future<bool> playPrevious() async {
    if (!hasPrevious) {
      return false;
    }

    return skipTo(_currentIndex.value - 1);
  }
  // #endregion
}
