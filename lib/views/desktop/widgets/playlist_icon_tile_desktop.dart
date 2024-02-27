import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaylistIconTileDesktop extends StatelessWidget {
  final String playlistName;
  final String playlistId;
  final Icon? icon;

  const PlaylistIconTileDesktop({
    super.key,
    required this.playlistName,
    required this.playlistId,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var icon = this.icon ?? const Icon(Icons.playlist_play);

    return Material(
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 24),
              Text(playlistName),
            ],
          ),
        ),
      ),
    );
  }
}
