import 'package:audio_service/audio_service.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/global_configuration.dart';
import 'package:tlmc_player_app/models/oidc_configuration.dart';
import 'package:tlmc_player_app/routes/routes.dart';
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
import 'package:tlmc_player_app/views/mobile/mobile_application.dart'; // Provides [Player], [Media], [Playlist] etc.
// Provides [VideoController] & [Video] etc.

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
  Get.put<FluroRouter>(FluroRouter()).defineRoutes();

  // Initialize services
  Get.put<OidcAuthenticationService>(OidcAuthenticationService(
      oidcConfiguration: OidcConfiguration(
    oidcRealmUrl: GlobalConfiguration.SSO_ENDPOINT,
    clientId: GlobalConfiguration.SSO_CLIENT_ID,
  )));

  Get.put<ApiClientProvider>(ApiClientProvider());

  Get.put<RadioService>(RadioService());
  Get.put<IPlaylistService>(OndemandPlaylistService());

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
      title: 'ABC',
      theme: FlexThemeData.light(
        fontFamily: 'FiraCode',
        scheme: FlexScheme.greenM3,
        useMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        fontFamily: 'FiraCode',
        scheme: FlexScheme.verdunHemlock,
        useMaterial3: true,
      ),
      // Depending on screen size, show either mobile or desktop application
      home: ScreenSizeDependent(
        desktopScreen: DesktopApplication(),
        mobileScreen: MobileApplication(),
      ),
    );
  }
}
