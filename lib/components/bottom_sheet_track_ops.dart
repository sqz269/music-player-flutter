import 'package:flutter/material.dart';
import 'package:BackendClientApi/api.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BottomSheetTrackOps extends StatelessWidget {
  final AlbumReadDto albumData;

  final TrackReadDto trackData;

  const BottomSheetTrackOps(
      {super.key, required this.trackData, required this.albumData});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  text: trackData.name!.default_!,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: '\n${albumData.albumName!.default_!}',
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
          ListTile(
            leading: Icon(Icons.quiz),
            title: Text('[DEBUG] Play in HLS Audio Test Page'),
            onTap: () {
              Get.toNamed(
                '/audio_test/${trackData.id!}',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.copy),
            title: Text('[DEBUG] Copy track UUID to clipboard'),
            onTap: () {
              Clipboard.setData(
                ClipboardData(text: trackData.id!),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Copied track UUID to clipboard'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
