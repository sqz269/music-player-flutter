import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:tlmc_player_app/services/impl/options_builder/track_options_builder.dart';
import 'package:tlmc_player_app/services/impl/options_builder/track_options_builder_extensions.dart';
import 'package:tlmc_player_app/views/mobile/widgets/track_bottom_sheet_options_list.dart';

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
      onTap: () {},
      onLongPress: () {
        var opt = TrackOptionsBuilder(track: trackData)
            .withAddToPlaylist()
            .withAddToQueue()
            .withPlayNext()
            .build();

        showModalBottomSheet(
            context: context,
            builder: (context) {
              return SafeArea(
                child: TrackBottomSheetOptionsList.fromOptions(
                    opt, trackData, albumData),
              );
            });
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
