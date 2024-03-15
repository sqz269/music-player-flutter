import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:tlmc_player_app/controllers/desktop/desktop_application_controller.dart';
import 'package:tlmc_player_app/extensions/api_object_extension.dart';
import 'package:tlmc_player_app/services/api/i_audio_service.dart';
import 'package:tlmc_player_app/services/api/i_playlist_service.dart';
import 'package:tlmc_player_app/services/impl/logging_service.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/services/impl/radio_service.dart';
import 'package:tlmc_player_app/utils/duration_utils.dart';
import 'package:tlmc_player_app/views/desktop/screens/add_to_playlist_modal_desktop.dart';

class BottomPlayBarDesktop extends StatefulWidget {
  final _logger = Get.find<LoggingService>().getLogger('BottomPlayBarDesktop');
  final IAudioService audioService;
  final QueueService queueService;
  final IPlaylistService playlistService;
  final RadioService radioService;
  final RxBool isCurrentTrackInFavorite = false.obs;

  BottomPlayBarDesktop({super.key})
      : audioService = Get.find<IAudioService>(),
        queueService = Get.find<QueueService>(),
        playlistService = Get.find<IPlaylistService>(),
        radioService = Get.find<RadioService>();

  @override
  State<BottomPlayBarDesktop> createState() => _BottomPlayBarDesktopState();
}

class _BottomPlayBarDesktopState extends State<BottomPlayBarDesktop> {
  final Rx<bool> _isDraggingProgressBar = false.obs;
  final Rx<double> _dragProgressBarValue = 0.0.obs;

