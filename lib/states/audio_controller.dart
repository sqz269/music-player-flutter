import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';

// should be a singleton
class AudioController extends GetxController {
  static AudioController get to => Get.find<AudioController>();

  final _player = AudioPlayer();

  var volume = 1.0.obs;
  var paused = false.obs;
  var position = Rx<Duration?>(null);
  var duration = Rx<Duration?>(null);
  var state = ProcessingState.idle.obs;
  var completed = false.obs;

  AudioController() {
    _player.playerStateStream.listen((event) {
      state.value = event.processingState;

      if (event.processingState == ProcessingState.completed) {
        completed.value = true;
      } else {
        completed.value = false;
      }
    });

    _player.positionStream.listen((event) {
      position.value = event;
    });

    _player.durationStream.listen((event) {
      duration.value = event;
    });
  }

  Future<bool> play(String src) async {
    try {
      await _player.setUrl(src);

      // only play if not paused
      if (!paused.value) {
        await _player.play();
      }
      return true;
    } catch (e) {
      // TODO: handle error
      print(e);
      return false;
    }
  }

  Future<void> pause() async {
    if (paused.value) {
      return;
    }

    await _player.pause();
    paused.value = true;
  }

  Future<void> resume() async {
    if (!paused.value) {
      return;
    }

    await _player.play();
    paused.value = false;
  }

  Future<void> togglePause() async {
    if (paused.value) {
      await resume();
    } else {
      await pause();
    }
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume);
    this.volume.value = volume;
  }
}
