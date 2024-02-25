import 'package:context_menus/context_menus.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/models/oidc_configuration.dart';
import 'package:tlmc_player_app/routes/routes.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';
import 'package:tlmc_player_app/services/impl/audio_services/just_audio_audio_service.dart';
import 'package:tlmc_player_app/services/impl/audio_services/media_kit_audio_service.dart';
import 'package:tlmc_player_app/services/impl/authentication_service.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/services/impl/radio_service.dart';
import 'package:tlmc_player_app/views/desktop/desktop_application.dart';

import 'package:media_kit/media_kit.dart'; // Provides [Player], [Media], [Playlist] etc.
// Provides [VideoController] & [Video] etc.

void main() {
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

  // Initialize routes
  logger.i("Initializing routes");
  Get.put<FluroRouter>(FluroRouter()).defineRoutes();

  // Initialize services
  Get.put<OidcAuthenticationService>(OidcAuthenticationService(
      oidcConfiguration: OidcConfiguration(
    oidcRealmUrl: "https://sso.marisad.me/realms/MusicPlayer",
    clientId: "localhost-flutter-nUCH1cAFywtQW6fDWkbbiL6UQcUZq",
  )));
  Get.put<ApiClientProvider>(ApiClientProvider());
  Get.put<QueueService>(QueueService());
  Get.put<RadioService>(RadioService());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexThemeData.light(
        scheme: FlexScheme.jungle,
        useMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.verdunHemlock,
        useMaterial3: true,
      ),
      home: DesktopApplication(),
    );
  }
}
