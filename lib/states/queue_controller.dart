import 'package:get/get.dart';
import 'package:tlmc_player_flutter/states/i_audio_controller.dart';
import 'package:uuid/uuid.dart';

import 'package:BackendClientApi/api.dart';

import 'package:tlmc_player_flutter/model/queued_track.dart';

class QueueController extends GetxController {
  static QueueController get to => Get.find<QueueController>();

  final queue = <QueuedTrack>[].obs;
  final history = <QueuedTrack>[].obs;
  final currentTrack = Rx<QueuedTrack?>(null);

  int _index = 0;

  final _audioController = Get.find<IAudioController>();

  void addTrack(QueuedTrack track, {int? position}) {
    track.index = _index++;
    if (position != null) {
      queue.insert(position, track);
    } else {
      queue.add(track);
    }
    if (currentTrack.value == null) {
      playNext();
    }
  }

  void addTracks(List<QueuedTrack> tracks, {int? position}) {
    for (var element in tracks) {
      element.index = _index++;
    }
    if (position != null) {
      queue.insertAll(position, tracks);
    } else {
      queue.addAll(tracks);
    }
  }

  Future<bool> addTrackById(String id, {int? position}) async {
    var albumApi = AlbumApi(Get.find<ApiClient>());

    var track = await albumApi.getTrack(id);

    if (track == null) {
      return false;
    }

    addTrack(QueuedTrack(track: track), position: position);

    return true;
  }

  Future<bool> addTracksById(List<String> ids, {int? position}) async {
    var albumApi = AlbumApi(Get.find<ApiClient>());

    var tracks = await albumApi.getTracks(requestBody: ids);

    if (tracks == null) {
      return false;
    }

    // some tracks in the request was not found
    if (tracks.notFound!.isNotEmpty) {
      return false;
    }

    addTracks(
      tracks.tracks!.map((e) => QueuedTrack(track: e)).toList(),
      position: position,
    );

    return true;
  }

  void removeFromQueue(Uuid id) {
    queue.removeWhere((element) => element.id == id);
  }

  void removeFromQueueAt(int index) {
    queue.removeAt(index);
  }

  void pushHistory(QueuedTrack track, {int? position}) {
    if (position != null) {
      history.insert(position, track);
    } else {
      history.add(track);
    }
  }

  bool playNext() {
    if (currentTrack.value != null) {
      pushHistory(currentTrack.value!);
    }

    if (queue.isNotEmpty) {
      print("Playing next");
      currentTrack.value = queue.removeAt(0);
      update();

      return true;
    }

    if (queue.isEmpty) {
      currentTrack.value = null;
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
      addTrack(currentTrack.value!, position: 0);
    }

    currentTrack.value = history.removeLast();

    return true;
  }

  void clearQueue() {
    queue.clear();
  }

  void clearHistory() {
    history.clear();
  }

  void clearAll() {
    clearQueue();
    playNext();
    clearHistory();
  }

  Stream<QueuedTrack?> get currentTrackStream => currentTrack.stream;
}
