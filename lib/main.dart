import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/routes/routes.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';
import 'package:tlmc_player_app/services/impl/audio_services/just_audio_audio_service.dart';
import 'package:tlmc_player_app/services/impl/audio_services/media_kit_audio_service.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/views/desktop/desktop_application.dart';

import 'package:media_kit/media_kit.dart'; // Provides [Player], [Media], [Playlist] etc.
import 'package:media_kit_video/media_kit_video.dart'; // Provides [VideoController] & [Video] etc.

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();

  // Logging First
  Get.put<LoggingService>(LoggingService.createLogger());

  var _logger = Get.find<LoggingService>().getLogger("Initialization");

  _logger.i("Initializing application");

  // Initialize audio service based on running platform
  if (GetPlatform.isDesktop || GetPlatform.isWeb) {
    _logger.i("Desktop | Web platform detected. Using MediaKitAudioService.");
    Get.put<IAudioService>(MediaKitAudioService());
  } else {
    _logger.i("Mobile platform detected. Using JustAudioAudioService.");
    Get.put<IAudioService>(JustAudioAudioService());
  }

  // Initialize routes
  _logger.i("Initializing routes");
  Get.put<FluroRouter>(FluroRouter()).defineRoutes();

  // Initialize services
  Get.put<ApiClientProvider>(ApiClientProvider());
  Get.put<QueueService>(QueueService());

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
