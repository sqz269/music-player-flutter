import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tlmc_player_flutter/components/track_tile_thumb.dart';
import 'package:tlmc_player_flutter/model/queued_track.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MiniplayerQueueBottomSheet extends StatefulWidget {
  const MiniplayerQueueBottomSheet({
    super.key,
    required this.perc,
  });

  final double perc;

  @override
  State<MiniplayerQueueBottomSheet> createState() =>
      _MiniplayerQueueBottomSheetState();
}

class _MiniplayerQueueBottomSheetState
    extends State<MiniplayerQueueBottomSheet> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (widget.perc < 0.4) {
      return const SizedBox.shrink();
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.09,
      minChildSize: 0.09,
      maxChildSize: 0.9,
      snap: true,
      snapSizes: const [0.09, 0.9],
      builder: (context, scrollController) => DefaultTabController(
        length: 1,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            body: CustomScrollView(
              controller: scrollController,
              slivers: <Widget>[
                SliverToBoxAdapter(
                  // grab bar
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 4,
                        width: 40,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: TabBar(
                    dividerColor: Colors.grey.shade100,
                    tabs: const [
                      Tab(text: 'Queue'),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  child: TabBarView(
                    children: [
                      Center(
                        child: SlidableAutoCloseBehavior(
                          child: Obx(
                            () => ReorderableListView.builder(
                              onReorder: (oldIndex, newIndex) {
                                print("Reorder from $oldIndex to $newIndex");
                                if (newIndex > oldIndex) {
                                  newIndex -= 1;
                                }
                                QueueController.to
                                    .reorderQueue(oldIndex, newIndex);
                              },
                              itemBuilder: (context, index) {
                                var queuedTrack =
                                    QueueController.to.queue[index];
                                return buildSlidableTrackTile(
                                    queuedTrack,
                                    index,
                                    false,
                                    index ==
                                        QueueController.to.playingIndex.value);
                              },
                              itemCount: QueueController.to.queue.length,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Slidable buildSlidableTrackTile(
      QueuedTrack queuedTrack, int index, bool isHistory, bool isPlaying) {
    return Slidable(
      key: Key(queuedTrack.id),
      groupTag: "queue",
      endActionPane: ActionPane(
        extentRatio: 1 / 5,
        dismissible: DismissiblePane(
          onDismissed: () {
            print("Removed from queue");
            QueueController.to.removeFromQueue(queuedTrack.id);
            print("New queue length: ${QueueController.to.queue.length}");
          },
        ),
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            label: 'Remove',
            padding: const EdgeInsets.all(0),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            onPressed: (context) {
              QueueController.to.removeFromQueue(queuedTrack.id);
            },
          ),
        ],
      ),
      child: TrackTileThumb(
        trackData: queuedTrack.track,
        reorderableIndex: index,
        isPlaying: isPlaying,
        onTap: (trackInfo, index) {
          QueueController.to.skipTo(index);
        },
      ),
    );
  }
}
