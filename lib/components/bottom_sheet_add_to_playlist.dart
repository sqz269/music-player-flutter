import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/services/api_client_provider.dart';
import 'package:tlmc_player_flutter/services/user_playlist_info_provider.dart';

class BottomSheetAddToPlaylist extends StatefulWidget {
  final String trackId;
  const BottomSheetAddToPlaylist({super.key, required this.trackId});

  @override
  State<BottomSheetAddToPlaylist> createState() =>
      _BottomSheetAddToPlaylistState();
}

class _BottomSheetAddToPlaylistState extends State<BottomSheetAddToPlaylist> {
  var loading = false.obs;
  var authFail = false.obs;
  var playlistInfo = RxList<PlaylistReadDto>([]);

  @override
  void initState() {
    super.initState();

    var apiClientProvider = Get.find<ApiClientProvider>();
    if (!apiClientProvider.isAuthenticated()) {
      authFail.value = true;
      return;
    }

    loading.value = true;
    PlaylistApi(apiClientProvider.getApiClient())
        .getCurrentUserPlaylists()
        .then((value) {
      if (value != null) {
        playlistInfo.value = value;
      }
      loading.value = false;
    }).catchError((e) {
      loading.value = false;
      authFail.value = true;
    });
  }

  Icon BuildPrivacyIcon(PlaylistVisibility visibility) {
    switch (visibility) {
      case PlaylistVisibility.public:
        return Icon(Icons.public);
      case PlaylistVisibility.private:
        return Icon(Icons.lock);
      case PlaylistVisibility.unlisted:
        return Icon(Icons.remove_red_eye);
      default:
        return Icon(Icons.error);
    }
  }

  Widget buildBody(BuildContext context) {
    var userPlaylistInfo = Get.find<UserPlaylistInfoProvider>();
    return Obx(
      () {
        if (userPlaylistInfo.status.value ==
            PlaylistInfoProviderState.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (userPlaylistInfo.status.value ==
            PlaylistInfoProviderState.error) {
          return Center(
            child: Text(
              userPlaylistInfo.errorMessage.value ?? "Error",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: userPlaylistInfo.playlistsInfo.length,
            itemBuilder: (context, index) {
              var selectedPlaylist =
                  userPlaylistInfo.playlistsInfo.value[index];

              var playlistId = selectedPlaylist.id!;
              var playlistName = selectedPlaylist.name!;
              return Obx(
                () => CheckboxListTile(
                  title:
                      Text(userPlaylistInfo.playlistsInfo.value[index].name!),
                  secondary: BuildPrivacyIcon(
                      userPlaylistInfo.playlistsInfo.value[index].visibility!),
                  value: userPlaylistInfo.playlistItems[playlistId]
                      ?.any((element) => element.trackId == widget.trackId),
                  onChanged: (bool? value) {
                    if (value == true) {
                      userPlaylistInfo.addTrackToPlaylist(
                          playlistId, widget.trackId);
                    } else {
                      userPlaylistInfo.removeTrackFromPlaylist(
                          playlistId, widget.trackId);
                    }
                  },
                ),
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    //   if (loading.value) {
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   } else if (authFail.value) {
    //     return Center(
    //       child: Text('Not authenticated'),
    //     );
    //   } else {
    //     return ListView.builder(
    //       itemCount: playlistInfo.length,
    //       itemBuilder: (context, index) {
    //         return ListTile(
    //           leading: Icon(Icons.playlist_play),
    //           title: Text(playlistInfo[index].name!.default_!),
    //           onTap: () {
    //             Navigator.of(context).pop();
    //           },
    //         );
    //       },
    //     );
    //   }
    // });

    return DraggableScrollableSheet(
      minChildSize: 1,
      initialChildSize: 1,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Add to playlist'),
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            automaticallyImplyLeading: false,
          ),
          body: buildBody(context),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            label: Text('New playlist'),
            icon: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
