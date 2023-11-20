import 'package:BackendClientApi/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/services/user_playlist_info_provider.dart';
import 'package:tlmc_player_flutter/services/api_client_provider.dart';

class PlaylistTile extends StatefulWidget {
  PlaylistReadDto playlistInfo;

  PlaylistTile({super.key, required this.playlistInfo});

  @override
  State<PlaylistTile> createState() => _PlaylistTileState();
}

class _PlaylistTileState extends State<PlaylistTile> {
  var loadingImage = false.obs;
  Widget? imageWidget;

  void initalizeImage() {
    var userPlaylistInfoProvider = Get.find<UserPlaylistInfoProvider>();
    var albumApi = AlbumApi(Get.find<ApiClientProvider>().getApiClient());

    var playlistItem =
        userPlaylistInfoProvider.firstItemInPlaylist(widget.playlistInfo.id!);

    if (playlistItem != null) {
      loadingImage.value = true;
      albumApi.getTrack(playlistItem.trackId!).then(
            (value) => {
              if (value != null)
                {
                  setState(
                    () {
                      imageWidget =
                          Image.network(value.album!.thumbnail!.medium!.url!);
                      loadingImage.value = false;
                    },
                  )
                }
            },
          );
    }
    imageWidget = const Icon(Icons.music_note);
  }

  @override
  void initState() {
    super.initState();
    initalizeImage();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Obx(
        () => SizedBox(
          width: 48.0,
          height: 48.0,
          child: loadingImage.value
              ? const CircularProgressIndicator()
              : imageWidget,
        ),
      ),
      title: Text(
        widget.playlistInfo.name!,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Playlist',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextSpan(
              text: " · ",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextSpan(
              text: widget.playlistInfo.username!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
