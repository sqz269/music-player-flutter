import 'dart:math';

import 'package:get/get.dart';
import 'package:tlmc_player_flutter/services/api_client_provider.dart';
import 'package:tlmc_player_flutter/states/audio_controller_just_audio.dart';
import 'package:just_audio/just_audio.dart';

import 'package:BackendClientApi/api.dart';

import 'package:tlmc_player_flutter/model/queued_track.dart';

enum QueueMode { queue, radio }

class QueueController extends GetxController {
  static QueueController get to => Get.find<QueueController>();

  var _queueMode = QueueMode.queue;

  final queueModeNotifier = QueueMode.queue.obs;

  final queue = <QueuedTrack>[].obs;
  final currentlyPlaying = Rx<QueuedTrack?>(null);
  final playingIndex = (-1).obs;

  final isShuffled = false.obs;

  int _index = 0;

  final _audioController = Get.find<AudioControllerJustAudio>();

  QueueController() {
    _audioController.processingStateStream.listen(
      (event) {
        if (event == ProcessingState.completed) {
          playNext();
        }
      },
    );

    playingIndex.stream.listen(
      (event) {
        if (event == -1) {
          currentlyPlaying.value = null;
          return;
        }
        if (queue[event] != currentlyPlaying.value) {
          currentlyPlaying.value = queue[event];
        }
      },
    );
  }

  QueuedTrack? get currentTrack =>
      playingIndex.value == -1 ? null : queue[playingIndex.value];

  bool get hasNext => playingIndex.value < queue.length - 1;

  bool get hasPrevious => playingIndex.value > 0;

  void setQueueMode(QueueMode mode) {
    if (mode == _queueMode) {
      return;
    }

    if (mode == QueueMode.queue) {
      print("[QC] Switching to queue mode");
    }

    print("[QC] Changing queue mode to $mode");
    _queueMode = mode;
    _switchMode();
  }

  QueueMode get queueMode => _queueMode;

  void _switchMode() {
    clearQueue(resetMode: false).then((value) {
      queueModeNotifier.value = _queueMode;
    });
  }

  void _addTrack(QueuedTrack track,
      {int? position, bool playImmediately = false}) {
    // invalid call if position and playImmediately are both true
    _addTracks([track], position: position, playImmediately: playImmediately);
  }

  void _addTracks(List<QueuedTrack> tracks,
      {int? position, bool playImmediately = false}) {
    // invalid call if position and playImmediately are both true
    if (position != null && playImmediately) {
      throw Exception(
          "Invalid call to _addTrack, position cannot be set if playImmediately is true");
    }

    if (position != null && position < 0) {
      throw Exception("Invalid position");
    }

    // need to determine if this is actually desireable
    // if (isShuffled.value) {
    //   // shuffle the tracks before adding them to the queue
    //   tracks.shuffle();6
    // }

    for (var element in tracks) {
      element.index = _index++;
    }
    if (position != null) {
      queue.insertAll(position, tracks);
    } else {
      if (playImmediately) {
        queue.insertAll(playingIndex.value + 1, tracks);
        playNext();
        return;
      }

      queue.addAll(tracks);
    }

    if (playingIndex.value == -1) {
      playNext();
      return;
    }
  }

  Future<int?> addTrackById(String id,
      {int? position,
      bool playImmediately = false,
      AddedBy source = AddedBy.user}) async {
    return addTracksById([id],
        position: position, playImmediately: playImmediately, source: source);
  }

  Future<int?> addTracksById(List<String> ids,
      {int? position,
      bool playImmediately = false,
      AddedBy source = AddedBy.user}) async {
    // switch out of radio mode if the user adds a track
    if (_queueMode == QueueMode.radio && source == AddedBy.user) {
      setQueueMode(QueueMode.queue);
    }

    var albumApi = AlbumApi(Get.find<ApiClientProvider>().getApiClient());

    var tracks = await albumApi.getTracks(requestBody: ids);

    if (tracks == null) {
      return null;
    }

    // some tracks in the request was not found
    if (tracks.notFound!.isNotEmpty) {
      return null;
    }

    if (_queueMode == QueueMode.radio) {
      position ??= playingIndex.value + 1;
    }

    // rearrange the tracks to match the order of the ids
    tracks.tracks!.sort((a, b) {
      var aPos = ids.indexOf(a.id!);
      var bPos = ids.indexOf(b.id!);
      return aPos.compareTo(bPos);
    });

    _addTracks(
      tracks.tracks!
          .map((e) => QueuedTrack(track: e, index: _index++, addedBy: source))
          .toList(),
      position: position,
      playImmediately: playImmediately,
    );

    return ids.length;
  }

