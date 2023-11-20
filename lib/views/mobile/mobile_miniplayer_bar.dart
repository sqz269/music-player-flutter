import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/layouts/parallel_nav.dart';
import 'package:tlmc_player_flutter/states/audio_controller_just_audio.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';
import 'package:tlmc_player_flutter/utils/utils.dart';
import 'package:tlmc_player_flutter/views/mobile/mobile_miniplayer_queue_sheet.dart';
import 'package:miniplayer/miniplayer.dart';

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

  final QueueController queueController = Get.find<QueueController>();

  @override
  void initState() {
    super.initState();
    queueController.currentlyPlaying.stream.listen(
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
        if (queueController.playingIndex.value == -1) {
          return const SizedBox.shrink();
        }

        var image = Image.network(
          queueController
              .currentlyPlaying.value!.track.album!.thumbnail!.large!.url!,
        );

        return Stack(
          children: [
            Miniplayer(
              minHeight: 66,
              maxHeight: MediaQuery.of(context).size.height,
              onDismissed: () {
                queueController.clearQueue();
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

  final AudioControllerJustAudio audioController =
      Get.find<AudioControllerJustAudio>();

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
          color: QueueController.to.isShuffled.value ? null : Colors.grey,
        ),
        iconSize: 30,
        onPressed: () {
          QueueController.to.toggleShuffle();
        },
      ),
    );

    var buttonNext = Obx(
      () => IconButton(
        icon: const Icon(Icons.skip_next),
        iconSize: 46,
        onPressed: QueueController.to.queue.isEmpty
            ? null
            : () {
                QueueController.to.playNext();
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
        onPressed: QueueController.to.hasPrevious
            ? null
            : () {
                QueueController.to.playPrevious();
              },
      ),
    );

    var buttonPlay = StreamBuilder<bool>(
      stream: audioController.isPlayingStream,
      builder: (context, snapshot) {
        print(
            "PAUS: playerStateStream: ${snapshot.data} | ${audioController.isPlaying}");
        if (audioController.isPlaying) {
          return IconButton.filledTonal(
            icon: const Icon(Icons.pause),
            iconSize: 46,
            onPressed: () {
              audioController.pause();
            },
          );
        } else {
          return IconButton.filledTonal(
            icon: const Icon(Icons.play_arrow),
            iconSize: 46,
            onPressed: () {
              audioController.resume();
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
            stream: audioController.positionStream,
            builder: (context, snapshot) {
              // print(audioController.position);
              // print(audioController.duration);
              var perc = 0.0;
              if (audioController.processingState != ProcessingState.idle &&
                  audioController.processingState != ProcessingState.loading &&
                  audioController.duration != null &&
                  audioController.position != null) {
                perc = percentageFromValueInRange(
                  min: 0,
                  max: audioController.duration!.inMilliseconds.toDouble(),
                  value: audioController.position!.inMilliseconds.toDouble(),
                );
              }
              return Slider(
                value: _isDragging ? _dragPosition : perc,
                onChangeStart: (perc) {
                  print("Change start");

                  setState(() {
                    _isDragging = true;
                    perc = percentageFromValueInRange(
                      min: 0,
                      max: audioController.duration!.inMilliseconds.toDouble(),
                      value:
                          audioController.position!.inMilliseconds.toDouble(),
                    );

                    _dragPosition = perc;
                  });
                },
                onChangeEnd: (perc) {
                  var val = valueFromPercentageInRange(
                    min: 0,
                    max: audioController.duration!.inMilliseconds.toDouble(),
                    percentage: perc,
                  );

                  audioController.seekTo(Duration(milliseconds: val.toInt()));

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
          padding: EdgeInsets.symmetric(
              horizontal: 12.0), // TODO: Depends on the device
          child: StreamBuilder<Duration?>(
              stream: audioController.positionStream,
              builder: (context, snapshot) {
                var currentTimeString = '--:--';
                if (audioController.position != null) {
                  currentTimeString =
                      Util.durationToHumanMmss(audioController.position!);
                }

                var durationString = '--:--';
                if (audioController.duration != null) {
                  durationString =
                      Util.durationToHumanMmss(audioController.duration!);
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

    var volumnIndicator = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.volume_down,
            size: 20,
          ),
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 2,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 8,
                ),
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 12,
                ),
              ),
              child: Slider(value: 0.5, onChanged: null),
            ),
          ),
          const Icon(
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
        text: QueueController.to.currentlyPlaying.value!.track.name!.default_,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );

    var artist = GestureDetector(
      onTap: () {
        widget.controller.animateToHeight(state: PanelState.MIN);
        var navContext = Get.find<NavigationContextProvider>();
        navContext.currentContext.currentState!.pushNamed(
          '/circle',
          arguments: {
            'circleId': QueueController
                .to.currentlyPlaying.value!.track.album!.albumArtist![0].id!,
          },
        );
      },
      child: RichText(
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: QueueController
              .to.currentlyPlaying.value!.track.album!.albumArtist!
              .map((e) => e.name!)
              .join(", "),
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.grey.shade700),
        ),
      ),
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
                        icon: Icon(CupertinoIcons.chevron_down),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.ellipsis_vertical),
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
                          padding: EdgeInsets.symmetric(vertical: 12.0),
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
        MiniplayerQueueBottomSheet(
          perc: 1,
        )
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
    var audioController = Get.find<AudioControllerJustAudio>();
    var queueController = Get.find<QueueController>();

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
                            QueueController.to.currentlyPlaying.value!.track
                                .name!.default_,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            QueueController.to.currentlyPlaying.value!.track
                                .album!.albumArtist![0].name!,
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
                    stream: audioController.isPlayingStream,
                    builder: (context, snapshot) {
                      print(
                          "PAUS: playerStateStream: ${snapshot.data} | ${audioController.isPlaying}");
                      if (snapshot.data == true) {
                        return IconButton(
                          onPressed: () {
                            audioController.pause();
                          },
                          icon: const Icon(Icons.pause),
                        );
                      } else {
                        return IconButton(
                          onPressed: () {
                            audioController.resume();
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
                      queueController.playNext();
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
              stream: audioController.positionStream,
              builder: (context, snapshot) {
                // print(audioController.position);
                // print(audioController.duration);
                var perc = 0.0;
                if (audioController.processingState != ProcessingState.idle &&
                    audioController.processingState !=
                        ProcessingState.loading &&
                    audioController.duration != null &&
                    audioController.position != null) {
                  perc = percentageFromValueInRange(
                    min: 0,
                    max: audioController.duration!.inMilliseconds.toDouble(),
                    value: audioController.position!.inMilliseconds.toDouble(),
                  );
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
