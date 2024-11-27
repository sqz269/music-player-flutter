import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';

class Utils {
  static bool isMiniplayerVisible() {
    final queueService = Get.find<QueueService>();

    return queueService.currentTrack.value != null;
  }

  static void showSnackBar(ScaffoldMessengerState messenger, String message,
      {bool avoidMiniplayer = true}) {
    avoidMiniplayer = isMiniplayerVisible() && avoidMiniplayer;
    print('avoidMiniplayer: $avoidMiniplayer');
    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        margin: EdgeInsets.fromLTRB(16, 0, 16, avoidMiniplayer ? 80 : 0),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
