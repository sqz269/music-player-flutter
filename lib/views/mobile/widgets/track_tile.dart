import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/views/mobile/widgets/bottom_sheet/track/track_bottom_sheet_builder.dart';
import 'package:tlmc_player_app/views/mobile/widgets/bottom_sheet/track/track_bttom_sheet_options.dart';

class TrackTile extends StatelessWidget {
  final TrackReadDto trackData;
  final AlbumReadDto albumData;

  const TrackTile({
    Key? key,
    required this.trackData,
    required this.albumData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.find<QueueService>()
            .addTrackById(trackData.id!, playImmediately: true);
      },
      onLongPress: () {
        TrackBottomSheetBuilder(
          albumData: albumData,
          trackData: trackData,
        )
            .withPlayNext()
            .withAddToQueue()
            .withAddToPlaylist()
            .withGoToAlbum()
            .withGoToArtist()
            .withSearchOnYoutube()
            .show(context);
      },
      leading: Text(
        trackData.index.toString(),
      ),
      title: Text(
        trackData.name!.default_,
      ),
      subtitle: Text(
        albumData.name!.default_,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert),
      ),
    );
  }
}
