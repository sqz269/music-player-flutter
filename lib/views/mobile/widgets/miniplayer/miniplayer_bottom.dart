import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/utils/duration_utils.dart';
import 'package:tlmc_player_app/utils/utils.dart';
import 'package:tlmc_player_app/views/mobile/widgets/miniplayer/miniplayer_bottom_expanded.dart';

final playerExpandProgressPerc = 0.0.obs;

class MobileMiniplayerBar extends StatefulWidget {
  const MobileMiniplayerBar({super.key});

  @override
  State<MobileMiniplayerBar> createState() => _MobileMiniplayerBarState();
}

class _MobileMiniplayerBarState extends State<MobileMiniplayerBar> {
  final MiniplayerController _miniplayerController = MiniplayerController();

  final QueueService queueService = Get.find<QueueService>();

  @override
  void initState() {
    super.initState();
    queueService.currentTrack.stream.listen(
      (event) {
        print(event);
      },
    );

    playerExpandProgressPerc.stream.listen(
      (event) {
        print(event);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (!Utils.isMiniplayerVisible()) {
          return const SizedBox.shrink();
        }

        var image = Image.network(
          queueService.currentTrack.value!.track.album!.thumbnail!.large!.url!,
        );

        return Stack(
          children: [
            Miniplayer(
              minHeight: 66,
              maxHeight: MediaQuery.of(context).size.height,
              onDismissed: () {
                queueService.clearQueue();
              },
              controller: _miniplayerController,
              builder: (height, perc) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  playerExpandProgressPerc.value = perc;
                });

                var elementOpacity = 1 - perc * 10;

                if (perc < 0.1) {
                  return MiniplayerTileCurrentlyPlaying(
                      image: image, elementOpacity: elementOpacity);
                }

                return SafeArea(
                  top: perc >= 0.8,
                  child: MiniplayerExpandedCurrentlyPlaying(
                      perc: perc,
                      image: image,
                      height: height,
                      controller: _miniplayerController),
                );
              },
              elevation: 6,
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
          ],
        );
      },
    );
  }
}

class MiniplayerTileCurrentlyPlaying extends StatelessWidget {
  const MiniplayerTileCurrentlyPlaying({
    super.key,
    required this.image,
    required this.elementOpacity,
  });

  final Image image;
  final double elementOpacity;

  @override
  Widget build(BuildContext context) {
    var audioService = Get.find<IAudioService>();
    var queueService = Get.find<QueueService>();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        image: DecorationImage(
                          image: image.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Opacity(
                    opacity: elementOpacity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            queueService
                                .currentTrack.value!.track.name!.default_,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            queueService.currentTrack.value!.track.album!
                                .albumArtist![0].name!,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.grey.shade700),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: elementOpacity,
                  child: StreamBuilder<bool>(
                    stream: audioService.isPlaying.stream,
                    builder: (context, snapshot) {
                      print(
                          "PAUS: playerStateStream: ${snapshot.data} | ${audioService.isPlaying.value}");
                      if (snapshot.data == true) {
                        return IconButton(
                          onPressed: () {
                            audioService.pause();
                          },
                          icon: const Icon(Icons.pause),
                        );
                      } else {
                        return IconButton(
                          onPressed: () {
                            audioService.resume();
                          },
                          icon: const Icon(Icons.play_arrow),
                        );
                      }
                    },
                  ),
                ),
                Opacity(
                  opacity: elementOpacity,
                  child: IconButton(
                    onPressed: () {
                      queueService.playNext();
                    },
                    icon: const Icon(Icons.skip_next),
                  ),
                ),
              ],
            ),
          ),
          Opacity(
            opacity: elementOpacity,
            child: StreamBuilder<Duration?>(
              stream: audioService.position.stream,
              builder: (context, snapshot) {
                var perc = 0.0;
                if (audioService.duration.value != null) {
                  perc = Utils.percentageFromValueInRange(
                      min: 0,
                      max: audioService.duration.value!.inMilliseconds
                          .toDouble(),
                      value: audioService.position.value!.inMilliseconds
                          .toDouble());
                }

                return LinearProgressIndicator(
                  value: perc,
                  minHeight: 2,
                  backgroundColor: Colors.grey.shade400,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.secondary,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