  Widget _buildCurrentlyPlayingAlbumThumbnail(BuildContext context) {
    var currentTrack = widget.queueService.currentTrack.value;

    if (currentTrack == null || currentTrack.track.album!.thumbnail == null) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            child: const Icon(
              Icons.album,
              size: 48,
              color: Colors.grey,
            ),
          );
        },
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.network(
          currentTrack.track.toTrackInfo().albumArtUrl!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCurrentlyPlayingTrackInfoCardTrackInfo(BuildContext context) {
    return Obx(
      () {
        var currentTrack = widget.queueService.currentTrack.value;

        if (currentTrack == null) {
          return Expanded(
            flex: 2,
            child: Container(),
          );
        } else {
          widget.playlistService
              .isTrackInFavoriate(currentTrack.track.id!)
              .then((value) => widget.isCurrentTrackInFavorite.value = value);
        }

        var artistsTextSpans = <TextSpan>[];

        var trackInfo = currentTrack.track.toTrackInfo();
        for (var artist in trackInfo.artists) {
          artistsTextSpans.add(
            TextSpan(
              text: artist.circleName,
              style: Theme.of(context).textTheme.bodyLarge,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.find<DesktopApplicationController>()
                      .getCurrentPageKey()!
                      .currentState!
                      .pushNamed('/circle/${artist.circleId}');
                },
            ),
          );
          artistsTextSpans.add(const TextSpan(text: ', '));
        }

        artistsTextSpans.removeLast();

        return Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trackInfo.trackTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                // spacer
                const SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    text: trackInfo.albumTitle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.find<DesktopApplicationController>()
                            .getCurrentPageKey()!
                            .currentState!
                            .pushNamed('/album/${trackInfo.albumId}');
                      },
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: artistsTextSpans,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCurrentlyPlayingTrackInfoCardFavBar(BuildContext context) {
    var currentTrack = widget.queueService.currentTrack.value;

    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
              widget.isCurrentTrackInFavorite.value
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red.shade600,
            ),
            onPressed: () {
              if (widget.isCurrentTrackInFavorite.value) {
                widget.playlistService
                    .removeTrackFromFavoriate(currentTrack!.track.id!)
                    .then((value) {
                  widget._logger.d("Removed track from favoriate");
                  widget.isCurrentTrackInFavorite.value = false;
                });
              } else {
                widget.playlistService
                    .addTrackToFavoriate(currentTrack!.track.id!)
                    .then((value) {
                  widget._logger.d("Added track to favoriate");
                  widget.isCurrentTrackInFavorite.value = true;
                });
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.playlist_add_outlined),
            color: Colors.purple.shade600,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AddToPlaylistModalDesktop(
                    trackId: currentTrack!.track.id!,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentlyPlayingTrackInfoCard(BuildContext context) {
    return Obx(
      () {
        var currentTrack = widget.queueService.currentTrack.value;

        if (currentTrack == null) {
          return Expanded(
            flex: 2,
            child: Container(),
          );
        }

        return Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                _buildCurrentlyPlayingAlbumThumbnail(context),
                _buildCurrentlyPlayingTrackInfoCardTrackInfo(context),
                _buildCurrentlyPlayingTrackInfoCardFavBar(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressSlider(BuildContext context) {
    return Obx(
      () {
        var duration = widget.audioService.duration.value ?? Duration.zero;
        var position = widget.audioService.position.value ?? Duration.zero;
        var bufferedPosition =
            widget.audioService.bufferedPosition.value ?? Duration.zero;

        var durationString =
            DurationUtils.formatDuration(widget.audioService.duration.value);
        var positionString =
            DurationUtils.formatDuration(widget.audioService.position.value);

        if (position > duration) {
          position = duration;
        }

        var positionActual = _isDraggingProgressBar.value
            ? _dragProgressBarValue.value
            : position.inMilliseconds.toDouble();

        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                positionString,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Expanded(
              child: Slider(
                onChangeStart: (value) {
                  _isDraggingProgressBar.value = true;
                  _dragProgressBarValue.value = value;
                },
                onChangeEnd: (value) {
                  _isDraggingProgressBar.value = false;
                  widget.audioService
                      .seekTo(Duration(milliseconds: value.toInt()));
                },
                onChanged: (value) {
                  _dragProgressBarValue.value = value;
                },
                min: 0,
                max: duration.inMilliseconds.toDouble(),
                value: positionActual,
                secondaryTrackValue: bufferedPosition.inMilliseconds.toDouble(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                durationString,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAudioMainControl(BuildContext context) {
    var playOrPauseButton = Obx(
      () {
        // A track is not playing and not paused if
        // There is no track in the queue
        var shouldDisable = widget.queueService.queue.isEmpty ||
            widget.queueService.currentTrack.value == null;

        onclick() {
          if (widget.audioService.isPlaying.value) {
            widget.audioService.pause();
          } else {
            widget.audioService.resume();
          }
        }

        return IconButton(
          padding: const EdgeInsets.all(16),
          icon: widget.audioService.isPlaying.value
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow),
          onPressed: shouldDisable ? null : onclick,
        );
      },
    );

    var playNextButton = Obx(
      () {
        onclick() {
          widget.queueService.playNext();
        }

        return IconButton(
          icon: const Icon(Icons.skip_next),
          onPressed: widget.queueService.hasNext ? onclick : null,
        );
      },
    );

    var playPreviousButton = Obx(
      () {
        onclick() {
          widget.queueService.playPrevious();
        }

        return IconButton(
          icon: const Icon(Icons.skip_previous),
          onPressed: widget.queueService.hasPrevious ? onclick : null,
        );
      },
    );

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              playPreviousButton,
              playOrPauseButton,
              playNextButton,
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }

  Widget _buildPlayerControlView(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          Expanded(
            child: _buildAudioMainControl(context),
          ),
          Expanded(
            child: _buildProgressSlider(context),
          ),
        ],
      ),
    );
  }

  Widget _buildVolumeControlSlider(BuildContext context) {
    return Obx(
      () {
        var volumeIcon = widget.audioService.volume.value > 50
            ? Icons.volume_up
            : Icons.volume_down;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(
                volumeIcon,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 2,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 8),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 16),
                ),
                child: Slider(
                  min: 0,
                  max: 100,
                  value: widget.audioService.volume.value,
                  onChanged: (value) {
                    widget.audioService.setVolume(value);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAuxiliaryControlView(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Obx(() {
                  var isRadioModeActive = widget.radioService.active.value;

                  var iconColor = isRadioModeActive
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade600;

                  return IconButton(
                    icon: Icon(
                      Icons.radio,
                      color: iconColor,
                    ),
                    onPressed: () {
                      widget.radioService.active.toggle();
                    },
                    tooltip: isRadioModeActive
                        ? "Exit radio mode"
                        : "Enter radio mode",
                  );
                }),
                IconButton(
                  icon: const Icon(Icons.shuffle),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.repeat),
                  onPressed: () {},
                ),
                IconButton(
                  onPressed: () {
                    var appController =
                        Get.find<DesktopApplicationController>();
                    if (appController.getCurrentPath() == "/queue") {
                      appController.getCurrentPageKey()!.currentState!.pop();
                    } else {
                      appController
                          .getCurrentPageKey()
                          ?.currentState
                          ?.pushNamed("/queue");
                    }
                  },
                  icon: const Icon(Icons.queue_music),
                ),
                _buildVolumeControlSlider(context),
              ],
            ),
          ],
        ));
  }

  Widget _buildMainView(BuildContext context) {
    return Row(
      children: [
        _buildCurrentlyPlayingTrackInfoCard(context),
        _buildPlayerControlView(context),
        _buildAuxiliaryControlView(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        height: 125,
        child: _buildMainView(context),
      ),
    );
  }
}
