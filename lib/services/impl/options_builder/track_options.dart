import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/api/options_builder/i_album_option.dart';
import 'package:tlmc_player_app/services/api/options_builder/i_track_option.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';

class TrackOptionPlayNext extends ITrackOption {
  @override
  Icon get icon => const Icon(Icons.playlist_play);

  @override
  String get title => 'Play next';

  @override
  String get description => 'Play this track next in the queue';

  TrackOptionPlayNext(String trackId) : super(trackId);

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

  TrackOptionAddToQueue(String trackId) : super(trackId);

  @override
  Future execute() async {
    var queueService = Get.find<QueueService>();
    queueService.addTrackById(trackId);

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

  TrackOptionAddToPlaylist(String trackId) : super(trackId);

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

  TrackOptionGotoArtist(String trackId) : super(trackId);

  @override
  Future execute() async {
    print('Going to artist');

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

  TrackOptionGotoAlbum(String trackId) : super(trackId);

  @override
  Future execute() async {
    print('Going to album');

    for (var callback in callbacks) {
      callback();
    }
  }
}
