import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    QueueController.to.currentTrack.stream.listen(
      (event) {
        print(event);
      },
    );

    playerExpandProgressPerc.stream.listen((event) {
      print(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (QueueController.to.currentTrack.value == null) {
          return const SizedBox.shrink();
        }

        var image = Image.network(
          QueueController
              .to.currentTrack.value!.track.album!.thumbnail!.large!.url!,
        );

        return Miniplayer(
          minHeight: 66,
          maxHeight: MediaQuery.of(context).size.height,
          onDismissed: () {
            QueueController.to.clearAll();
          },
          controller: _miniplayerController,
          builder: (height, perc) {
            WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
              playerExpandProgressPerc.value = perc;
            });

            var elementOpacity = 1 - perc * 10;

            if (perc < 0.1) {
              return MiniplayerTileCurrentlyPlaying(
                  image: image, elementOpacity: elementOpacity);
            }

            var width = MediaQuery.of(context).size.width;

            final paddingVertical =
                valueFromPercentageInRange(min: 0, max: 50, percentage: perc);
            final double heightWithoutPadding = height - paddingVertical * 2;
            final double imageSize = heightWithoutPadding > (width * 0.7)
                ? (width * 0.7)
                : heightWithoutPadding;
            final paddingLeft = valueFromPercentageInRange(
                  min: 0,
                  max: MediaQuery.of(context).size.width - imageSize,
                  percentage: perc,
                ) /
                2;

            var buttonShuffle = IconButton(
              icon: Icon(Icons.shuffle),
              iconSize: 30,
              onPressed: () {},
            );

            var buttonNext = IconButton(
              icon: Icon(Icons.skip_next),
              iconSize: 46,
              onPressed: null,
            );

            var buttonRepeat = IconButton(
              icon: Icon(Icons.repeat),
              iconSize: 30,
              onPressed: null,
            );

            var buttonPrevious = IconButton(
              icon: Icon(Icons.skip_previous),
              iconSize: 46,
              onPressed: null,
            );
            var buttonPlayExpanded = IconButton(
              icon: Icon(Icons.pause_outlined),
              iconSize: 52,
              onPressed: null,
            );
            var progressIndicator = Slider(value: 0.5, onChanged: null);

            return SafeArea(
              top: perc >= 0.8,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Opacity(
                            opacity: perc,
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
                              child: AspectRatio(aspectRatio: 1, child: image),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 33),
                          child: Opacity(
                            opacity: perc,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: QueueController.to.currentTrack
                                          .value!.track.name!.default_,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                      children: [
                                        const TextSpan(
                                          text: '\n',
                                        ),
                                        TextSpan(
                                          text: QueueController
                                              .to
                                              .currentTrack
                                              .value!
                                              .track
                                              .album!
                                              .albumArtist![0]
                                              .name!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  color: Colors.grey.shade600,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                    child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: progressIndicator,
                                )),
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      buttonShuffle,
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            buttonPrevious,
                                            buttonPlayExpanded,
                                            buttonNext,
                                          ],
                                        ),
                                      ),
                                      buttonRepeat,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DraggableScrollableSheet(
                    builder: (context, scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: DefaultTabController(
                          length: 2,
                          child: TabBar(
                            tabs: [
                              Tab(
                                text: 'Queue',
                              ),
                              Tab(
                                text: 'Lyrics',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    initialChildSize: 0.1,
                    minChildSize: 0.1,
                  ),
                ],
              ),
            );
          },
          elevation: 5,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
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
    return Column(
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
                          QueueController
                              .to.currentTrack.value!.track.name!.default_,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          QueueController.to.currentTrack.value!.track.album!
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
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.pause),
                ),
              ),
              Opacity(
                opacity: elementOpacity,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next),
                ),
              ),
            ],
          ),
        ),
        Opacity(
          opacity: elementOpacity,
          child: LinearProgressIndicator(
            value: 0.5,
            minHeight: 2,
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
        )
      ],
    );
  }
}
