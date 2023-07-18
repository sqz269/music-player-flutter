import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/ui_state/appbar_controller.dart';

class AudioTestPage extends StatefulWidget {
  const AudioTestPage({super.key});

  @override
  State<AudioTestPage> createState() => _AudioTestPageState();
}

class _AudioTestPageState extends State<AudioTestPage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  final playbackEvents = (List<PlaybackEvent>.of([])).obs;
  final playbackError = (List<dynamic>.of([])).obs;

  final trackUuidController = TextEditingController();

  var currentUrl = "HLS URL NOT SET".obs;
  var isPlaying = false.obs;

  @override
  void initState() {
    super.initState();

    if (Get.parameters['trackId'] != null) {
      trackUuidController.text = Get.parameters['trackId']!;
    }

    audioPlayer.playbackEventStream.listen(
      (event) {
        playbackEvents.add(event);
      },
      onError: (error) {
        playbackError.add(error);
      },
    );

    audioPlayer.playerStateStream.listen(
      (event) {
        isPlaying.value = event.playing;
      },
    );

    // audioPlayer.setAudioSource(
    //   HlsAudioSource(
    //     Uri.parse(
    //         "https://api-music.marisad.me/api/asset/track/f2dadcab-c406-4a68-98d2-c328885bfad8"),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        Get.find<AppBarController>().updateFlexibleSpace(
          FlexibleSpaceBar(
            title: RichText(
              text: TextSpan(
                text: "HLS Audio Test Page",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
          ),
        );
      },
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Enter Track UUID",
            ),
            controller: trackUuidController,
          ),
        ),
        FilledButton(
          onPressed: () {
            print(trackUuidController.text);
            var hlsRoot = "https://api-music.marisad.me/api/asset/track/";

            // validate if the input is a valid uuid
            if (!trackUuidController.text.contains(RegExp(
                r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$'))) {
              // show a snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Invalid UUID"),
                ),
              );
              return;
            }

            var hlsUrl = hlsRoot + trackUuidController.text;

            currentUrl.value = hlsUrl;

            audioPlayer.setAudioSource(
              HlsAudioSource(
                Uri.parse(hlsUrl),
              ),
            );
          },
          child: const Text("Load HLS Track"),
        ),
        const Divider(),
        Obx(
          () => Center(
            child: Text(
              currentUrl.value,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Obx(
          () => RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Playing: ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                  text: isPlaying.value.toString(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: 20,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                audioPlayer.pause();
              },
              icon: const Icon(Icons.pause),
            ),
            IconButton.filled(
              onPressed: () {
                audioPlayer.play();
              },
              icon: const Icon(Icons.play_arrow),
            ),
            IconButton(
              onPressed: () {
                audioPlayer.stop();
              },
              icon: const Icon(Icons.stop),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),

        // Total duration
        StreamBuilder<Duration?>(
          stream: audioPlayer.durationStream,
          builder: (context, snapshot) {
            final duration = snapshot.data ?? Duration.zero;
            return Text(
                "Duration: ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}");
          },
        ),

        // Current position
        StreamBuilder<Duration?>(
          stream: audioPlayer.positionStream,
          builder: (context, snapshot) {
            final position = snapshot.data ?? Duration.zero;
            return Text(
                "Position: ${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')}");
          },
        ),

        // Buffer position
        StreamBuilder<Duration?>(
          stream: audioPlayer.bufferedPositionStream,
          builder: (context, snapshot) {
            final bufferedPosition = snapshot.data ?? Duration.zero;
            return Text(
                "Buffered Position: ${bufferedPosition.inMinutes}:${(bufferedPosition.inSeconds % 60).toString().padLeft(2, '0')}");
          },
        ),

        Divider(),

        // States
        StreamBuilder(
            stream: audioPlayer.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              return Text(
                "Player State: ${playerState.toString()}",
                textAlign: TextAlign.center,
              );
            }),

        // Playback events stream
        const Divider(
          height: 20,
        ),
        Text(
          "ERROR LOG",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.red),
        ),
        Obx(
          () => ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: playbackError.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  playbackError[index].toString(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.red,
                      ),
                ),
                dense: true,
              );
            },
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ),

        const Divider(
          height: 20,
        ),
        Text(
          "PLAYBACK EVENTS",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.green),
        ),

        Obx(
          () => ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: playbackEvents.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  playbackEvents[index].toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                dense: true,
              );
            },
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ),

        const Divider(
          height: 20,
        ),
      ],
    );
  }
}
