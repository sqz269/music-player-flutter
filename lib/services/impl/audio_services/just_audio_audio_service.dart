import 'package:audio_service/audio_service.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tlmc_player_app/models/track_info.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';

class JustAudioAudioService implements IAudioService {
  final _logger = Get.find<LoggingService>().getLogger("JustAudioAudioService");
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
    _logger.d('Playing track: ${track.trackId} ${track.trackAudioUrl}');
    var source = HlsAudioSource(
      Uri.parse(track.trackAudioUrl),
      // tag: MediaItem(
      //   // Specify a unique ID for each media item:
      //   id: track.id.toString(),
      //   // Metadata to display in the notification:
      //   album: track.album!.albumName!.default_,
      //   title: track.name!.default_,
      //   artist: track.album!.albumArtist![0].name!,
      //   artUri: Uri.parse(
      //     track.album!.thumbnail!.medium!.url!,
      //   ),
      // ),
    );
    await _audioPlayer.setAudioSource(source);
    await _audioPlayer.play();
    _logger.d("Playing track: ${track.trackId} ${track.trackAudioUrl}");
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
