import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:tlmc_player_app/models/track_info.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:async/async.dart';

class MediaKitAudioService implements IAudioService {
  late final player = Player();

  final _bufferedPosition = Rx<Duration?>(null);
  @override
  Rx<Duration?> get bufferedPosition => _bufferedPosition;

  final _duration = Rx<Duration?>(null);
  @override
  Rx<Duration?> get duration => _duration;

  final _isPlaying = false.obs;
  @override
  Rx<bool> get isPlaying => _isPlaying;

  late Stream<dynamic> _playbackEventStream;
  @override
  Stream<dynamic> get playbackEventStream => _playbackEventStream;

  final _position = Rx<Duration?>(null);
  @override
  Rx<Duration?> get position => _position;

  @override
  Stream<bool> get onComplete => player.stream.completed.where(
        (event) {
          if (event) {
            return true;
          } else {
            return false;
          }
        },
      );

  final _volume = 100.0.obs;
  @override
  Rx<double> get volume => _volume;

  MediaKitAudioService() {
    _volume.bindStream(player.stream.volume);
    _position.bindStream(player.stream.position);
    _duration.bindStream(player.stream.duration);
    _bufferedPosition.bindStream(player.stream.buffer);
    _isPlaying.bindStream(player.stream.playing);

    _playbackEventStream = StreamGroup.mergeBroadcast([
      player.stream.log,
      player.stream.error,
    ]);
  }

  @override
  Future<void> pause() async {
    if (_isPlaying.value) {
      player.pause();
    }
  }

  @override
  Future<void> play(TrackInfo track) async {
    await player.open(Media(track.trackAudioUrl));
  }

  @override
  Future<void> resume() async {
    if (!isPlaying.value) {
      player.play();
    }
  }

  @override
  Future<void> seekTo(Duration position) async {
    await player.seek(position);
  }

  @override
  Future<void> stop() async {
    player.stop();
  }

  @override
  Future<void> setVolume(double volume) async {
    player.setVolume(volume);
  }

  @override
  Future<void> dispose() async {
    player.dispose();
  }
}
