import 'package:get/get.dart';
import 'package:BackendClientApi/api.dart';
import 'package:tlmc_player_flutter/services/api_client_provider.dart';
import 'package:tlmc_player_flutter/services/backend_client_authentication_provider.dart';

enum PlaylistInfoProviderState { idle, loading, loaded, error }

class UserPlaylistInfoProvider extends GetxController {
  final status = Rx<PlaylistInfoProviderState>(PlaylistInfoProviderState.idle);
  final errorMessage = Rx<String?>(null);

  final playlistsInfo = RxList<PlaylistReadDto>([]);
  final playlistItems = RxMap<String, RxList<PlaylistItemReadDto>>({});

  UserPlaylistInfoProvider() {
    var authProvider = Get.find<BackendClientAuthenticationProvider>();
    authProvider.readyAndAuthenticated.listen(
      (value) {
        if (value) {
          loadPlaylistInfo();
        }
      },
    );
  }

  PlaylistItemReadDto? firstItemInPlaylist(String playlistId) {
    if (playlistItems[playlistId]?.isNotEmpty ?? false) {
      return playlistItems[playlistId]![0];
    }

    return null;
  }

  Future<void> loadPlaylistInfo() async {
    status.value = PlaylistInfoProviderState.loading;
    try {
      var apiClientProvider = Get.find<ApiClientProvider>();
      if (!apiClientProvider.isAuthenticated()) {
        status.value = PlaylistInfoProviderState.error;
        errorMessage.value = "Not authenticated";
        return;
      }

      var playlists = await PlaylistApi(apiClientProvider.getApiClient())
          .getCurrentUserPlaylists();
      if (playlists != null) {
        playlistsInfo.value = playlists;
      }

      // remove special playlists (Favorite, History, Queue)
      playlistsInfo
          .removeWhere((element) => element.type != PlaylistType.normal);
      // order everything by last modified
      playlistsInfo.sort((a, b) => b.lastModified!.compareTo(a.lastModified!));
    } catch (e) {
      status.value = PlaylistInfoProviderState.error;
      errorMessage.value = e.toString();
      // rethrow;
    }

    await cachePlaylistItemInfo();

    status.value = PlaylistInfoProviderState.loaded;
    print("Playlist info cache loaded");
  }

  Future<void> cachePlaylistItemInfo() async {
    try {
      var apiClientProvider = Get.find<ApiClientProvider>();
      if (!apiClientProvider.isAuthenticated()) {
        return;
      }

      for (var playlist in playlistsInfo) {
        playlistItems[playlist.id!] = RxList([]);
        var offset = 0;
        while (true) {
          var playlistItems =
              await PlaylistItemsApi(apiClientProvider.getApiClient())
                  .getPlaylistItems(playlist.id!, start: offset, limit: 50);
          if (playlistItems != null && playlistItems.isNotEmpty) {
            this.playlistItems[playlist.id!]?.addAll(playlistItems);
            offset += playlistItems.length;
          } else {
            break;
          }
        }
      }
    } catch (e) {
      // rethrow;
    }
  }

  Future<bool> addTrackToPlaylist(String playlistId, String trackId) async {
    await PlaylistItemsApi(Get.find<ApiClientProvider>().getApiClient())
        .addTrackToPlaylist(playlistId, requestBody: [trackId]);

    playlistItems[playlistId]?.add(PlaylistItemReadDto(trackId: trackId));
    return true;
  }

  Future<bool> removeTrackFromPlaylist(
      String playlistId, String trackId) async {
    await PlaylistItemsApi(Get.find<ApiClientProvider>().getApiClient())
        .deleteTrackFromPlaylist(playlistId, requestBody: [trackId]);

    playlistItems[playlistId]
        ?.removeWhere((element) => element.trackId == trackId);
    return true;
  }
}
