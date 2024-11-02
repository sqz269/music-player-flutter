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

    var circles = await circlesApi.getCircles();
    var originalAlbums = await originalAlbumsApi.getOriginalAlbums();
    var originalTracks = await originalAlbumsApi.getOriginalTracks();

    if (circles == null || originalAlbums == null || originalTracks == null) {
      change(null, status: RxStatus.error("Failed to load static data"));
      return;
    }

    change(
      StaticDataProviderStates(
        circles: circles,
        originalAlbums: originalAlbums,
        originalTracks: originalTracks,
      ),
      status: RxStatus.success(),
    );
  }
}
