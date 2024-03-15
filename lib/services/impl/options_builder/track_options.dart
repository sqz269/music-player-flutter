
import 'package:BackendClientApi/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/controllers/desktop/desktop_application_controller.dart';
import 'package:tlmc_player_app/services/api/options_builder/i_track_option.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';

class TrackOptionPlayNext extends ITrackOption {
  @override
  Icon get icon => const Icon(Icons.playlist_play);

  @override
  String get title => 'Play next';

  @override
  String get description => 'Play this track next in the queue';

  TrackOptionPlayNext(TrackReadDto track) : super(track);

  @override
  Future execute() async {
    print('Playing next');

    for (var callback in callbacks) {
      callback();
    }
  }
}

class TrackOptionAddToQueue extends ITrackOption {
  @override
  Icon get icon => const Icon(Icons.queue_music);

  @override
  String get title => 'Add to queue';

  @override
  String get description => 'Add this track to the end of queue';

  TrackOptionAddToQueue(TrackReadDto track) : super(track);

  @override
  Future execute() async {
    var queueService = Get.find<QueueService>();
    queueService.addTrackById(track.id!);

    for (var callback in callbacks) {
      callback();
    }
  }
}

class TrackOptionAddToPlaylist extends ITrackOption {
  @override
  Icon get icon => const Icon(Icons.playlist_add);

  @override
  String get title => 'Add to playlist';

  @override
  String get description => 'Add this track to a playlist';

  TrackOptionAddToPlaylist(TrackReadDto track) : super(track);

  @override
  Future execute() async {
    print('Adding to playlist');

    for (var callback in callbacks) {
      callback();
    }
  }
}

class TrackOptionGotoArtist extends ITrackOption {
  @override
  Icon get icon => const Icon(Icons.person);

  @override
  String get title => 'Go to artist';

  @override
  String get description => 'View the artist of this track';

  TrackOptionGotoArtist(TrackReadDto track) : super(track);

  @override
  Future execute() async {
    Get.find<DesktopApplicationController>()
        .getCurrentPageKey()!
        .currentState!
        .pushNamed("/circle/${track.album!.albumArtist!.first.id}");

    for (var callback in callbacks) {
      callback();
    }
  }
}

class TrackOptionGotoAlbum extends ITrackOption {
  @override
  Icon get icon => const Icon(Icons.album);

  @override
  String get title => 'Go to album';

  @override
  String get description => 'View the album of this track';

  TrackOptionGotoAlbum(TrackReadDto track) : super(track);

  @override
  Future<void> execute() async {
    Get.find<DesktopApplicationController>()
        .getCurrentPageKey()!
        .currentState!
        .pushNamed("/album/${track.album!.id}");

    for (var callback in callbacks) {
      callback();
    }
  }
}
