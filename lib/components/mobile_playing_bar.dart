import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';
import 'package:tlmc_player_flutter/states/audio_controller.dart';

class MobilePlayingBar extends StatelessWidget {
  const MobilePlayingBar({super.key});

  @override
  Widget build(BuildContext context) {
    // don't build if there is no current track
    if (QueueController.to.currentTrack.value == null) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 64,
      child: Row(
        // Album image
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://api-music.marisad.me/api/asset/66ee1a2a-b6ec-40d7-9de6-26c460068f32"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() => Text(
                        QueueController
                            .to.currentTrack.value!.track.name!.default_,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  Obx(
                    () => Text(
                      QueueController.to.currentTrack.value!.track.album!
                          .albumArtist!.first.name!,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // TODO: Disable button if there is no previous track
          IconButton(
            onPressed: () {
              QueueController.to.playPrevious();
            },
            icon: const Icon(Icons.skip_previous),
            iconSize: 24,
          ),
          IconButton(
            onPressed: () {},
            icon: Obx(() {
              if (AudioController.to.paused.value) {
                return const Icon(Icons.play_arrow);
              } else {
                return const Icon(Icons.pause);
              }
            }),
            iconSize: 24,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.skip_next),
            iconSize: 24,
          ),
        ],
      ),
    );
  }
}
