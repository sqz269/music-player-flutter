import 'dart:ffi';

import 'package:get/get.dart';
import 'package:smtc_windows/smtc_windows.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/services/api/i_media_session_sevice.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/extensions/api_object_extension.dart';

class WindowsSmtcMediaSessionService implements IMediaSessionService {
  final _logger =
      Get.find<LoggingService>().getLogger("WindowsSmtcMediaSessionService");

  final SMTCWindows smtcService;
  final QueueService queueService;
  final IAudioService audioService;

  WindowsSmtcMediaSessionService()
      : smtcService = SMTCWindows(),
        queueService = Get.find<QueueService>(),
        audioService = Get.find<IAudioService>() {
    initialize();
  }

  void initialize() {
    _logger.i("Initializing Windows SMTC Media Session Service");

    smtcService.updateConfig(
      const SMTCConfig(
          playEnabled: true,
          pauseEnabled: true,
          stopEnabled: true,
          nextEnabled: true,
          prevEnabled: true,
          fastForwardEnabled: true,
          rewindEnabled: true),
    );

    bindClicks();
    bindEvents();
  }

  SMTCConfig audioStatesToConfig() {
    return SMTCConfig(
      playEnabled: true,
      pauseEnabled: true,
      stopEnabled: audioService.isPlaying.value,
      nextEnabled: queueService.hasNext,
      prevEnabled: queueService.hasPrevious,
      fastForwardEnabled: audioService.isPlaying.value,
      rewindEnabled: audioService.isPlaying.value,
    );
  }

  void bindClicks() {
    smtcService.buttonPressStream.listen((event) {
      _logger.i("Button pressed: $event");
      if (event == PressedButton.play || event == PressedButton.pause) {
        audioService.togglePause();

        smtcService.setPlaybackStatus(audioService.isPlaying.value
            ? PlaybackStatus.Playing
            : PlaybackStatus.Paused);
      } else if (event == PressedButton.stop) {
        audioService.stop();
      } else if (event == PressedButton.next) {
        queueService.playNext();
      } else if (event == PressedButton.previous) {
        queueService.playPrevious();
      }
    });

    smtcService.shuffleChangeStream.listen((event) {
      _logger.i("Shuffle changed: $event");
    });

    smtcService.repeatModeChangeStream.listen((event) {
      _logger.i("Repeat mode changed: $event");
    });
  }

  void bindEvents() {
    queueService.queue.listen((queue) {
      // If not have next, disable next button
      smtcService.updateConfig(
        audioStatesToConfig(),
      );
    });

    audioService.isPlaying.listen((isPlaying) {
      _logger.i("Is playing changed: $isPlaying");
      smtcService.setPlaybackStatus(
          isPlaying ? PlaybackStatus.Playing : PlaybackStatus.Paused);
    });

    queueService.currentIndex.stream.listen((index) {
      _logger.i("Current index changed: $index");
      var trackData = queueService.queue[index].track.toTrackInfo();

      smtcService.updateConfig(
        audioStatesToConfig(),
      );

      smtcService.updateMetadata(
        MusicMetadata(
          title: trackData.trackTitle,
          artist: trackData.artists.map((e) => e.circleName).join(", "),
          album: trackData.albumTitle,
          thumbnail: trackData.albumArtUrl,
        ),
      );
    });
  }
}
