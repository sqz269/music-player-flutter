import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlmc_player_app/views/common/screen_size_dependent.dart';
import 'package:tlmc_player_app/views/desktop/screens/album_screen_desktop.dart';
import 'package:tlmc_player_app/views/desktop/screens/artist_screen_desktop.dart';
import 'package:tlmc_player_app/views/desktop/screens/playlist_screen_desktop.dart';
import 'package:tlmc_player_app/views/mobile/screens/album_screen_mobile.dart';

var GoRouterCommonRoutes = <RouteBase>[
  GoRoute(
    path: '/album/:albumId',
    builder: (BuildContext context, GoRouterState state) => ScreenSizeDependent(
      mobileScreen: AlbumScreenMobile(
        albumId: state.pathParameters['albumId']!,
      ),
      desktopScreen: AlbumScreenDesktop(
        albumId: state.pathParameters['albumId']!,
      ),
    ),
  ),
  GoRoute(
    path: '/circle/:circleId',
    builder: (BuildContext context, GoRouterState state) => ArtistScreenDesktop(
      artistId: state.pathParameters['circleId']!,
    ),
  ),
  GoRoute(
    path: '/playlist/:playlistId',
    builder: (BuildContext context, GoRouterState state) {
      return PlaylistScreenDesktop(
        playlistId: state.pathParameters['playlistId']!,
      );
    },
  ),
];
