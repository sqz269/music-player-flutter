import 'package:just_audio/just_audio.dart' as just_audio;
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/states/i_audio_controller.dart';

// should be a singleton
class AudioControllerJustAudio extends GetxController
    implements IAudioController {
  final just_audio.AudioPlayer _audioPlayer = just_audio.AudioPlayer();

  final _isPlaying = false.obs;
  final _isPaused = false.obs;
  final _playerState = PlayerState.idle.obs;

  AudioControllerJustAudio() {
    _audioPlayer.processingStateStream.listen(
      (event) {
        switch (event) {
          case just_audio.ProcessingState.completed:
            _playerState.value = PlayerState.completed;
            break;
          default:
            break;
        }
      },
    );

    playerStateStream.listen(
      (event) {
        print("playerStateStream: $event");
      },
    );
  }

  @override
  Future<void> pause() async {
    if (_playerState.value == PlayerState.playing) {
      _playerState.value = PlayerState.pause;
      await _audioPlayer.pause();
    }
  }

  @override
  Future<void> resume() async {
    if (_playerState.value == PlayerState.pause) {
      print("Resuming");
      _playerState.value = PlayerState.playing;
      await _audioPlayer.play();
    }
  }

  @override
  Future<void> play(String src) async {
    if (_playerState.value != PlayerState.idle) {
      await stop();
    }

    _audioPlayer.setAudioSource(
      just_audio.HlsAudioSource(Uri.parse(src)),
    );

    _isPaused.value = false;
    _playerState.value = PlayerState.ready;
    await _audioPlayer.play();
    _playerState.value = PlayerState.playing;
  }

  @override
  Future<void> seekTo(Duration position) async {
    if (position < Duration.zero && position > duration!) {
      throw Exception("Invalid position");
    }

    if (_isPlaying.value) {
      await _audioPlayer.seek(position);
    }
  }

  @override
  Future<void> stop() async {
    if (_playerState.value == PlayerState.idle) {
      return;
    }

    _playerState.value = PlayerState.idle;
    _audioPlayer.stop();
  }

  @override
  Stream<PlayerState> get playerStateStream => _playerState.stream;

  @override
  Stream<Duration?> get positionStream => _audioPlayer.positionStream;

  @override
  Stream<Duration?> get bufferedPositionStream =>
      _audioPlayer.bufferedPositionStream;

  @override
  Stream<Duration?> get durationStream => _audioPlayer.durationStream;

  @override
  Stream<bool> get isPausedStream => _isPaused.stream;

  @override
  Stream<bool> get isPlayingStream => _isPlaying.stream;

  @override
  Duration? get bufferedPosition => _audioPlayer.bufferedPosition;

  @override
  Duration? get duration => _audioPlayer.duration;

  @override
  bool get isPaused => _isPaused.value;

  @override
  bool get isPlaying => _isPlaying.value;

  @override
  PlayerState get playerState => _playerState.value;

  @override
  Duration? get position => _audioPlayer.position;
}
