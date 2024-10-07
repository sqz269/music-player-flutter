import 'package:audio_service/audio_service.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/services/api/i_media_session_sevice.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';

class CrossPlatformMediaSessionService extends BaseAudioHandler
    implements IMediaSessionService {
  final _logger =
      Get.find<LoggingService>().getLogger("CrossPlatformMediaSessionService");

  final QueueService queueService;
  final IAudioService audioService;

  CrossPlatformMediaSessionService()
      : queueService = Get.find<QueueService>(),
        audioService = Get.find<IAudioService>() {
    initialize();
  }

  void initialize() {
    _logger.i("Initializing Cross Platform Media Session Service");
  }
}
