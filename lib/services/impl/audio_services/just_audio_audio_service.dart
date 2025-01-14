import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tlmc_player_app/models/track_info.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';

class JustAudioAudioService implements IAudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final Rx<Duration?> _bufferedPosition = Rx<Duration?>(null);
  @override
  Rx<Duration?> get bufferedPosition => _bufferedPosition;

  final Rx<Duration?> _duration = Rx<Duration?>(null);
  @override
  Rx<Duration?> get duration => _duration;

  final Rx<bool> _isPlaying = false.obs;
  @override
  Rx<bool> get isPlaying => _isPlaying;

  @override
  Stream<bool> get onComplete => _audioPlayer.processingStateStream
      .where((state) => state == ProcessingState.completed)
      .map((_) => true);

  @override
  Stream get playbackEventStream => _audioPlayer.playbackEventStream;

  final Rx<Duration?> _position = Rx<Duration?>(null);
  @override
  Rx<Duration?> get position => _position;

  final Rx<double> _volume = 100.0.obs;
  @override
  Rx<double> get volume => _volume;

  @override
  Future<void> pause() async {
    return _audioPlayer.pause();
  }

  @override
  Future<void> play(TrackInfo track) async {
    await _audioPlayer.setUrl(track.trackAudioUrl);
    return _audioPlayer.play();
  }

  @override
  Future<void> resume() {
    return _audioPlayer.play();
  }

  @override
  Future<void> togglePause() {
    return isPlaying.value ? pause() : resume();
  }

  @override
  Future<void> seekTo(Duration position) {
    return _audioPlayer.seek(position);
  }

  @override
  Future<void> stop() {
    return _audioPlayer.stop();
  }

  @override
  Future<void> setVolume(Object volume) {
    return _audioPlayer.setVolume(volume as double);
  }

  @override
  Future<void> dispose() {
    return _audioPlayer.dispose();
  }
}
