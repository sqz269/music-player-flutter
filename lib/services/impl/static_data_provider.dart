import 'package:get/get.dart';
import 'package:backend_client_api/api.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';

class StaticDataProviderStates {
  final List<CircleReadDto> circles;
  final List<OriginalAlbumReadDto> originalAlbums;
  final List<OriginalTrackReadDto> originalTracks;

  StaticDataProviderStates({
    required this.circles,
    required this.originalAlbums,
    required this.originalTracks,
  });
}

class StaticDataProvider extends GetxController
    with StateMixin<StaticDataProviderStates> {
  final _logger = Get.find<LoggingService>().getLogger("StaticDataProvider");

  @override
  void onInit() {
    super.onInit();

    _loadData();
  }

  void _loadData() async {
    change(null, status: RxStatus.loading());

    _logger.d("Loading static data");

    var apiClient = Get.find<ApiClientProvider>().getApiClient();

    var circlesApi = CircleApi(apiClient);
    var originalAlbumsApi = OriginalAlbumApi(apiClient);

    var hasError = false;

    var allCircles = <CircleReadDto>[];
    {
      var offset = 0;
      var limit = 100;
      while (true) {
        var circles = await circlesApi.getCircles(start: offset, limit: limit);
        if (circles == null || circles.isEmpty) {
          break;
        }
        allCircles.addAll(circles);
        _logger.i("Loaded ${circles.length} circles");
        offset += limit;
      }
      _logger.i("Loaded ${allCircles.length} circles");
    }

    var allOriginalAlbums = <OriginalAlbumReadDto>[];
    {
      var offset = 0;
      var limit = 100;
      while (true) {
        var originalAlbums = await originalAlbumsApi.getOriginalAlbums(
            start: offset, limit: limit);
        if (originalAlbums == null || originalAlbums.isEmpty) {
          break;
        }
        allOriginalAlbums.addAll(originalAlbums);
        _logger.i("Loaded ${originalAlbums.length} original albums");
        offset += limit;
      }
      _logger.i("Loaded ${allOriginalAlbums.length} original albums");
    }

    var allOriginalTracks = <OriginalTrackReadDto>[];
    {
      var offset = 0;
      var limit = 100;
      while (true) {
        var originalTracks = await originalAlbumsApi.getOriginalTracks(
            start: offset, limit: limit);
        if (originalTracks == null || originalTracks.isEmpty) {
          break;
        }
        allOriginalTracks.addAll(originalTracks);
        _logger.i("Loaded ${originalTracks.length} original tracks");
        offset += limit;
      }
      _logger.i("Loaded ${allOriginalTracks.length} original tracks");
    }

    if (hasError) {
      change(null, status: RxStatus.error("Failed to load static data"));
      return;
    }

    change(
      StaticDataProviderStates(
        circles: allCircles,
        originalAlbums: allOriginalAlbums,
        originalTracks: allOriginalTracks,
      ),
      status: RxStatus.success(),
    );
  }
}
