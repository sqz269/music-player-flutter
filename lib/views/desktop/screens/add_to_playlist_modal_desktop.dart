import 'package:BackendClientApi/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/controllers/desktop/screens/add_to_playlist_modal_desktop_controller.dart';
import 'package:tlmc_player_app/extensions/get_x_extension.dart';
import 'package:tlmc_player_app/services/api/i_playlist_service.dart';

class AddToPlaylistModalDesktop extends StatefulWidget {
  final AddToPlaylistModalDesktopController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String trackId;

  final RxBool showPlaylistCreateForm = false.obs;
  final Rx<PlaylistVisibility> selectedVisibility =
      PlaylistVisibility.private.obs;
  final RxString playlistName = ''.obs;

  AddToPlaylistModalDesktop({super.key, required this.trackId})
      : controller = Get.getOrPut(
          AddToPlaylistModalDesktopController(trackId: trackId),
          tag: trackId,
        );

  @override
  State<AddToPlaylistModalDesktop> createState() =>
      _AddToPlaylistModalDesktopState();
}

class _AddToPlaylistModalDesktopState extends State<AddToPlaylistModalDesktop> {
  final IPlaylistService playlistService = Get.find<IPlaylistService>();

  Icon _buildPrivacyIcon(PlaylistVisibility visibility) {
    switch (visibility) {
      case PlaylistVisibility.public:
        return const Icon(Icons.public_outlined);
      case PlaylistVisibility.private:
        return const Icon(Icons.lock_outline);
      case PlaylistVisibility.unlisted:
        return const Icon(Icons.remove_red_eye_outlined);
      default:
        return const Icon(Icons.error);
    }
  }

  Widget _buildCreatePlaylistForm(
      AddToPlaylistModalDesktopState states, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: widget
            ._formKey, // Define a GlobalKey<FormState> _formKey = GlobalKey<FormState>(); at the class level
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Divider(),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter playlist title...',
                isDense: true,
              ),
              maxLength: 150,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              onChanged: (value) {
                widget.playlistName.value = value;
              },
            ),
            const SizedBox(height: 8), // Adds space between the fields
            DropdownButtonFormField<PlaylistVisibility>(
              decoration: const InputDecoration(
                labelText: 'Privacy',
                isDense: true,
              ),
              value: widget.selectedVisibility.value,
              items: PlaylistVisibility.values.map((PlaylistVisibility value) {
                return DropdownMenuItem<PlaylistVisibility>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (newValue) {
                widget.selectedVisibility.value = newValue!;
              },
            ),
            const SizedBox(height: 8), // Adds space before the button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    widget.showPlaylistCreateForm.value = false;
                  },
                  child: const Text('Cancel'),
                  // Style your button here as needed
                ),
                TextButton(
                  onPressed: () {
                    if (widget._formKey.currentState!.validate()) {
                      widget.controller
                          .createPlaylist(
                        widget.playlistName.value,
                        widget.selectedVisibility.value,
                      )
                          .then(
                        (value) {
                          widget.controller.addToPlaylist(value.id!);
                        },
                      );

                      widget.showPlaylistCreateForm.value = false;
                    }
                  },
                  child: const Text('Create'),
                  // Style your button here as needed
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreatePlaylistButton(
      AddToPlaylistModalDesktopState states, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              widget.showPlaylistCreateForm.value = true;
            },
            child: const Text('Create new playlist'),
            style: TextButton.styleFrom(
              minimumSize: const Size(160, 52),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPlaylistView(
      AddToPlaylistModalDesktopState states, BuildContext context) {
    return Expanded(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: playlistService.playlists.length,
          itemBuilder: (context, index) {
            var playlist = playlistService.playlists[index];
            var playlistId = playlist.id!;

            var isTrackInPlaylist =
                states.isTrackInPlaylist[playlistId] ?? false;
            return CheckboxListTile(
              value: isTrackInPlaylist,
              onChanged: (value) {
                if (value == true) {
                  widget.controller.addToPlaylist(playlistId);
                } else {
                  // Remove from playlist
                  widget.controller.removeFromPlaylist(playlistId);
                }
              },
              title: Text(playlistService.playlists[index].name!),
              secondary: _buildPrivacyIcon(
                  playlistService.playlists[index].visibility!),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDialogHeader(
      AddToPlaylistModalDesktopState states, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Add to playlist',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          // Add a close button here
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildMainView(
      AddToPlaylistModalDesktopState? states, BuildContext context) {
    if (states == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildDialogHeader(states, context),
          const SizedBox(height: 20),
          // Add playlist items here
          _buildPlaylistView(states, context),
          const SizedBox(height: 20),
          Obx(
            () {
              if (widget.showPlaylistCreateForm.value) {
                return _buildCreatePlaylistForm(states, context);
              } else {
                return _buildCreatePlaylistButton(states, context);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(); // Close the dialog
      },
      child: Container(
        color: Colors.transparent, // Make tap on outside area detectable
        child: GestureDetector(
          onTap:
              () {}, // Prevent tap from closing the dialog when clicking inside
          child: Dialog(
            surfaceTintColor: Theme.of(context).colorScheme.surface,
            child: Container(
              width: 350,
              height: 450,
              padding: const EdgeInsets.all(20),
              child: widget.controller.obx(
                (state) => _buildMainView(state, context),
                onLoading: const Center(child: CircularProgressIndicator()),
                onError: (error) => Center(child: Text('Error: $error')),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
