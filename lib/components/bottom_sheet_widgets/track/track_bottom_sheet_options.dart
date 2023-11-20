import 'package:BackendClientApi/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/components/bottom_sheet_add_to_playlist.dart';
import 'package:tlmc_player_flutter/components/bottom_sheet_widgets/track/i_track_sheet_option.dart';
import 'package:tlmc_player_flutter/components/bottom_sheet_widgets/track/track_bottom_sheet_builder.dart';
import 'package:tlmc_player_flutter/layouts/parallel_nav.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';

class TrackBotSheetOptionPlayNext extends ITrackBotSheetOption {
  final TrackReadDto trackData;
  final List<VoidCallback> callback = [];
  TrackBotSheetOptionPlayNext({super.key, required this.trackData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.playlist_play),
      title: const Text('Play next'),
      onTap: () {
        QueueController.to.addTrackById(trackData.id!).then(
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

class TrackBotSheetOptionAddToQueue extends ITrackBotSheetOption {
  final TrackReadDto trackData;
  const TrackBotSheetOptionAddToQueue({super.key, required this.trackData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.queue_music),
      title: const Text('Add to Queue'),
      onTap: () {
        QueueController.to.addTrackById(trackData.id!).then(
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
    // TODO: implement addCallback
  }
}

class TrackBotSheetOptionAddToPlaylist extends ITrackBotSheetOption {
  final TrackReadDto trackData;
  const TrackBotSheetOptionAddToPlaylist({super.key, required this.trackData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.playlist_add),
      title: const Text('Save to playlist'),
      onTap: () {
        Navigator.pop(context);
        showModalBottomSheet(
          useRootNavigator: true,
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (context) =>
              BottomSheetAddToPlaylist(trackId: trackData.id!),
        );
      },
    );
  }

  @override
  void addCallback(VoidCallback callback) {
    // TODO: implement addCallback
  }
}

class TrackBotSheetOptionGoToArtist extends ITrackBotSheetOption {
  final AlbumReadDto albumData;
  final List<VoidCallback> callback = [];
  TrackBotSheetOptionGoToArtist({super.key, required this.albumData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.interpreter_mode),
      title: const Text('Go To Artist'),
      onTap: () {
        var navContext = Get.find<NavigationContextProvider>();
        navContext.currentContext.currentState!.pushNamed(
          '/circle',
          arguments: {
            'circleId': albumData.albumArtist![0].id!,
          },
        );
        for (var callback in callback) {
          callback();
        }
        Navigator.pop(context);
      },
    );
  }

  @override
  void addCallback(VoidCallback callback) {
    this.callback.add(callback);
  }
}

class TrackBotSheetOptionGoToAlbum extends ITrackBotSheetOption {
  final AlbumReadDto albumData;
  final List<VoidCallback> callback = [];

  TrackBotSheetOptionGoToAlbum({super.key, required this.albumData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.album),
      title: const Text('Go To Album'),
      onTap: () {
        var navContext = Get.find<NavigationContextProvider>();
        navContext.currentContext.currentState!.pushNamed(
          '/album',
          arguments: {
            'albumId': albumData.id,
          },
        );
        for (var callback in callback) {
          callback();
        }
        Navigator.pop(context);
      },
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
      TrackBotSheetOptionPlayNext(
        trackData: trackData,
      ),
    );
  }

  TrackBottomSheetBuilder withAddToQueue() {
    return addOption(
      TrackBotSheetOptionAddToQueue(
        trackData: trackData,
      ),
    );
  }

  TrackBottomSheetBuilder withAddToPlaylist() {
    return addOption(
      TrackBotSheetOptionAddToPlaylist(
        trackData: trackData,
      ),
    );
  }

  TrackBottomSheetBuilder withGoToArtist() {
    return addOption(
      TrackBotSheetOptionGoToArtist(
        albumData: albumData,
      ),
    );
  }

  TrackBottomSheetBuilder withGoToAlbum() {
    return addOption(
      TrackBotSheetOptionGoToAlbum(
        albumData: albumData,
      ),
    );
  }
}
