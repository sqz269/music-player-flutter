import 'package:BackendClientApi/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tlmc_player_app/controllers/desktop/screens/playlist_screen_desktop_controller.dart';
import 'package:tlmc_player_app/extensions/get_x_extension.dart';
import 'package:tlmc_player_app/views/common/widget/track_tile_with_thumbnail.dart';

class PlaylistScreenDesktop extends StatefulWidget {
  final String playlistId;
  final PlaylistScreenDesktopController controller;
  final PagingController<int, TrackReadDto> pagingController;

  PlaylistScreenDesktop({
    super.key,
    required this.playlistId,
  })  : controller = Get.getOrPut(
          PlaylistScreenDesktopController(playlistId: playlistId),
          tag: playlistId,
        ),
        pagingController = PagingController(firstPageKey: 0);

  @override
  State<PlaylistScreenDesktop> createState() => _PlaylistScreenDesktopState();
}

class _PlaylistScreenDesktopState extends State<PlaylistScreenDesktop> {
  @override
  void initState() {
    widget.pagingController.addPageRequestListener((pageKey) {
      widget.controller.loadMore();
    });

    super.initState();
  }

  Widget _buildPlaylistImage(
      PlaylistScreenDesktopState? states, BuildContext context) {
    if (states == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return LayoutBuilder(
      builder: (context, constraint) => Icon(
        Icons.album,
        size: constraint.biggest.height * 0.9,
        color: Colors.grey.shade300,
      ),
    );
  }

  Widget _buildPlaylistInfoView(
      PlaylistScreenDesktopState? states, BuildContext context) {
    if (states == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // compute the size of the album cover, ideally, we want to take up 1/3 of the screen width
    var coverSize =
        clampDouble(MediaQuery.of(context).size.width / 7, 175, 250);

    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 16.0),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            SizedBox(
              width: coverSize,
              height: coverSize,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _buildPlaylistImage(states, context),
              ),
            ),
            Expanded(
              child: Container(
                height: coverSize,
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Album",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            states.playlistInfo.name!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTracksView(
      PlaylistScreenDesktopState state, BuildContext context) {
    return PagedListView(
      pagingController: widget.pagingController,
      builderDelegate: PagedChildBuilderDelegate<TrackReadDto>(
        itemBuilder: (context, track, index) {
          return TrackTileWithThumbnailDesktop(
            track,
            isPlaying: false,
          );
        },
        firstPageErrorIndicatorBuilder: (context) {
          return Center(
            child: Text("Failed to load tracks"),
          );
        },
        noItemsFoundIndicatorBuilder: (context) {
          return Center(
            child: Text("No tracks found"),
          );
        },
        newPageErrorIndicatorBuilder: (context) {
          return Center(
            child: Text("Failed to load more tracks"),
          );
        },
        firstPageProgressIndicatorBuilder: (context) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ListTile(
              title: Container(
                height: 16,
                color: Colors.grey.shade300,
              ),
              subtitle: Container(
                height: 16,
                color: Colors.grey.shade300,
              ),
            ),
          );
        },
        newPageProgressIndicatorBuilder: (context) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ListTile(
              title: Container(
                height: 16,
                color: Colors.grey.shade300,
              ),
              subtitle: Container(
                height: 16,
                color: Colors.grey.shade300,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainView(
      PlaylistScreenDesktopState? states, BuildContext context) {
    if (states == null) {
      return const SizedBox.shrink();
    }

    if (states.hasMore) {
      widget.pagingController
          .appendPage(states.playlistItems, states.start + 1);
    } else {
      widget.pagingController.appendLastPage(states.playlistItems);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Playlist"),
      ),
      body: _buildTracksView(states, context),
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
