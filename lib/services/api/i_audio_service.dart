import 'package:get/get.dart';
import 'package:tlmc_player_app/models/track_info.dart';

abstract class IAudioService {
  Rx<Duration?> get position;
  Rx<Duration?> get duration;
  Rx<Duration?> get bufferedPosition;
  Rx<double> get volume;
  Rx<bool> get isPlaying;

  Stream<bool> get onComplete;
  Stream<dynamic> get playbackEventStream;

  Future<void> play(TrackInfo track);
  Future<void> pause();
  Future<void> resume();
  Future<void> togglePause();
  Future<void> seekTo(Duration position);
  Future<void> stop();
  Future<void> setVolume(double volume);
  Future<void> dispose();
}