  void removeFromQueue(String id) {
    var index = queue.indexWhere((element) => element.track.id == id);
    if (index != -1) {
      removeFromQueueAt(index);
    }
  }

  void removeFromQueueAt(int index) {
    if (index < 0 || index >= queue.length) {
      return;
    }

    if (index == playingIndex.value) {
      if (hasNext) {
        playNext();
      } else {
        _audioController.stop();
        playingIndex.value = -1;
      }
    }

    queue.removeAt(index);
    if (index < playingIndex.value) {
      playingIndex.value--;
    }
    if (index == playingIndex.value) {
      if (hasNext) {
        playNext();
      } else {
        _audioController.stop();
        playingIndex.value = -1;
      }
    }
  }

  void reorderQueue(int oldIndex, int newIndex) {
    var track = queue.removeAt(oldIndex);
    queue.insert(newIndex, track);
    if (oldIndex == playingIndex.value) {
      playingIndex.value = newIndex;
    } else if (oldIndex < playingIndex.value &&
        newIndex >= playingIndex.value) {
      playingIndex.value--;
    } else if (oldIndex > playingIndex.value &&
        newIndex <= playingIndex.value) {
      playingIndex.value++;
    }
  }

  void toggleShuffle() {
    if (isShuffled.value) {
      unshuffle();
    } else {
      shuffle();
    }
  }

  void shuffle() {
    print("Shuffling");

    // Only shuffle tracks after the currently playing track
    var startRange = playingIndex.value + 1;
    var endRange = queue.length - 1;

    // Generate sublist of tracks to shuffle
    var tracksToShuffle = queue.sublist(startRange, endRange);

    // Shuffle the sublist using the Fisher-Yates algorithm
    var random = Random();
    for (var i = tracksToShuffle.length - 1; i > 0; i--) {
      var j = random.nextInt(i + 1);
      var temp = tracksToShuffle[i];
      tracksToShuffle[i] = tracksToShuffle[j];
      tracksToShuffle[j] = temp;
    }

    // Insert the shuffled sublist back into the queue
    queue.replaceRange(startRange, endRange, tracksToShuffle);

    print("Shuffling Complete");

    isShuffled.value = true;
  }

  void unshuffle() {
    print("Unshuffling");

    // Only unshuffle tracks after the currently playing track
    var startRange = playingIndex.value + 1;
    var endRange = queue.length - 1;

    // Generate sublist of tracks to unshuffle
    var tracksToUnshuffle = queue.sublist(startRange, endRange);

    // Sort the sublist by index
    tracksToUnshuffle.sort((a, b) => a.index.compareTo(b.index));

    // Insert the unshuffled sublist back into the queue
    queue.replaceRange(startRange, endRange, tracksToUnshuffle);

    print("Unshuffling Complete");

    isShuffled.value = false;
  }

  Future<bool> playNext() async {
    if (hasNext) {
      playingIndex.value++;
      await _audioController.play(
          "https://api-music.marisad.me/api/asset/track/${currentTrack!.track.id}",
          currentTrack!.track);
      return true;
    }

    return false;
  }

  bool playPrevious() {
    if (hasPrevious) {
      playingIndex.value--;
      return true;
    }

    return false;
  }

  Future<bool> skipTo(int index) async {
    if (index < 0 || index >= queue.length) {
      return false;
    }

    playingIndex.value = index;
    await _audioController.play(
        "https://api-music.marisad.me/api/asset/track/${currentTrack!.track.id}",
        currentTrack!.track);

    return true;
  }

  Future clearQueue({bool resetMode = true}) async {
    queue.clear();
    await _audioController.stop();
    if (resetMode) {
      setQueueMode(QueueMode.queue);
    }
    playingIndex.value = -1;
  }

  Stream<int?> get currentTrackStream => playingIndex.stream;
}
