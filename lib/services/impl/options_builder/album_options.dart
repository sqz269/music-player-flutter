import 'package:flutter/material.dart';
import 'package:tlmc_player_app/services/api/options_builder/i_album_option.dart';

class AlbumOptionPlayNext extends IAlbumOption {
  @override
  Icon get icon => const Icon(Icons.playlist_play);

  @override
  String get title => 'Play next';

  @override
  String get description => 'Play this album next in the queue';

  AlbumOptionPlayNext(String albumId) : super(albumId);

  @override
  Future execute() async {
    print('Playing next');

    for (var callback in callbacks) {
      callback();
    }
  }
}

class AlbumOptionAddToQueue extends IAlbumOption {
  @override
  Icon get icon => const Icon(Icons.queue_music);

  @override
  String get title => 'Add to queue';

  @override
  String get description => 'Add this album to the end of queue';

  AlbumOptionAddToQueue(String albumId) : super(albumId);

  @override
  Future execute() async {
    print('Adding to queue');

    for (var callback in callbacks) {
      callback();
    }
  }
}
