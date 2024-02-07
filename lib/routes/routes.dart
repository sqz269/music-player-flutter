import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tlmc_player_app/views/desktop/screens/album_screen_desktop.dart';
import 'package:tlmc_player_app/views/desktop/screens/audio_test_screen_desktop.dart';

extension FluroRouterExtension on FluroRouter {
  void defineRoutes() {
    // Define routes here
    define(
      '/album/:albumId',
      handler: Handler(
        handlerFunc: (context, parameters) {
          return AlbumScreenDesktop(
            albumId: parameters['albumId']![0],
          );
        },
      ),
    );

    define(
      '/debug/audio/:trackId',
      handler: Handler(
        handlerFunc: (context, parameters) {
          return AudioTestScreenDesktop(
            trackId: parameters['trackId']![0],
          );
        },
      ),
    );
  }
}
