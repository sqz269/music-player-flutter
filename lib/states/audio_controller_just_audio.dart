import 'package:just_audio/just_audio.dart' as just_audio;
import 'package:audio_service/audio_service.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/states/i_audio_controller.dart';
import 'package:BackendClientApi/api.dart';

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

    _audioPlayer.positionStream.listen((event) {
      print("positionStream: $event");
    });

    _audioPlayer.durationStream.listen((event) {
      print("durationStream: $event");
    });
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
  Future<void> play(String src, TrackReadDto trackInfo) async {
    if (_playerState.value != PlayerState.idle) {
      await stop();
    }

    var source = just_audio.HlsAudioSource(
      Uri.parse(src),
      tag: MediaItem(
        // Specify a unique ID for each media item:
        id: trackInfo.id.toString(),
        // Metadata to display in the notification:
        album: trackInfo.album!.albumName!.default_,
        title: trackInfo.name!.default_,
        artist: trackInfo.album!.albumArtist![0].name!,
        artUri: Uri.parse(
          trackInfo.album!.thumbnail!.medium!.url!,
        ),
      ),
    );
    await _audioPlayer.setAudioSource(source);

    _isPaused.value = false;
    _playerState.value = PlayerState.ready;
    await _audioPlayer.play();
    _playerState.value = PlayerState.playing;
    // .then((value) {
    //   if (_audioPlayer.playerState.playing) {
    //     print("Playing now");
    //     _playerState.value = PlayerState.playing;
    //   }
    // });
  }

  @override
  Future<void> seekTo(Duration position) async {
    if (position < Duration.zero && position > duration!) {
      throw Exception("Invalid position");
    }

    if (playerState == PlayerState.idle) {
      return;
    }

    await _audioPlayer.seek(position);
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
