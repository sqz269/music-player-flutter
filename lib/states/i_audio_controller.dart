import 'package:get/get.dart';

enum PlayerState {
  idle,
  ready,
  pause,
  playing,
  completed,
}

abstract class IAudioController {
  static IAudioController to = Get.find<IAudioController>();

  Stream<bool> get isPlayingStream;
  Stream<bool> get isPausedStream;
  Stream<PlayerState> get playerStateStream;

  Stream<Duration?> get positionStream;
  Stream<Duration?> get durationStream;

  Stream<Duration?> get bufferedPositionStream;

  bool get isPlaying;
  bool get isPaused;
  PlayerState get playerState;

  Duration? get position;
  Duration? get duration;

  Duration? get bufferedPosition;

  Future<void> play(String src);
  Future<void> pause();
  Future<void> resume();
  Future<void> stop();

  Future<void> seekTo(Duration position);
}
