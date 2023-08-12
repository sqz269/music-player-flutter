import 'package:get/get.dart';
import 'package:tlmc_player_flutter/states/audio_controller_just_audio.dart';
import 'package:just_audio/just_audio.dart';
import 'package:uuid/uuid.dart';

import 'package:BackendClientApi/api.dart';

import 'package:tlmc_player_flutter/model/queued_track.dart';

class QueueController extends GetxController {
  static QueueController get to => Get.find<QueueController>();

  final queue = <QueuedTrack>[].obs;
  final history = <QueuedTrack>[].obs;
  final currentTrack = Rx<QueuedTrack?>(null);

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
  }

  bool get hasNext => queue.isNotEmpty;

  bool get hasPrevious => history.isNotEmpty;

  void _addTrack(QueuedTrack track,
      {int? position, bool playImmediately = false}) {
    // invalid call if position and playImmediately are both true
    if (position != null && playImmediately) {
      throw Exception(
          "Invalid call to _addTrack, position cannot be set if playImmediately is true");
    }

    track.index = _index++;
    if (position != null) {
      queue.insert(position, track);
    } else {
      if (playImmediately) {
        queue.insert(0, track);
        playNext();
        return;
      }

      queue.add(track);
    }
    if (currentTrack.value == null) {
      playNext();
      return;
    }
  }

  void _addTracks(List<QueuedTrack> tracks,
      {int? position, bool playImmediately = false}) {
    // invalid call if position and playImmediately are both true
    if (position != null && playImmediately) {
      throw Exception(
          "Invalid call to _addTrack, position cannot be set if playImmediately is true");
    }

    for (var element in tracks) {
      element.index = _index++;
    }
    if (position != null) {
      queue.insertAll(position, tracks);
    } else {
      if (playImmediately) {
        queue.insertAll(0, tracks);
        playNext();
        return;
      }

      queue.addAll(tracks);
    }

    if (currentTrack.value == null) {
      playNext();
      return;
    }
  }

  Future<bool> addTrackById(String id,
      {int? position, bool playImmediately = false}) async {
    var albumApi = AlbumApi(Get.find<ApiClient>());

    var track = await albumApi.getTrack(id);

    if (track == null) {
      return false;
    }

    _addTrack(QueuedTrack(track: track, index: _index++),
        position: position, playImmediately: playImmediately);

    return true;
  }

  Future<bool> addTracksById(List<String> ids,
      {int? position, bool playImmediately = false}) async {
    var albumApi = AlbumApi(Get.find<ApiClient>());

    var tracks = await albumApi.getTracks(requestBody: ids);

    if (tracks == null) {
      return false;
    }

    // some tracks in the request was not found
    if (tracks.notFound!.isNotEmpty) {
      return false;
    }

    // rearrange the tracks to match the order of the ids
    tracks.tracks!.sort((a, b) {
      var aPos = ids.indexOf(a.id!);
      var bPos = ids.indexOf(b.id!);
      return aPos.compareTo(bPos);
    });

    _addTracks(
      tracks.tracks!
          .map((e) => QueuedTrack(track: e, index: _index++))
          .toList(),
      position: position,
      playImmediately: playImmediately,
    );

    return true;
  }

  void removeFromQueue(String id) {
    queue.removeWhere((element) => element.id == id);
  }

  void removeFromQueueAt(int index) {
    queue.removeAt(index);
    print("Removed from queue at $index");
    print("New queue length: ${queue.length}");
  }

  void reorderQueue(int oldIndex, int newIndex) {
    var track = queue.removeAt(oldIndex);
    queue.insert(newIndex, track);
  }

  void pushHistory(QueuedTrack track, {int? position}) {
    if (position != null) {
      history.insert(position, track);
    } else {
      history.add(track);
    }
  }

  Future<bool> playNext({bool pushToHistory = true}) async {
    if (currentTrack.value != null && pushToHistory) {
      pushHistory(currentTrack.value!);
    }

    if (queue.isNotEmpty) {
      print(" --- Playing next ---");
      currentTrack.value = queue.removeAt(0);
      update();

      print("--- Requesting Load ---");
      // TODO: Make this a variable
      await _audioController.play(
          "https://api-music.marisad.me/api/asset/track/${currentTrack.value!.track.id}",
          currentTrack.value!.track);

      return true;
    }

    if (queue.isEmpty) {
      currentTrack.value = null;
      _audioController.stop();
    }
    return false;
  }

  bool playPrevious() {
    if (history.isEmpty) {
      return false;
    }

    // need to push current track to queued
    // then pop the last track from history
    // and set it as current track
    if (currentTrack.value != null) {
      _addTrack(currentTrack.value!, position: 0);
    }

    queue.insert(0, history.removeLast());
    playNext(pushToHistory: false);
    // currentTrack.value = history.removeLast();

    return true;
  }

  void clearQueue() {
    queue.clear();
  }

  void clearHistory() {
    history.clear();
  }

  void clearAll() {
    if (currentTrack.value != null) {
      _audioController.stop();
    }
    clearQueue();
    playNext();
    clearHistory();
  }

  Stream<QueuedTrack?> get currentTrackStream => currentTrack.stream;
}
