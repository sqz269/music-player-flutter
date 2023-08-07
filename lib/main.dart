import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:BackendClientApi/api.dart';

import 'package:tlmc_player_flutter/layouts/main_layout.dart';
import 'package:tlmc_player_flutter/layouts/parallel_nav.dart';
import 'package:tlmc_player_flutter/states/audio_controller_just_audio.dart';
import 'package:tlmc_player_flutter/states/i_audio_controller.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';
import 'package:tlmc_player_flutter/states/root_context_provider.dart';
import 'package:tlmc_player_flutter/ui_state/appbar_controller.dart';
import 'package:tlmc_player_flutter/views/homepage.dart';
import 'package:tlmc_player_flutter/views/mobile/audio_test_page.dart';
import 'package:tlmc_player_flutter/views/mobile/mobile_album_page.dart';
import 'package:tlmc_player_flutter/views/mobile/mobile_explore.dart';
import 'package:tlmc_player_flutter/views/mobile/mobile_homepage.dart';

Future<void> main() async {
  /// NOTE WITH API MODEL
  /// UUID is not supported by this OAS generator so any UUIDs in the API will
  /// be represented as strings. There is no need to do any conversion as the
  /// generator have already done that but just a note that string id is used

  /// ALSO NOTE: DO NOT ADD TRAILING SLASH TO THE BASE PATH
  Get.put(ApiClient(basePath: "https://api-music.marisad.me"));

  Get.lazyPut<IAudioController>(() => AudioControllerJustAudio());
  Get.lazyPut<QueueController>(() => QueueController());

  Get.lazyPut(() => AppBarController());

  Get.put(RootContextProvider());

  runApp(
    MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 86, 164, 80),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: ParallelNavigationApp(),
    ),
  );
}
