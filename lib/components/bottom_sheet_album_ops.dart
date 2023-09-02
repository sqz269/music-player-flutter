import 'package:flutter/material.dart';
import 'package:BackendClientApi/api.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';

class BottomSheetAlbumOps extends StatefulWidget {
  final AlbumReadDto masterAlbum;
  final List<AlbumReadDto> albums;

  BottomSheetAlbumOps({super.key, required this.masterAlbum}) : albums = [] {
    albums.add(masterAlbum);
  }

  @override
  State<BottomSheetAlbumOps> createState() => _BottomSheetAlbumOpsState();
}

class _BottomSheetAlbumOpsState extends State<BottomSheetAlbumOps> {
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
            leading: Icon(Icons.shuffle),
            title: Text('Shuffle Play'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.playlist_play),
            title: Text('Play next'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.queue_music),
            title: Text('Add to queue'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.playlist_add),
            title: Text('Save to playlist'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.interpreter_mode),
            title: Text('Go to artist'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
