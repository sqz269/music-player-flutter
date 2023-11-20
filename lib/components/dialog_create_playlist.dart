import 'package:flutter/material.dart';
import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/services/api_client_provider.dart';
import 'package:tlmc_player_flutter/services/user_playlist_info_provider.dart';
import 'package:tlmc_player_flutter/states/root_context_provider.dart';

class DialogCreatePlaylist extends StatefulWidget {
  const DialogCreatePlaylist({super.key});

  @override
  State<DialogCreatePlaylist> createState() => _DialogCreatePlaylistState();
}

class _DialogCreatePlaylistState extends State<DialogCreatePlaylist> {
  var playlistName = ''.obs;
  var playlistVisibility = PlaylistVisibility.private.obs;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New playlist'),
      content: Wrap(
        children: [
          TextField(
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Playlist Name',
            ),
            onChanged: (value) {
              playlistName.value = value;
            },
          ),
          Container(
            padding: const EdgeInsets.only(top: 36.0),
            child: DropdownMenu(
              initialSelection: PlaylistVisibility.private,
              onSelected: (value) {
                playlistVisibility.value = value ?? PlaylistVisibility.private;
              },
              // expandedInsets: EdgeInsets.zero,
              label: const Text('Playlist Visibility'),
              dropdownMenuEntries: const [
                DropdownMenuEntry<PlaylistVisibility>(
                  label: 'Public',
                  value: PlaylistVisibility.public,
                ),
                DropdownMenuEntry<PlaylistVisibility>(
                  label: 'Private',
                  value: PlaylistVisibility.private,
                ),
                DropdownMenuEntry<PlaylistVisibility>(
                  label: 'Unlisted',
                  value: PlaylistVisibility.unlisted,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            print("Creating playlist");
            print(playlistName.value);
            print(playlistVisibility.value);

            var apiClientProvider = Get.find<ApiClientProvider>();
            if (!apiClientProvider.isAuthenticated()) {
              return;
            }

            var playlistApi = PlaylistApi(apiClientProvider.getApiClient());
            playlistApi
                .addPlaylist(
              playlistInfo: PlaylistInfo(
                name: playlistName.value,
                visibility: playlistVisibility.value,
              ),
            )
                .then(
              (value) {
                if (value != null) {
                  print("Playlist created");
                  var userPlaylistInfo = Get.find<UserPlaylistInfoProvider>();
                  userPlaylistInfo.loadPlaylistInfo();
                  ScaffoldMessenger.of(
                          Get.find<RootContextProvider>().rootContext!)
                      .showSnackBar(
                    const SnackBar(
                      content: Text('Playlist created'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            );
            Navigator.of(context).pop();
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}
