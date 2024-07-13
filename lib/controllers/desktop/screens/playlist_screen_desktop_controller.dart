import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';

class PlaylistScreenDesktopState {
  final PlaylistReadDto playlistInfo;
  final List<TrackReadDto> playlistItems;
  final int start;
  final bool hasMore;

  PlaylistScreenDesktopState({
    required this.playlistInfo,
    required this.playlistItems,
    required this.start,
    required this.hasMore,
  });
}

class PlaylistScreenDesktopController extends GetxController
    with StateMixin<PlaylistScreenDesktopState> {
  final _logger =
      Get.find<LoggingService>().getLogger("PlaylistScreenDesktopController");

  final String playlistId;
  late PlaylistScreenDesktopState _currentState;

  PlaylistScreenDesktopController({required this.playlistId});

  @override
  void onInit() {
    super.onInit();

    loadPlaylist();
  }

  Future<(List<TrackReadDto>, bool)> loadPlaylistItems(
      int start, int limit) async {
    var playlistItemsApi =
        PlaylistItemsApi(Get.find<ApiClientProvider>().getApiClient());
    var albumApi = TrackApi(Get.find<ApiClientProvider>().getApiClient());

    var playlistItems = await playlistItemsApi.getPlaylistItems(
      playlistId,
      limit: limit,
      start: start,
    );
    var trackIds = playlistItems!.map((e) => e.trackId!).toList();

    var tracks = await albumApi.getTracks(requestBody: trackIds);

    var hasMore = playlistItems.length == limit;
    return (tracks!.tracks!, hasMore);
  }

  Future<void> loadMore() async {
    if (!state!.hasMore) {
      return;
    }

    var (playlistItems, hasMore) = await loadPlaylistItems(
      _currentState.start + _currentState.playlistItems.length,
      50,
    );

    _currentState = PlaylistScreenDesktopState(
      playlistInfo: _currentState.playlistInfo,
      playlistItems: [..._currentState.playlistItems, ...playlistItems],
      start: _currentState.start + _currentState.playlistItems.length,
      hasMore: hasMore,
    );

    change(
      _currentState,
      status: RxStatus.success(),
    );
  }

  Future<void> loadPlaylist() async {
    var playlistApi = PlaylistApi(Get.find<ApiClientProvider>().getApiClient());
    var playlistInfo = await playlistApi.getPlaylistById(playlistId);
    var (playlistItems, hasMore) = await loadPlaylistItems(0, 50);

    _currentState = PlaylistScreenDesktopState(
      playlistInfo: playlistInfo!,
      playlistItems: playlistItems,
      start: 0,
      hasMore: hasMore,
    );

    _logger.d("Loaded playlist ${playlistInfo.name}");
    _logger.d("Playlist has ${playlistItems.length} items");

    change(
      _currentState,
      status: RxStatus.success(),
    );
  }
}
