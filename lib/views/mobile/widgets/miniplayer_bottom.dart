import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/utils/duration_utils.dart';

final playerExpandProgressPerc = 0.0.obs;
double valueFromPercentageInRange(
    {required final double min, max, percentage}) {
  return percentage * (max - min) + min;
}

double percentageFromValueInRange({required final double min, max, value}) {
  return (value - min) / (max - min);
}

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
        if (queueService.currentIndex.value == -1) {
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
              elevation: 5,
              backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            ),
          ],
        );
      },
    );
  }
}

class MiniplayerExpandedCurrentlyPlaying extends StatefulWidget {
  const MiniplayerExpandedCurrentlyPlaying({
    super.key,
    required this.perc,
    required this.image,
    required this.height,
    required this.controller,
  });

  final double perc;
  final Image image;
  final double height;
  final MiniplayerController controller;

  @override
  State<MiniplayerExpandedCurrentlyPlaying> createState() =>
      _MiniplayerExpandedCurrentlyPlayingState();
}

class _MiniplayerExpandedCurrentlyPlayingState
    extends State<MiniplayerExpandedCurrentlyPlaying> {
  var _isDragging = false;
  var _dragPosition = 0.0;

  final IAudioService audioService = Get.find<IAudioService>();
  final QueueService queueService = Get.find<QueueService>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final paddingVertical =
        valueFromPercentageInRange(min: 0, max: 42, percentage: widget.perc);
    final double heightWithoutPadding = widget.height - paddingVertical * 2;
    final double imageSize = heightWithoutPadding > (width * 0.7)
        ? (width * 0.7)
        : heightWithoutPadding;
    final paddingLeft = valueFromPercentageInRange(
          min: 0,
          max: MediaQuery.of(context).size.width - imageSize,
          percentage: widget.perc,
        ) /
        2;

    var buttonShuffle = Obx(
      () => IconButton(
        icon: Icon(
          Icons.shuffle,
          color: queueService.isShuffled.value ? null : Colors.grey,
        ),
        iconSize: 30,
        onPressed: () {},
      ),
    );

    var buttonNext = Obx(
      () => IconButton(
        icon: const Icon(Icons.skip_next),
        iconSize: 46,
        onPressed: queueService.queue.isEmpty
            ? null
            : () {
                queueService.playNext();
              },
      ),
    );

    var buttonRepeat = const IconButton(
      icon: Icon(Icons.repeat),
      iconSize: 30,
      onPressed: null,
    );

    var buttonPrevious = Obx(
      () => IconButton(
        icon: const Icon(Icons.skip_previous),
        iconSize: 46,
        onPressed: queueService.hasPrevious
            ? null
            : () {
                queueService.playPrevious();
              },
      ),
    );

    var buttonPlay = StreamBuilder<bool>(
      stream: audioService.isPlaying.stream,
      builder: (context, snapshot) {
        print(
            "PAUS: playerStateStream: ${snapshot.data} | ${audioService.isPlaying.value}");
        if (audioService.isPlaying.value) {
          return IconButton.filledTonal(
            icon: const Icon(Icons.pause),
            iconSize: 46,
            onPressed: () {
              audioService.pause();
            },
          );
        } else {
          return IconButton.filledTonal(
            icon: const Icon(Icons.play_arrow),
            iconSize: 46,
            onPressed: () {
              audioService.resume();
            },
          );
        }
      },
    );

    var progressIndicator = Column(
      children: [
        SliderTheme(
          data: const SliderThemeData(
            trackHeight: 2,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 8,
            ),
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: 12,
            ),
          ),
          child: StreamBuilder<Duration?>(
            stream: audioService.position.stream,
            builder: (context, snapshot) {
              // print(audioController.position);
              // print(audioController.duration);
              var perc = 0.0;
              return Slider(
                value: _isDragging ? _dragPosition : perc,
                onChangeStart: (perc) {
                  print("Change start");

                  setState(() {
                    _isDragging = true;
                    perc = percentageFromValueInRange(
                      min: 0,
                      max: audioService.duration.value!.inMilliseconds
                          .toDouble(),
                      value: audioService.position.value!.inMilliseconds
                          .toDouble(),
                    );

                    _dragPosition = perc;
                  });
                },
                onChangeEnd: (perc) {
                  var val = valueFromPercentageInRange(
                    min: 0,
                    max: audioService.duration.value!.inMilliseconds.toDouble(),
                    percentage: perc,
                  );

                  audioService.seekTo(Duration(milliseconds: val.toInt()));

                  setState(() {
                    _isDragging = false;
                  });
                },
                onChanged: (perc) {
                  setState(() {
                    _dragPosition = perc;
                  });
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 12.0), // TODO: Depends on the device
          child: StreamBuilder<Duration?>(
              stream: audioService.position.stream,
              builder: (context, snapshot) {
                var currentTimeString = '--:--';
                if (audioService.position != null) {
                  currentTimeString =
                      DurationUtils.formatDuration(audioService.position.value);
                }

                var durationString = '--:--';
                if (audioService.duration != null) {
                  durationString =
                      DurationUtils.formatDuration(audioService.duration.value);
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currentTimeString,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey.shade600),
                    ),
                    Text(
                      durationString,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey.shade600),
                    ),
                  ],
                );
              }),
        ),
      ],
    );

    var volumnIndicator = const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.volume_down,
            size: 20,
          ),
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 2,
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 8,
                ),
                overlayShape: RoundSliderOverlayShape(
                  overlayRadius: 12,
                ),
              ),
              child: Slider(value: 0.5, onChanged: null),
            ),
          ),
          Icon(
            Icons.volume_up,
            size: 20,
          ),
        ],
      ),
    );

    var title = RichText(
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: queueService.currentTrack.value!.track.name!.default_,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );

    var artist = GestureDetector(
      onTap: () {},
    );

    return Stack(
      children: [
        Column(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Opacity(
                  opacity: widget.perc,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.chevron_down),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.ellipsis_vertical),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: paddingLeft,
                    top: paddingVertical,
                    bottom: paddingVertical * 0.5),
                child: SizedBox(
                  height: imageSize,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: AspectRatio(aspectRatio: 1, child: widget.image),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Opacity(
                  opacity: widget.perc,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(child: title),
                            Flexible(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: artist,
                            ))
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: progressIndicator,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buttonShuffle,
                                  buttonPrevious,
                                  buttonPlay,
                                  buttonNext,
                                  buttonRepeat,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
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
        color: Theme.of(context).colorScheme.surfaceVariant,
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
                // print(audioController.position);
                // print(audioController.duration);
                var perc = 0.0;

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
