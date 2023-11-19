import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import 'package:BackendClientApi/api.dart';
import 'package:tlmc_player_flutter/model/queued_track.dart';

import 'package:tlmc_player_flutter/services/api_client_provider.dart';
import 'package:tlmc_player_flutter/states/audio_controller_just_audio.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';

class RadioService {
  late AudioControllerJustAudio _audioController;
  late QueueController _queueController;

  RadioService() {
    _audioController = Get.find<AudioControllerJustAudio>();
    _queueController = Get.find<QueueController>();

    _queueController.queueModeNotifier.stream.listen(
      (event) {
        // populate immidiately if we are in radio mode
        print(
            "Current Queue Mode: ${_queueController.queueModeNotifier.value}");
        _updateQueue();
      },
    );

    // _audioController.processingStateStream.listen(
    //   (event) {
    //     if (event == ProcessingState.completed &&
    //         _queueController.queueModeNotifier.value == QueueMode.radio) {
    //       _updateQueue();
    //     }
    //   },
    // );

    _queueController.playingIndex.stream.listen(
      (event) {
        if (event == -1) {
          return;
        }
        if (event == _queueController.queue.length - 1) {
          _updateQueue();
        }
      },
    );
  }

  Future<List<TrackReadDto>> _loadTracks() async {
    var albumsApi = AlbumApi(Get.find<ApiClientProvider>().getApiClient());

    var tracks = await albumsApi.getRandomSampleTrack(limit: 10);
    return tracks!;
  }

  Future _updateQueue() async {
    // if queue is not in radio mode, none of our business
    if (_queueController.queueMode != QueueMode.radio) {
      return;
    }

    print(
        "Queue Update Requested: ${_queueController.playingIndex.value}, ${_queueController.queue.length}");

    // check if we are currently playing the last track in the queue
    // if not, we don't need to update the queue
    if (_queueController.playingIndex.value !=
        _queueController.queue.length - 1) {
      return;
    }

    // reached end of queue, we need to insert more items to the queue
    var trackIds = (await _loadTracks()).map((e) => e.id!).toList();
    await _queueController.addTracksById(trackIds, source: AddedBy.radio);
  }
}
