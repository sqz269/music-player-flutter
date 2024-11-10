import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/views/controllers/common/application_controller.dart';

class PlaylistIconTileDesktop extends StatelessWidget {
  final String playlistName;
  final String playlistId;
  final Icon? icon;

  const PlaylistIconTileDesktop({
    super.key,
    required this.playlistName,
    required this.playlistId,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var icon = this.icon ?? const Icon(Icons.playlist_play);

    return Material(
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: () {
          var desktopContext = Get.find<ApplicationController>();
          desktopContext.getCurrentPageKey()!.currentState!.pushNamed(
                '/playlist/$playlistId',
              );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 24),
              Text(playlistName),
            ],
          ),
        ),
      ),
    );
  }
}
