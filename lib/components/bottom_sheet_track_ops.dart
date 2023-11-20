import 'package:flutter/material.dart';
import 'package:BackendClientApi/api.dart';
import 'package:tlmc_player_flutter/components/bottom_sheet_add_to_playlist.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';

class BottomSheetTrackOps extends StatelessWidget {
  final AlbumReadDto albumData;

  final TrackReadDto trackData;

  const BottomSheetTrackOps(
      {super.key, required this.trackData, required this.albumData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Image.network(
                albumData.thumbnail!.medium!.url!,
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              ),
              title: RichText(
                text: TextSpan(
                  text: trackData.name!.default_,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: '\n${albumData.albumName!.default_}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              onTap: null,
            ),
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            leading: const Icon(Icons.playlist_play),
            title: const Text('Play next'),
            onTap: () {
              QueueController.to.addTrackById(trackData.id!).then(
                (value) {
                  Navigator.of(context).pop();
                  // MobileMiniplayerBarController.to.expand();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to queue'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.queue_music),
            title: const Text('Add to queue'),
            onTap: () {
              QueueController.to.addTrackById(trackData.id!).then(
                (value) {
                  Navigator.of(context).pop();
                  // MobileMiniplayerBarController.to.expand();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to queue'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.playlist_add),
            title: const Text('Save to playlist'),
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                useRootNavigator: true,
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                builder: (context) =>
                    BottomSheetAddToPlaylist(trackId: trackData.id!),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.interpreter_mode),
            title: const Text('Go to artist'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
