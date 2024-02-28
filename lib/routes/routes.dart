import 'package:fluro/fluro.dart';
import 'package:tlmc_player_app/views/desktop/screens/album_screen_desktop.dart';
import 'package:tlmc_player_app/views/desktop/screens/artist_screen_desktop.dart';
import 'package:tlmc_player_app/views/desktop/screens/audio_test_screen_desktop.dart';
import 'package:tlmc_player_app/views/desktop/screens/playlist_screen_desktop.dart';
import 'package:tlmc_player_app/views/desktop/screens/queue_screen_desktop.dart';

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
      '/circle/:circleId',
      handler: Handler(
        handlerFunc: (context, parameters) {
          return ArtistScreenDesktop(
            artistId: parameters['circleId']![0],
          );
        },
      ),
    );

    define(
      '/playlist/:playlistId',
      handler: Handler(
        handlerFunc: (context, parameters) {
          return PlaylistScreenDesktop(
            playlistId: parameters['playlistId']![0],
          );
        },
      ),
    );

    define(
      '/queue',
      handler: Handler(
        handlerFunc: (context, parameters) {
          return QueueSceenDesktop();
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
