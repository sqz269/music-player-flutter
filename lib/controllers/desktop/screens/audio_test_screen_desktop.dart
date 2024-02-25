import 'package:BackendClientApi/api.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';

class AudioTestScreenDesktopStates {
  final String trackId;
  final TrackReadDto track;

  AudioTestScreenDesktopStates({
    required this.trackId,
    required this.track,
  });
}

class AudioTestScreenDesktopController extends GetxController
    with StateMixin<AudioTestScreenDesktopStates> {
  final String trackId;

  AudioTestScreenDesktopController({required this.trackId});

  @override
  void onInit() {
    super.onInit();

    loadTrack();
  }

  Future<void> loadTrack() async {
    change(null, status: RxStatus.loading());

    try {
      var trackApi = AlbumApi(Get.find<ApiClientProvider>().getApiClient());

      var track = (await trackApi.getTrack(trackId))!;

      change(AudioTestScreenDesktopStates(trackId: trackId, track: track),
          status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
