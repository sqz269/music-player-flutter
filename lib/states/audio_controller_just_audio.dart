import 'package:just_audio/just_audio.dart' as just_audio;
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/states/i_audio_controller.dart';

// should be a singleton
class AudioControllerJustAudio extends GetxController
    implements IAudioController {
  final just_audio.AudioPlayer _audioPlayer = just_audio.AudioPlayer();

  final _isPlaying = false.obs;
  final _isPaused = false.obs;
  final _playerState = PlayerState.playing.obs;
  final _loadingState = LoadingState.idle.obs;

  AudioControllerJustAudio() {}

  @override
  Future<void> pause() async {
    if (!_isPaused.value) {
      _isPaused.value = true;
      await _audioPlayer.pause();
    }
  }

  @override
  Future<void> resume() async {
    if (_isPaused.value) {
      _isPaused.value = false;
      _audioPlayer.play();
    }
  }

  @override
  Future<void> play(String src) async {
    _audioPlayer.setAudioSource(
      just_audio.HlsAudioSource(Uri.parse(src)),
    );

    _isPaused.value = false;
    await _audioPlayer.play();
  }

  @override
  Future<void> seekTo(Duration position) async {
    if (_isPlaying.value) {
      await _audioPlayer.seek(position);
    }
  }

  @override
  Future<void> stop() async {
    if (_isPlaying.value) {
      _isPlaying.value = false;
      _isPaused.value = false;
      _audioPlayer.stop();
    }
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
  PlayerState get playerState => throw UnimplementedError();

  @override
  Duration? get position => _audioPlayer.position;
}
