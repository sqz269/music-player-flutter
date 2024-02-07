import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/controllers/desktop/screens/audio_test_screen_desktop.dart';
import 'package:tlmc_player_app/extensions/api_object_extension.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/views/common/widget/group_box.dart';

class AudioTestScreenDesktop extends StatefulWidget {
  final String trackId;
  final AudioTestScreenDesktopController controller;
  final List<dynamic> playbackEventHistory = [];

  final Rx<bool> _isDragging = false.obs;
  final Rx<double> _dragValue = 0.0.obs;

  AudioTestScreenDesktop({super.key, required this.trackId})
      : controller = Get.put(
          AudioTestScreenDesktopController(trackId: trackId),
          tag: trackId,
        );

  @override
  State<AudioTestScreenDesktop> createState() => _AudioTestScreenDesktopState();
}

class _AudioTestScreenDesktopState extends State<AudioTestScreenDesktop> {
  String getTrackAssetUrl(String trackId) =>
      'https://api-music.marisad.me/api/asset/track/$trackId';

  @override
  void initState() {
    super.initState();

    var audioService = Get.find<IAudioService>();

    audioService.playbackEventStream.listen((event) {
      widget.playbackEventHistory.add(event);
    });
  }

  Widget _buildControl(
      AudioTestScreenDesktopStates state, BuildContext context) {
    var audioService = Get.find<IAudioService>();

    var seekSlideBar = Obx(() {
      var duration =
          audioService.duration.value?.inMilliseconds.toDouble() ?? 0;
      var position =
          audioService.position.value?.inMilliseconds.toDouble() ?? 0;
      var bufferedPosition =
          audioService.bufferedPosition.value?.inMilliseconds.toDouble() ?? 0;

      if (position > duration) {
        position = duration;
      }

      return Row(
        children: [
          Text('Seek'),
          Expanded(
            child: Obx(
              // TODO: Debounce the slider value change
              () => Slider(
                onChangeStart: (value) {
                  print("onChangeStart: $value");
                  widget._isDragging.value = true;
                  widget._dragValue.value = value;
                },
                onChangeEnd: (value) {
                  print("onChangeEnd: $value");
                  widget._isDragging.value = false;

                  audioService.seekTo(Duration(milliseconds: value.toInt()));
                },
                onChanged: (value) {
                  widget._dragValue.value = value;
                },
                value: widget._isDragging.value
                    ? widget._dragValue.value
                    : position,
                min: 0,
                max:
                    audioService.duration.value?.inMilliseconds.toDouble() ?? 0,
                secondaryTrackValue: audioService
                        .bufferedPosition.value?.inMilliseconds
                        .toDouble() ??
                    0,
              ),
            ),
          ),
        ],
      );
    });

    var volumeSlideBar = Obx(
      () => Row(
        children: [
          Text('Volume'),
          Expanded(
            child: Slider(
              value: audioService.volume.value,
              min: 0,
              max: 100,
              onChanged: (value) {
                audioService.setVolume(value);
              },
            ),
          ),
        ],
      ),
    );

    var audioControlRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          label: Text('Load and Play'),
          icon: Icon(Icons.upload),
          onPressed: () {
            audioService.play(state.track.toTrackInfo());
          },
        ),
        ElevatedButton.icon(
          label: Text('Resume'),
          icon: Icon(Icons.play_arrow),
          onPressed: () {
            audioService.resume();
          },
        ),
        ElevatedButton.icon(
          label: Text('Pause'),
          icon: Icon(Icons.pause),
          onPressed: () {
            audioService.pause();
          },
        ),
        ElevatedButton.icon(
          label: Text('Stop'),
          icon: Icon(Icons.stop),
          onPressed: () {
            audioService.stop();
          },
        ),
      ],
    );

    return SliverPadding(
      padding: const EdgeInsets.only(top: 16.0),
      sliver: SliverToBoxAdapter(
        child: GroupBox(
          title: 'Control',
          child: Column(
            children: [
              seekSlideBar,
              volumeSlideBar,
              audioControlRow,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackOverviewSection(
      AudioTestScreenDesktopStates state, BuildContext context) {
    return SliverToBoxAdapter(
      child: GroupBox(
        title: 'Track Overview',
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text(state.track.name!.default_),
              subtitle: Text('Track Name'),
            ),
            ListTile(
              title: Text('${state.track.id}'),
              subtitle: Text('Track Id'),
            ),
            ListTile(
              title: Text(getTrackAssetUrl(state.track.id!)),
              subtitle: Text('Track Asset Url'),
            ),
            ListTile(
              title: Text(state.track.duration!),
              subtitle: Text('Expected Duration'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioServiceImplementerInfo(
      AudioTestScreenDesktopStates state, BuildContext context) {
    var audioService = Get.find<IAudioService>();

    return SliverPadding(
      padding: const EdgeInsets.only(top: 16.0),
      sliver: SliverToBoxAdapter(
        child: GroupBox(
          title: 'Audio Service Implementer Info',
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text(Platform.operatingSystem),
                subtitle: Text('Current Platform'),
              ),
              ListTile(
                title: Text(audioService.runtimeType.toString()),
                subtitle: Text('Audio Service Implementer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAudioServiceCurrentState(
      AudioTestScreenDesktopStates state, BuildContext context) {
    var audioService = Get.find<IAudioService>();

    return SliverPadding(
      padding: const EdgeInsets.only(top: 16.0),
      sliver: SliverToBoxAdapter(
        child: GroupBox(
          title: 'Audio Service Current State',
          child: ListView(
            shrinkWrap: true,
            children: [
              Obx(
                () => ListTile(
                  title: Text(audioService.position.value?.toString() ?? ''),
                  subtitle: Text('Position'),
                ),
              ),
              Obx(
                () => ListTile(
                  title: Text(audioService.duration.value?.toString() ?? ''),
                  subtitle: Text('Duration'),
                ),
              ),
              Obx(
                () => ListTile(
                  title: Text(
                      audioService.bufferedPosition.value?.toString() ?? ''),
                  subtitle: Text('Buffered Position'),
                ),
              ),
              Obx(
                () => ListTile(
                  title: Text(audioService.volume.value.toString()),
                  subtitle: Text('Volume'),
                ),
              ),
              Obx(
                () => ListTile(
                  title: Text(audioService.isPlaying.value.toString()),
                  subtitle: Text('Is Playing'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAudioServiceEventHistory(
      AudioTestScreenDesktopStates state, BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 16.0),
      sliver: SliverToBoxAdapter(
        child: GroupBox(
          title: 'Audio Service Event History',
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.playbackEventHistory.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.playbackEventHistory[index].toString()),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMainView(
      AudioTestScreenDesktopStates? state, BuildContext context) {
    if (state == null) {
      return Container(
        child: Text('No data'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(state.track.name!.default_),
      ),
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            _buildTrackOverviewSection(state, context),
            _buildAudioServiceImplementerInfo(state, context),
            _buildControl(state, context),
            _buildAudioServiceCurrentState(state, context),
            _buildAudioServiceEventHistory(state, context),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.controller.obx(
      onLoading: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      (state) => _buildMainView(state, context),
    );
  }
}
