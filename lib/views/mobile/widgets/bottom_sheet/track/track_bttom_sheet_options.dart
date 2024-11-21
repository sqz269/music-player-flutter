import 'dart:ui';

import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/queue_service.dart';
import 'package:tlmc_player_app/views/mobile/widgets/bottom_sheet/track/i_track_bottom_sheet_options.dart';
import 'package:tlmc_player_app/views/mobile/widgets/bottom_sheet/track/track_bottom_sheet_builder.dart';

class TrackBottomSheetOptionPlayNext extends ITrackBottomSheetOption {
  final TrackReadDto trackData;
  final List<VoidCallback> callback = [];

  final QueueService queueService = Get.find<QueueService>();
  TrackBottomSheetOptionPlayNext({super.key, required this.trackData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.playlist_play),
      title: const Text('Play next'),
      onTap: () {
        queueService.addTrackById(trackData.id!).then(
          (value) {
            Navigator.of(context).pop();
            // MobileMiniplayerBarController.to.expand();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Added to queue'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        );
      },
    );
  }

  @override
  void addCallback(VoidCallback callback) {
    this.callback.add(callback);
  }
}

class TrackBottomSheetOptionAddToQueue extends ITrackBottomSheetOption {
  final TrackReadDto trackData;
  TrackBottomSheetOptionAddToQueue({super.key, required this.trackData});

  final QueueService queueService = Get.find<QueueService>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.queue_music),
      title: const Text('Add to Queue'),
      onTap: () {},
    );
  }

  @override
  void addCallback(VoidCallback callback) {
    // TODO: implement addCallback
  }
}

class TrackBottomSheetOptionAddToPlaylist extends ITrackBottomSheetOption {
  final TrackReadDto trackData;
  const TrackBottomSheetOptionAddToPlaylist(
      {super.key, required this.trackData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.playlist_add),
      title: const Text('Save to playlist'),
      onTap: () {},
    );
  }

  @override
  void addCallback(VoidCallback callback) {
    // TODO: implement addCallback
  }
}

class TrackBottomSheetOptionGoToArtist extends ITrackBottomSheetOption {
  final AlbumReadDto albumData;
  final List<VoidCallback> callback = [];
  TrackBottomSheetOptionGoToArtist({super.key, required this.albumData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.interpreter_mode),
      title: const Text('Go To Artist'),
      onTap: () {},
    );
  }

  @override
  void addCallback(VoidCallback callback) {
    this.callback.add(callback);
  }
}

class TrackBottomSheetOptionSearchOnYoutube extends ITrackBottomSheetOption {
  final TrackReadDto trackData;
  TrackBottomSheetOptionSearchOnYoutube({super.key, required this.trackData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(FontAwesomeIcons.youtube),
      title: const Text('Search on YouTube'),
      onTap: () {},
    );
  }

  @override
  void addCallback(VoidCallback callback) {
    // TODO: implement addCallback
  }
}

class TrackBottomSheetOptionGoToAlbum extends ITrackBottomSheetOption {
  final AlbumReadDto albumData;
  final List<VoidCallback> callback = [];

  TrackBottomSheetOptionGoToAlbum({super.key, required this.albumData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.album),
      title: const Text('Go To Album'),
      onTap: () {},
    );
  }

  @override
  void addCallback(VoidCallback callback) {
    this.callback.add(callback);
  }
}

extension TrackBotSheetOptions on TrackBottomSheetBuilder {
  TrackBottomSheetBuilder withPlayNext() {
    return addOption(
      TrackBottomSheetOptionPlayNext(
        trackData: trackData,
      ),
    );
  }

  TrackBottomSheetBuilder withAddToQueue() {
    return addOption(
      TrackBottomSheetOptionAddToQueue(
        trackData: trackData,
      ),
    );
  }

  TrackBottomSheetBuilder withAddToPlaylist() {
    return addOption(
      TrackBottomSheetOptionAddToPlaylist(
        trackData: trackData,
      ),
    );
  }

  TrackBottomSheetBuilder withGoToArtist() {
    return addOption(
      TrackBottomSheetOptionGoToArtist(
        albumData: albumData,
      ),
    );
  }

  TrackBottomSheetBuilder withGoToAlbum() {
    return addOption(
      TrackBottomSheetOptionGoToAlbum(
        albumData: albumData,
      ),
    );
  }

  TrackBottomSheetBuilder withSearchOnYoutube() {
    return addOption(
      TrackBottomSheetOptionSearchOnYoutube(
        trackData: trackData,
      ),
    );
  }
}
