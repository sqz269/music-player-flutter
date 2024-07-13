import 'package:backend_client_api/api.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';

class RadioService {
  static const String groupTag = "radio";
  final _logger = Get.find<LoggingService>().getLogger("RadioService");

  Rx<bool> active = false.obs;

  final QueueService _queueService;
  final IAudioService _audioService;

  RadioService()
      : _queueService = Get.find<QueueService>(),
        _audioService = Get.find<IAudioService>() {
    _queueService.currentIndex.listen((event) {
      onCurrentPlayChanged();
    });

    active.listen((event) {
      _logger.i("Radio mode active state changed: $event");
      if (event) {
        onRadioModeActive();
      } else {
        onRadioModeDeactivated();
      }
    });
    _logger.i("RadioService initialized");
  }

  void onCurrentPlayChanged() {
    _logger.d(
        "Currently Playing changed, checking if more tracks are needed. Remaining: ${_queueService.remainingTracks}");

    if (active.value && _queueService.remainingTracks <= 10) {
      _logger.i("Queue is running low, loading more tracks");
      _loadTracks();
    }
  }

  Future onRadioModeActive() async {
    _logger.i("Radio mode activated, loading tracks");
    await _loadTracks();
  }

  void onRadioModeDeactivated() {
    _logger.i("Radio mode deactivated, clearing queue");
    _queueService.removeByGroupTag(groupTag, futureOnly: true);
  }

  Future _loadTracks() async {
    var client = Get.find<ApiClientProvider>();
    var trackApi = TrackApi(client.getApiClient());
    var tracks = await trackApi.getRandomSampleTrack(limit: 10);

    var trackIds = tracks!.tracks?.map((e) => e.id!).toList();

    if (trackIds == null) {
      return;
    }

    _queueService.addTracksById(trackIds, groupTag: groupTag);
  }
}
