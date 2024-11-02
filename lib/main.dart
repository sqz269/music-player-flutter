// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlmc_player_app/services/impl/static_data_provider.dart';
import 'package:tlmc_player_app/views/mobile/screens/album_screen_mobile.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/global_configuration.dart';
import 'package:tlmc_player_app/models/oidc_configuration.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/services/api/i_media_session_sevice.dart';
import 'package:tlmc_player_app/services/api/i_playlist_service.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';
import 'package:tlmc_player_app/services/impl/audio_services/just_audio_audio_service.dart';
import 'package:tlmc_player_app/services/impl/audio_services/media_kit_audio_service.dart';
import 'package:tlmc_player_app/services/impl/authentication_service.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';
import 'package:tlmc_player_app/services/impl/media_session_services/cross_platform_media_session_service.dart';
import 'package:tlmc_player_app/services/impl/media_session_services/windows_smtc_media_session_service.dart';
import 'package:tlmc_player_app/services/impl/playlist_services/ondemand_playlist_service.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/services/impl/radio_service.dart';
import 'package:tlmc_player_app/views/common/screen_size_dependent.dart';
import 'package:tlmc_player_app/views/desktop/desktop_application.dart';

import 'package:media_kit/media_kit.dart';
import 'package:tlmc_player_app/views/mobile/screens/explore_screen_mobile.dart';
import 'package:tlmc_player_app/views/mobile/screens/home_screen_mobile.dart';
import 'package:tlmc_player_app/views/mobile/screens/radio_screen_mobile.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

// This example demonstrates how to setup nested navigation using a
// BottomNavigationBar, where each bar item uses its own persistent navigator,
// i.e. navigation state is maintained separately for each item. This setup also
// enables deep linking into nested pages.

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();

  // Logging First
  Get.put<LoggingService>(LoggingService.createLogger());

  var logger = Get.find<LoggingService>().getLogger("Initialization");

  logger.i("Initializing application");

  // Initialize audio service based on running platform
  if (GetPlatform.isDesktop || GetPlatform.isWeb) {
    logger.i("Desktop | Web platform detected. Using MediaKitAudioService.");
    Get.put<IAudioService>(MediaKitAudioService());
  } else {
    logger.i("Mobile platform detected. Using JustAudioAudioService.");
    Get.put<IAudioService>(JustAudioAudioService());
  }

  Get.put<QueueService>(QueueService());

  // Initialize Media Session services based on running platform
  if (GetPlatform.isWindows) {
    logger.i("Windows platform detected. Using SMTC Media Session Service.");
    Get.put<IMediaSessionService>(WindowsSmtcMediaSessionService());
  } else {
    logger.i(
        "Non-Windows platform detected. Using Cross-platform Media Session service (Implementor audio_session package).");
    Get.put<IMediaSessionService>(CrossPlatformMediaSessionService());
    var audioHandler = await AudioService.init(
      builder: () => Get.find<IMediaSessionService>() as BaseAudioHandler,
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.sqz269.tlmc_player_app',
        androidNotificationChannelName: 'Test',
      ),
    );
  }

  // Initialize routes
  logger.i("Initializing routes");
  // Initialize services
  Get.put<OidcAuthenticationService>(OidcAuthenticationService(
      oidcConfiguration: OidcConfiguration(
    oidcRealmUrl: GlobalConfiguration.SSO_ENDPOINT,
    clientId: GlobalConfiguration.SSO_CLIENT_ID,
  )));

  Get.put<ApiClientProvider>(ApiClientProvider());

  Get.put<RadioService>(RadioService());
  Get.put<IPlaylistService>(OndemandPlaylistService());
  Get.put<StaticDataProvider>(StaticDataProvider());

  runApp(NestedTabNavigationExampleApp());
}

