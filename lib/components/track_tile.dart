import 'package:flutter/material.dart';
import 'package:BackendClientApi/api.dart';
import 'package:tlmc_player_flutter/components/bottom_sheet_track_ops.dart';
import 'package:tlmc_player_flutter/utils/utils.dart';

class TrackTile extends StatelessWidget {
  final TrackReadDto trackData;
  final AlbumReadDto albumData;

  const TrackTile(
      {super.key, required this.trackData, required this.albumData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => BottomSheetTrackOps(
            trackData: trackData,
            albumData: albumData,
          ),
        );
      },
      leading: Text(
        trackData.index.toString(),
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      title: Text(
        trackData.name!.default_,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: albumData.albumArtist![0].name!,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.grey.shade700,
                  ),
            ),
            TextSpan(
                text: ' · ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.grey.shade700,
                    )),
            TextSpan(
              text: Util.timeStrNoHours(trackData.duration!),
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.grey.shade700,
                  ),
            ),
          ],
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => BottomSheetTrackOps(
              trackData: trackData,
              albumData: albumData,
            ),
          );
        },
        icon: Icon(Icons.more_vert),
      ),
      dense: true,
    );
  }
}
