import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/controllers/desktop/screens/album_screen_desktop_controller.dart';
import 'package:tlmc_player_app/extensions/get_x_extension.dart';
import 'package:tlmc_player_app/views/mobile/widgets/track_tile.dart';

class AlbumScreenMobile extends StatefulWidget {
  final String albumId;
  final AlbumScreenDesktopController controller;

  AlbumScreenMobile({super.key, required this.albumId})
      : controller = Get.getOrPut(
            AlbumScreenDesktopController(albumId: albumId),
            tag: albumId);

  @override
  State<AlbumScreenMobile> createState() => _AlbumScreenMobileState();
}

class _AlbumScreenMobileState extends State<AlbumScreenMobile> {
  final Rx<double> albumInfoOpacity = 1.0.obs;

  final sliverAlbumControlKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(onScroll);
  }

  void onScroll() {
    var combinedHeight =
        kToolbarHeight + sliverAlbumControlKey.currentContext!.size!.height;

    var targetActual = combinedHeight * 0.9;

    var offset = _scrollController.offset;

    if (offset < 0) {
      albumInfoOpacity.value = 1.0;
      return;
    }

    if (offset > combinedHeight) {
      albumInfoOpacity.value = 0.0;
    } else {
      // fade out the album info when 70% of the album info is scrolled
      // and fade out completely when the album info is 90% scrolled

      var fadeOutThreashold = targetActual * 0.7;
      if (offset > fadeOutThreashold) {
        albumInfoOpacity.value = 1.0 -
            (min(
                1.0,
                (offset - fadeOutThreashold) /
                    (targetActual - fadeOutThreashold)));
      } else {
        albumInfoOpacity.value = 1.0;
      }
    }
  }

  PreferredSizeWidget _buildAppBar(
      AlbumScreenDesktopState states, BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Obx(
        () => AppBar(
          primary: true,
          elevation: 0.0,
          title: Opacity(
            opacity: 1 - albumInfoOpacity.value,
            child: Text(states.masterAlbum.name!.default_),
          ),
          backgroundColor: Theme.of(context)
              .colorScheme
              .primary
              .withOpacity(1 - albumInfoOpacity.value),
          forceMaterialTransparency: albumInfoOpacity.value == 1,
        ),
      ),
    );
  }

  Widget _buildAlbumMiscInfo(
      AlbumScreenDesktopState state, BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2,
          vertical: 8.0,
        ),
        child: AbsorbPointer(
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: state.masterAlbum.albumArtist!.first.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: "Album",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey.shade600),
                    ),
                    TextSpan(
                      text: ' · ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey.shade600),
                    ),
                    TextSpan(
                      text: '${state.masterAlbum.releaseDate!.year}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlbumInfoView(
      AlbumScreenDesktopState states, BuildContext context) {
    var imageWidth = MediaQuery.of(context).size.width * 0.7;

    return Padding(
      key: sliverAlbumControlKey,
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: imageWidth,
            height: imageWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(states.masterAlbum.thumbnail!.large!.url!),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(height: 16.0),
          // Album title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Text(
              states.masterAlbum.name!.default_,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.library_add_outlined),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.outline.withOpacity(0.1),
                  ),
                ),
              ),
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow),
                iconSize: 42,
              ),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.outline.withOpacity(0.1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTracklistView(
      AlbumScreenDesktopState states, BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: states.masterAlbum.tracks!.length,
          itemBuilder: (context, index) {
            var track = states.masterAlbum.tracks![index];
            return TrackTile(trackData: track, albumData: states.masterAlbum);
          },
        ),
      ],
    );
  }

  Widget _buildMainView(AlbumScreenDesktopState? states, BuildContext context) {
    if (states == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(states, context),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: _buildAlbumMiscInfo(states, context),
            ),
            SliverToBoxAdapter(
              child: _buildAlbumInfoView(states, context),
            ),
            SliverToBoxAdapter(
              child: _buildTracklistView(states, context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.controller.obx(
      onLoading: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      (state) => _buildMainView(state, context),
    );
  }
}
