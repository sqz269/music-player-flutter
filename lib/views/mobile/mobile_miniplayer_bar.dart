import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/states/i_audio_controller.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';
import 'package:tlmc_player_flutter/states/audio_controller_just_audio.dart';
import 'package:miniplayer/miniplayer.dart';

class MobileMiniplayerBar extends StatelessWidget {
  const MobileMiniplayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    // // don't build if there is no current track
    // if (QueueController.to.currentTrack.value == null) {
    //   return const SizedBox.shrink();
    // }
    if (QueueController.to.currentTrack.value == null) {
      print("Shrink");
      return const SizedBox.shrink();
    }

    return Miniplayer(
      // controller: MiniplayerController(),
      minHeight: 66,
      maxHeight: MediaQuery.of(context).size.height,
      onDismissed: () {},
      builder: (height, perc) {
        print("Height: $height Perc: $perc");
        if (perc < 0.1) {
          return Column(
            children: [
              ListTile(
                dense: true,
                leading: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    QueueController.to.currentTrack.value!.track.album!
                        .thumbnail!.medium!.url!,
                  ),
                ),
                title: Obx(
                  () => Text(
                    QueueController.to.currentTrack.value!.track.name!.default_,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Text(QueueController
                    .to.currentTrack.value!.track.album!.albumArtist![0].name!),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow),
                ),
              ),
              LinearProgressIndicator(
                value: 0.5,
                minHeight: 2,
              )
            ],
          );
        }

        return const SizedBox(
          child: Text("data"),
        );
      },
      elevation: 5,
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
    );
  }
}
