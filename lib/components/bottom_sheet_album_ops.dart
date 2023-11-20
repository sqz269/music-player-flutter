import 'package:flutter/material.dart';
import 'package:BackendClientApi/api.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';
import 'package:tlmc_player_flutter/states/root_context_provider.dart';

class BottomSheetAlbumOps extends StatefulWidget {
  final AlbumReadDto masterAlbum;
  final List<AlbumReadDto> albums;

  BottomSheetAlbumOps(
      {super.key, required this.masterAlbum, this.albums = const []}) {
    albums.add(masterAlbum);
  }

  @override
  State<BottomSheetAlbumOps> createState() => _BottomSheetAlbumOpsState();
}

class _BottomSheetAlbumOpsState extends State<BottomSheetAlbumOps> {
  List<String> getAllTracks() {
    List<String> tracks = List.empty(growable: true);

    for (var album in widget.albums) {
      tracks.insertAll(tracks.length, album.tracks!.map((e) => e.id!).toList());
    }

    return tracks;
  }

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
                widget.masterAlbum.thumbnail!.medium!.url!,
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              ),
              title: RichText(
                text: TextSpan(
                  text: widget.masterAlbum.albumName!.default_,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: '\n${widget.masterAlbum.albumArtist![0].name}',
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
            leading: const Icon(Icons.shuffle),
            title: const Text('Shuffle Play'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.playlist_play),
            title: const Text('Play next'),
            onTap: () {
              QueueController.to
                  .addTracksById(
                getAllTracks(),
                position: QueueController.to.playingIndex.value + 1,
              )
                  .then((value) {
                ScaffoldMessenger.of(RootContextProvider.to.rootContext!)
                    .showSnackBar(
                  SnackBar(
                    content: Text('Added $value tracks'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                Navigator.of(context).pop();
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.queue_music),
            title: const Text('Add to queue'),
            onTap: () {
              QueueController.to
                  .addTracksById(
                getAllTracks(),
              )
                  .then(
                (value) {
                  ScaffoldMessenger.of(RootContextProvider.to.rootContext!)
                      .showSnackBar(
                    SnackBar(
                      content: Text('Added $value tracks'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Navigator.of(context).pop();
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.playlist_add),
            title: const Text('Save to playlist'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.interpreter_mode),
            title: const Text('Go to artist'),
            onTap: () {
              // Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