/// An example demonstrating how to use nested navigators
class NestedTabNavigationExampleApp extends StatelessWidget {
  /// Creates a NestedTabNavigationExampleApp
  NestedTabNavigationExampleApp({super.key});

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: <RouteBase>[
      // #docregion configuration-builder
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          // Return the widget that implements the custom shell (in this case
          // using a BottomNavigationBar). The StatefulNavigationShell is passed
          // to be able access the state of the shell and to navigate to other
          // branches in a stateful way.
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        // #enddocregion configuration-builder
        // #docregion configuration-branches
        branches: <StatefulShellBranch>[
          // The route branch for the first tab of the bottom navigation bar.
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                // The screen to display as the root in the first tab of the
                // bottom navigation bar.
                path: '/home',
                builder: (BuildContext context, GoRouterState state) =>
                    ScreenSizeDependent(
                  mobileScreen: HomeScreenMobile(),
                  desktopScreen: DesktopApplication(),
                ),
                routes: <RouteBase>[
                  // The details screen to display stacked on navigator of the
                  // first tab. This will cover screen A but not the application
                  // shell (bottom navigation bar).
                  GoRoute(
                    path: 'album/:albumId',
                    name: 'home_album',
                    builder: (context, state) {
                      return AlbumScreenMobile(
                          albumId: state.pathParameters['albumId']!);
                    },
                  ),
                ],
              ),
            ],
          ),
          // #enddocregion configuration-branches

          // The route branch for the second tab of the bottom navigation bar.
          StatefulShellBranch(
            // It's not necessary to provide a navigatorKey if it isn't also
            // needed elsewhere. If not provided, a default key will be used.
            routes: <RouteBase>[
              GoRoute(
                // The screen to display as the root in the second tab of the
                // bottom navigation bar.
                path: '/explore',
                builder: (BuildContext context, GoRouterState state) =>
                    const ExploreScreenMobile(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'radio',
                    name: 'explore_radio',
                    builder: (BuildContext context, GoRouterState state) =>
                        const RadioScreenMobile(),
                  ),
                ],
              ),
            ],
          ),
          // The route branch for the third tab of the bottom navigation bar.
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                // The screen to display as the root in the third tab of the
                // bottom navigation bar.
                path: '/library',
                builder: (BuildContext context, GoRouterState state) =>
                    const Placeholder(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) =>
                        DetailsScreen(
                      label: 'C',
                      extra: state.extra,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  // #docregion configuration-custom-shell
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The StatefulNavigationShell from the associated StatefulShellRoute is
      // directly passed as the body of the Scaffold.
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        // Here, the items of BottomNavigationBar are hard coded. In a real
        // world scenario, the items would most likely be generated from the
        // branches of the shell route, which can be fetched using
        // `navigationShell.route.branches`.
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Section A'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Section B'),
          BottomNavigationBarItem(icon: Icon(Icons.tab), label: 'Section C'),
        ],
        currentIndex: navigationShell.currentIndex,
        // Navigate to the current location of the branch at the provided index
        // when tapping an item in the BottomNavigationBar.
        onTap: (int index) => navigationShell.goBranch(index),
      ),
    );
  }
  // #enddocregion configuration-custom-shell

  /// NOTE: For a slightly more sophisticated branch switching, change the onTap
  /// handler on the BottomNavigationBar above to the following:
  /// `onTap: (int index) => _onTap(context, index),`
  // ignore: unused_element
  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

/// Widget for the root/initial pages in the bottom navigation bar.
class RootScreen extends StatelessWidget {
  /// Creates a RootScreen
  const RootScreen({
    required this.label,
    required this.detailsPath,
    this.secondDetailsPath,
    super.key,
  });

  /// The label
  final String label;

  /// The path to the detail page
  final String detailsPath;

  /// The path to another detail page
  final String? secondDetailsPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Root of section $label'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Screen $label',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go(detailsPath, extra: '$label-XYZ');
              },
              child: const Text('View details'),
            ),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/album');
              },
              child: const Text('Album'),
            ),
            const Padding(padding: EdgeInsets.all(4)),
            if (secondDetailsPath != null)
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go(secondDetailsPath!);
                },
                child: const Text('View more details'),
              ),
          ],
        ),
      ),
    );
  }
}

/// The details screen for either the A or B screen.
class DetailsScreen extends StatefulWidget {
  /// Constructs a [DetailsScreen].
  const DetailsScreen({
    required this.label,
    this.param,
    this.extra,
    this.withScaffold = true,
    super.key,
  });

  /// The label to display in the center of the screen.
  final String label;

  /// Optional param
  final String? param;

  /// Optional extra object
  final Object? extra;

  /// Wrap in scaffold
  final bool withScaffold;

  @override
  State<StatefulWidget> createState() => DetailsScreenState();
}

/// The state for DetailsScreen
class DetailsScreenState extends State<DetailsScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.withScaffold) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Details Screen - ${widget.label}'),
        ),
        body: _build(context),
      );
    } else {
      return ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: _build(context),
      );
    }
  }

  Widget _build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Details for ${widget.label} - Counter: $_counter',
              style: Theme.of(context).textTheme.titleLarge),
          const Padding(padding: EdgeInsets.all(4)),
          TextButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: const Text('Increment counter'),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          if (widget.param != null)
            Text('Parameter: ${widget.param!}',
                style: Theme.of(context).textTheme.titleMedium),
          const Padding(padding: EdgeInsets.all(8)),
          if (widget.extra != null)
            Text('Extra: ${widget.extra!}',
                style: Theme.of(context).textTheme.titleMedium),
          if (!widget.withScaffold) ...<Widget>[
            const Padding(padding: EdgeInsets.all(16)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: const Text('< Back',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ]
        ],
      ),
    );
  }
}
