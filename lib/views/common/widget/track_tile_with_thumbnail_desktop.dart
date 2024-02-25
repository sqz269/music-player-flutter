import 'package:BackendClientApi/api.dart';
import 'package:flutter/material.dart';
import 'package:tlmc_player_app/utils/duration_utils.dart';

class TrackTileWithThumbnailDesktop extends StatelessWidget {
  final TrackReadDto track;
  final int? reorderableIndex;
  final bool isPlaying;
  final void Function(TrackReadDto track, int? reorderableIndex)? onTap;

  const TrackTileWithThumbnailDesktop(this.track,
      {super.key, this.reorderableIndex, this.isPlaying = false, this.onTap});

  Widget _buildReorderableDragHandle(BuildContext context) {
    return reorderableIndex != null
        ? ReorderableDragStartListener(
            index: reorderableIndex!,
            child: Icon(Icons.drag_handle),
          )
        : const SizedBox();
  }

  Widget _buildImageThumbnail(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.network(
        track.album!.thumbnail!.small!.url!,
        fit: BoxFit.cover,
        width: 56,
        height: 56,
      ),
    );
  }

  Widget _buildTrackInfo(BuildContext context) {
    var artists = track.album!.albumArtist!.map((e) => e.name).join(", ");

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            track.name!.default_,
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 18,
              color: isPlaying ? Theme.of(context).primaryColor : null,
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: artists,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
                TextSpan(
                  text: " · ",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
                TextSpan(
                  text: DurationUtils.formatDuration(
                      DurationUtils.parseDuration(track.duration)),
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: isPlaying ? Colors.grey.shade200 : null,
      ),
      child: Row(
        children: [
          _buildReorderableDragHandle(context),
          const SizedBox(width: 8),
          _buildImageThumbnail(context),
          const SizedBox(width: 8),
          _buildTrackInfo(context),
        ],
      ),
    );
  }
}
