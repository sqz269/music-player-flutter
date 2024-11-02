import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/models/track_info.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/theme/theme.dart';

class AudioDebugPage extends StatefulWidget {
  AudioDebugPage({super.key});

  @override
  State<AudioDebugPage> createState() => _AudioDebugPageState();
}

class _AudioDebugPageState extends State<AudioDebugPage> {
  final IAudioService audioService = Get.find<IAudioService>();

  final QueueService queueService = Get.find<QueueService>();

  final TextEditingController _textController = TextEditingController();

  final RxList<String> _log = RxList<String>([]);

  @override
  void initState() {
    super.initState();
    audioService.playbackEventStream.listen((event) {
      _log.add(event.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Debug')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Audio Service Implementor: ${audioService.runtimeType}'),
              const SizedBox(height: 10),
              Text('Queue Service Implementor: ${queueService.runtimeType}'),
              const SizedBox(height: 10),
              TextFormField(
                controller: _textController,
                decoration: const InputDecoration(labelText: 'Audio URL'),
              ),
              const SizedBox(height: 10),
              Obx(
                () => RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Is Playing: ', style: AppTextStyle.test),
                      TextSpan(
                        text: audioService.isPlaying.toString(),
                        style: AppTextStyle.test,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => RichText(
                  text: TextSpan(children: [
                    TextSpan(text: 'Position: ', style: AppTextStyle.test),
                    TextSpan(
                      text: audioService.position.toString(),
                      style: AppTextStyle.test,
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Buffered Position: ',
                      style: AppTextStyle.test,
                    ),
                    TextSpan(
                      text: audioService.bufferedPosition.toString(),
                      style: AppTextStyle.test,
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Duration: ',
                      style: AppTextStyle.test,
                    ),
                    TextSpan(
                      text: audioService.duration.toString(),
                      style: AppTextStyle.test,
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemBuilder: (context, index) => Text(_log[index]),
                    itemCount: _log.length,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  audioService.play(TrackInfo(
                    trackAudioUrl: _textController.text,
                    trackId: '',
                    trackTitle: _textController.text,
                    albumId: '',
                    albumTitle: '',
                    artists: [],
                    albumArtUrl: '',
                  ));
                },
                child: const Text('Play'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
