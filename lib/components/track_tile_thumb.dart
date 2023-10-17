import 'package:flutter/material.dart';
import 'package:BackendClientApi/api.dart';
import 'package:tlmc_player_flutter/components/bottom_sheet_track_ops.dart';
import 'package:tlmc_player_flutter/utils/utils.dart';

class TrackTileThumb extends StatelessWidget {
  final TrackReadDto trackData;
  final int reorderableIndex;
  final bool isPlaying;
  final void Function(TrackReadDto trackData, int reorderableIndex)? onTap;

  const TrackTileThumb({
    super.key,
    required this.trackData,
    this.reorderableIndex = -1,
    this.isPlaying = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isPlaying
          ? Theme.of(context).colorScheme.surface
          : Theme.of(context).colorScheme.surfaceVariant,
      child: InkWell(
        onLongPress: () {
          showModalBottomSheet(
            useRootNavigator: true,
            context: context,
            builder: (context) => BottomSheetTrackOps(
              trackData: trackData,
              albumData: trackData.album!,
            ),
          );
        },
        onTap: () {
          if (onTap != null) {
            onTap!(trackData, reorderableIndex);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.network(
                  trackData.album!.thumbnail!.small!.url!,
                  fit: BoxFit.cover,
                  width: 42,
                  height: 42,
                ),
              ),
              const SizedBox(
                  width:
                      8.0), // To add some space between the image and the text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      trackData.name!.default_,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 4.0), // To add some space between the text
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: trackData.album?.albumArtist![0].name!,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.grey.shade700,
                                ),
                          ),
                          TextSpan(
                            text: ' · ',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Colors.grey.shade700,
                                ),
                          ),
                          TextSpan(
                            text: Util.timeStrNoHours(trackData.duration!),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Colors.grey.shade700,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // If reorderableIndex is not -1, this means that this track tile should be reorderable
              if (reorderableIndex != -1)
                Container(
                  height: 42,
                  width: 42,
                  child: Center(
                    child: ReorderableDragStartListener(
                      index: reorderableIndex,
                      child: Icon(
                        Icons.drag_handle,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
