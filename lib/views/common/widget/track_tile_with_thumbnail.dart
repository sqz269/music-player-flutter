import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:tlmc_player_app/services/api/options_builder/i_track_option.dart';
import 'package:tlmc_player_app/utils/duration_utils.dart';

class TrackTileWithThumbnailDesktop extends StatelessWidget {
  final TrackReadDto track;
  final int? reorderableIndex;
  final bool isPlaying;
  final TrackOptions? popupMenuOptions;
  final void Function(TrackReadDto track, int? reorderableIndex)? onTap;

  const TrackTileWithThumbnailDesktop(
    this.track, {
    super.key,
    this.reorderableIndex,
    this.isPlaying = false,
    this.onTap,
    this.popupMenuOptions,
  });

  Widget _buildReorderableDragHandle(BuildContext context) {
    return reorderableIndex != null
        ? ReorderableDragStartListener(
            index: reorderableIndex!,
            child: const Icon(Icons.drag_handle),
          )
        : const SizedBox();
  }

  Widget _buildImageThumbnail(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: track.album!.thumbnail == null
            ? LayoutBuilder(
                builder: (context, constraint) => Icon(
                  Icons.album,
                  size: constraint.biggest.height * 0.9,
                  color: Colors.grey.shade300,
                ),
              )
            : Image.network(
                track.album!.thumbnail!.medium!.url!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  return progress == null
                      ? child
                      : const SizedBox.expand(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
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

  Widget _buildOptionsDropdownMenu(BuildContext context) {
    if (popupMenuOptions == null) return const SizedBox();

    List<PopupMenuItem<ITrackOption>> menuItems = [];
    for (var option in popupMenuOptions!.options) {
      var menuItem = PopupMenuItem(
        value: option,
        child: Text(option.title),
      );
      menuItems.add(menuItem);
    }

    return PopupMenuButton(
      itemBuilder: (context) {
        return menuItems;
      },
      onSelected: (value) {
        value.execute();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Splash effect will appear to stop abruptly if the widget rebuilds during the
      // animation, which looks bad, so we disable the splash effect
      splashColor: Colors.transparent,
      onTap: onTap != null ? () => onTap!(track, reorderableIndex) : null,
      child: Container(
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
            const SizedBox(width: 8),
            _buildOptionsDropdownMenu(context),
          ],
        ),
      ),
    );
  }
}
