import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/api/i_playlist_service.dart';

class AddToPlaylistModalDesktopState {
  final String trackId;

  // Map of PlaylistId to a boolean,
  // true if the track is in the playlist, false otherwise
  final Map<String, bool> isTrackInPlaylist;
  final Map<String, PlaylistReadDto> playlists;

  AddToPlaylistModalDesktopState({
    required this.trackId,
    required this.isTrackInPlaylist,
    required this.playlists,
  });
}

class AddToPlaylistModalDesktopController extends GetxController
    with StateMixin<AddToPlaylistModalDesktopState> {
  final String trackId;

  late AddToPlaylistModalDesktopState state;

  AddToPlaylistModalDesktopController({required this.trackId});

  @override
  void onInit() {
    super.onInit();

    load();
  }

  Future<void> load() async {
    var playlistService = Get.find<IPlaylistService>();

    var results = <String, bool>{};
    for (var playlist in playlistService.playlists) {
      var isTrackInPlaylist =
          await playlistService.isTrackInPlaylist(playlist.id!, trackId);
      results[playlist.id!] = isTrackInPlaylist;
    }

    var playlists = <String, PlaylistReadDto>{};
    for (var playlist in playlistService.playlists) {
      playlists[playlist.id!] = playlist;
    }

    state = AddToPlaylistModalDesktopState(
      trackId: trackId,
      isTrackInPlaylist: results,
      playlists: playlists,
    );
    change(state, status: RxStatus.success());
  }

  Future<void> addToPlaylist(String playlistId) async {
    var playlistService = Get.find<IPlaylistService>();
    await playlistService.addTrackToPlaylist(playlistId, trackId);
    // Update the state
    load();
  }

  Future<void> removeFromPlaylist(String playlistId) async {
    var playlistService = Get.find<IPlaylistService>();
    await playlistService.removeTrackFromPlaylist(playlistId, trackId);
    // Update the state
    load();
  }
}
