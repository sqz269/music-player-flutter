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
  late PlaylistItemsApi playlistItemsApiService;

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
    initialize();
  }

  Future<void> initialize() async {
    _logger.i("Initializing OndemandPlaylistService");

    var authService = Get.find<OidcAuthenticationService>();
    if (!authService.isAuthenticated.value) {
      _logger.i("No Authenticated user, deferring initialization");

      authService.isAuthenticated.listen((isAuthenticated) {
        if (isAuthenticated) {
          _logger.i("Authenticated user detected, initializing");
          _update();
        }
      });
    } else {
      _update();
    }
  }

  Future<void> _update() async {
    _logger.i("Initializing OndemandPlaylistService");

    var apiClientProvider = Get.find<ApiClientProvider>();
    var apiClient = apiClientProvider.getApiClient();
    playlistApiService = PlaylistApi(apiClient);
    playlistItemsApiService = PlaylistItemsApi(apiClient);

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
  Future<void> addTrackToPlaylist(String playlistId, String trackId) async {
    await playlistItemsApiService
        .addTrackToPlaylist(playlistId, requestBody: [trackId]);
  }

  @override
  Future<void> addTrackToFavoriate(String trackId) async {
    await playlistItemsApiService
        .addTrackToPlaylist(_favoriate.value.id!, requestBody: [trackId]);
  }

  @override
  Future<void> addTrackToHistory(String trackId) async {
    await playlistItemsApiService
        .addTrackToPlaylist(_history.value.id!, requestBody: [trackId]);
  }

  @override
  Future<void> removeTrackFromFavoriate(String trackId) async {
    await playlistItemsApiService
        .deleteTrackFromPlaylist(_favoriate.value.id!, requestBody: [trackId]);
  }

  @override
  Future<PlaylistReadDto> createPlaylist(
      String name, PlaylistVisibility visibility) async {
    var result = await playlistApiService.addPlaylist(
      playlistInfo: PlaylistInfo(
        name: name,
        visibility: visibility,
      ),
    );

    await _update();

    return result!;
  }

  @override
  Future<void> deletePlaylist(String id) {
    // TODO: implement deletePlaylist
    throw UnimplementedError();
  }

  @override
  Future<PlaylistReadDto> getPlaylist(String playlistId) {
    // TODO: implement getPlaylist
    throw UnimplementedError();
  }

  @override
  Future<List<TrackReadDto>> getPlaylistTracks(String playlistId) {
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
  Future<void> removeTrackFromPlaylist(
      String playlistId, String trackId) async {
    await playlistItemsApiService
        .deleteTrackFromPlaylist(playlistId, requestBody: [trackId]);
  }

  @override
  Future<void> updatePlaylist(
      String id, String name, PlaylistVisibility visibility) {
    // TODO: implement updatePlaylist
    throw UnimplementedError();
  }

  @override
  Future<bool> isTrackInPlaylist(String playlistId, String trackId) async {
    return (await isTracksInPlaylist(playlistId, [trackId]))[trackId]!;
  }

  @override
  Future<Map<String, bool>> isTracksInPlaylist(
      String playlistId, List<String> trackIds) async {
    var result = <String, bool>{};

    List<PlaylistItemReadDto> playlistItems = [];
    int offset = 0;
    while (true) {
      var items = await playlistItemsApiService.getPlaylistItems(
        playlistId,
        limit: 50,
        start: offset,
      );

      if (items == null || items.isEmpty) {
        break;
      }
      playlistItems.addAll(items);

      offset += items.length;
      if (items.length < 50) {
        break;
      }
    }

    for (var trackId in trackIds) {
      result[trackId] =
          playlistItems.any((element) => element.trackId! == trackId);
    }

    return result;
  }

  @override
  Future<bool> isTrackInFavoriate(String trackId) async {
    return await isTrackInPlaylist(_favoriate.value.id!, trackId);
  }
}
