import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/utils/duration_utils.dart';
import 'package:tlmc_player_app/utils/utils.dart';

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

  List<Widget> _buildButtons() {
    var buttons = <Widget>[];
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

    buttons.add(buttonShuffle);
    buttons.add(buttonPrevious);
    buttons.add(buttonPlay);
    buttons.add(buttonNext);
    buttons.add(buttonRepeat);

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final paddingVertical = Utils.valueFromPercentageInRange(
        min: 0, max: 42, percentage: widget.perc);
    final double heightWithoutPadding = widget.height - paddingVertical * 2;
    final double imageSize = heightWithoutPadding > (width * 0.7)
        ? (width * 0.7)
        : heightWithoutPadding;
    final paddingLeft = Utils.valueFromPercentageInRange(
          min: 0,
          max: MediaQuery.of(context).size.width - imageSize,
          percentage: widget.perc,
        ) /
        2;

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
              var perc = 0.0;
              if (audioService.duration.value != null) {
                perc = Utils.percentageFromValueInRange(
                  min: 0,
                  max: audioService.duration.value!.inMilliseconds.toDouble(),
                  value: audioService.position.value!.inMilliseconds.toDouble(),
                );
              }
              return Slider(
                value: _isDragging ? _dragPosition : perc,
                onChangeStart: (perc) {
                  setState(() {
                    _isDragging = true;
                    perc = Utils.percentageFromValueInRange(
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
                  var val = Utils.valueFromPercentageInRange(
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
                if (audioService.position.value != null) {
                  currentTimeString =
                      DurationUtils.formatDuration(audioService.position.value);
                }

                var durationString = '--:--';
                if (audioService.duration.value != null) {
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                                children: _buildButtons(),
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
