import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:BackendClientApi/api.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:tlmc_player_flutter/layouts/parallel_nav.dart';
import 'package:tlmc_player_flutter/services/oidc_authenticator_service.dart';
import 'package:tlmc_player_flutter/states/audio_controller_just_audio.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';
import 'package:tlmc_player_flutter/states/root_context_provider.dart';
import 'package:tlmc_player_flutter/states/just_audio_background_cust_queue.dart';

Future<void> main() async {
  // debugRepaintRainbowEnabled = true;
  // debugRepaintTextRainbowEnabled = true;

  /// NOTE WITH API MODEL
  /// UUID is not supported by this OAS generator so any UUIDs in the API will
  /// be represented as strings. There is no need to do any conversion as the
  /// generator have already done that but just a note that string id is used

  /// ALSO NOTE: DO NOT ADD TRAILING SLASH TO THE BASE PATH
  Get.put(ApiClient(basePath: "https://api-music.marisad.me"));

  Get.lazyPut<AudioControllerJustAudio>(() => AudioControllerJustAudio());
  Get.lazyPut<QueueController>(() => QueueController());
  Get.put(RootContextProvider());

  Get.put(
    OidcAuthenticatorService(
        oidcDiscoveryEndpoint: "https://sso.marisad.me/realms/MusicPlayer",
        clientId: "localhost-flutter-nUCH1cAFywtQW6fDWkbbiL6UQcUZq"),
    permanent: true,
  );

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );

  runApp(
    MaterialApp(
      title: 'TLMC Player',
      theme: FlexThemeData.light(
        scheme: FlexScheme.redWine,
        useMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.green,
        useMaterial3: true,
      ),
      home: ParallelNavigationApp(),
    ),
  );
}
