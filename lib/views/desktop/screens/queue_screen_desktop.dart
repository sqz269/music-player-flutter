import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/options_builder/i_track_option.dart';
import 'package:tlmc_player_app/services/impl/options_builder/track_options_builder.dart';
import 'package:tlmc_player_app/services/impl/options_builder/track_options_builder_extensions.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/views/common/widget/track_tile_with_thumbnail.dart';

class QueueSceenDesktop extends StatelessWidget {
  final QueueService _queueService;

  QueueSceenDesktop({super.key}) : _queueService = Get.find<QueueService>();

  TrackOptions _buildTrackOptions(TrackReadDto track) {
    var builder = TrackOptionsBuilder(track: track);

    var options =
        builder.withAddToPlaylist().withGotoAlbum().withGotoArtist().build();

    return options;
  }

  void _onTap(TrackReadDto track, int? reorderableIndex) {
    _queueService.skipTo(reorderableIndex!);
  }

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
            var options = _buildTrackOptions(queue[index].track);

            return TrackTileWithThumbnailDesktop(
              key: ValueKey(queue[index].track.id),
              _queueService.queue[index].track,
              isPlaying: index == currentIndex,
              reorderableIndex: index,
              popupMenuOptions: options,
              onTap: _onTap,
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
        title: const Text("Queue"),
      ),
      body: Center(
        child: _buildQueueView(context),
      ),
    );
  }
}
