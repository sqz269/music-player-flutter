import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:tlmc_player_app/services/api/i_playlist_service.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';
import 'package:tlmc_player_app/services/impl/authentication_service.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';

class OndemandPlaylistService implements IPlaylistService {
  final _logger =
      Get.find<LoggingService>().getLogger("OndemandPlaylistService");

  late PlaylistApi playlistApiService;

  final Rx<bool> _isReady = false.obs;
  @override
  Rx<bool> get isReady => _isReady;

  final RxList<PlaylistReadDto> _playlists = <PlaylistReadDto>[].obs;
  @override
  RxList<PlaylistReadDto> get playlists => _playlists;

  final Rx<PlaylistReadDto> _favoriate = PlaylistReadDto().obs;
  @override
  Rx<PlaylistReadDto> get favoriate => throw UnimplementedError();

  final Rx<PlaylistReadDto> _history = PlaylistReadDto().obs;
  @override
  Rx<PlaylistReadDto> get history => throw UnimplementedError();

  final Rx<PlaylistReadDto> _queue = PlaylistReadDto().obs;
  @override
  Rx<PlaylistReadDto> get queue => throw UnimplementedError();

  OndemandPlaylistService() {
    preinitialize();
  }

  Future<void> preinitialize() async {
    _logger.i("Pre-Initializing OndemandPlaylistService");

    var authService = Get.find<OidcAuthenticationService>();
    if (!authService.isAuthenticated.value) {
      _logger.i("No Authenticated user, deferring initialization");

      authService.isAuthenticated.listen((isAuthenticated) {
        if (isAuthenticated) {
          _logger.i("Authenticated user detected, initializing");
          _initialize();
        }
      });
    } else {
      _initialize();
    }
  }

  Future<void> _initialize() async {
    _logger.i("Initializing OndemandPlaylistService");

    var apiClientProvider = Get.find<ApiClientProvider>();
    var apiClient = apiClientProvider.getApiClient();
    playlistApiService = PlaylistApi(apiClient);

    // Fetch playlists
    var allPlaylists = await getPlaylists();
    setPlaylists(allPlaylists);
    _logger.d("Fetched ${_playlists.length} playlists");

    _logger.i("OndemandPlaylistService initialized");

    _isReady.value = true;
  }

  void setPlaylists(List<PlaylistReadDto> playlists) {
    var regularPlaylists = playlists
        .where((element) => element.type == PlaylistType.normal)
        .toList();

    var favoritePlaylist = playlists
        .firstWhereOrNull((element) => element.type == PlaylistType.favorite);

    var historyPlaylist = playlists
        .firstWhereOrNull((element) => element.type == PlaylistType.history);

    var queuePlaylist = playlists
        .firstWhereOrNull((element) => element.type == PlaylistType.queue);

    if ([favoritePlaylist, historyPlaylist, queuePlaylist]
        .any((element) => element == null)) {
      _logger.e("One or more special playlists are missing");
      return;
    }

    _favoriate.value = favoritePlaylist!;
    _history.value = historyPlaylist!;
    _queue.value = queuePlaylist!;
    _playlists.value = regularPlaylists;
  }

  @override
  Future<void> addTrackToPlaylist(String playlistId, String trackId) {
    // TODO: implement addTrackToPlaylist
    throw UnimplementedError();
  }

  @override
  Future<PlaylistReadDto> createPlaylist(
      String name, PlaylistVisibility visibility) {
    // TODO: implement createPlaylist
    throw UnimplementedError();
  }

  @override
  Future<void> deletePlaylist(String id) {
    // TODO: implement deletePlaylist
    throw UnimplementedError();
  }

  @override
  Future<PlaylistReadDto> getPlaylist(String id) {
    // TODO: implement getPlaylist
    throw UnimplementedError();
  }

  @override
  Future<List<TrackReadDto>> getPlaylistTracks(String id) {
    // TODO: implement getPlaylistTracks
    throw UnimplementedError();
  }

  @override
  Future<List<PlaylistReadDto>> getPlaylists() async {
    var result = await playlistApiService.getCurrentUserPlaylists();

    if (result != null) {
      return result;
    }

    return [];
  }

  @override
  Future<void> removeTrackFromPlaylist(String playlistId, String trackId) {
    // TODO: implement removeTrackFromPlaylist
    throw UnimplementedError();
  }

  @override
  Future<void> updatePlaylist(
      String id, String name, PlaylistVisibility visibility) {
    // TODO: implement updatePlaylist
    throw UnimplementedError();
  }
}
