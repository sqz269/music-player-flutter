import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/views/common/widget/track_tile_with_thumbnail_desktop.dart';

class QueueSceenDesktop extends StatelessWidget {
  final QueueService _queueService;

  QueueSceenDesktop({super.key}) : _queueService = Get.find<QueueService>();

  Widget _buildQueueView(BuildContext context) {
    return Obx(
      () {
        var queue = _queueService.queue;
        var currentIndex = _queueService.currentIndex.value;

        return ReorderableListView.builder(
          buildDefaultDragHandles: false,
          onReorder: (oldIndex, newIndex) {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            _queueService.reorderQueue(oldIndex, newIndex);
          },
          itemBuilder: (context, index) {
            return TrackTileWithThumbnailDesktop(
              key: ValueKey(queue[index].track.id),
              _queueService.queue[index].track,
              isPlaying: index == currentIndex,
              reorderableIndex: index,
            );
          },
          itemCount: queue.length,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Queue"),
      ),
      body: Center(
        child: _buildQueueView(context),
      ),
    );
  }
}
