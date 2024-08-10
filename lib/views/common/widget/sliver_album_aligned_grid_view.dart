import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/controllers/common/widget/sliver_album_grid_view_controller.dart';
import 'package:tlmc_player_app/views/common/widget/album_card.dart';

class SliverAlbumAlignedGridView extends StatelessWidget {
  final SliverAlbumGridViewController controller;
  final ScrollController scrollController = ScrollController();

  SliverAlbumAlignedGridView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  Widget _buildAlignedGridView(
      SliverAlbumGridViewStates state, BuildContext context) {
    // Compute the optimal cross axis count based on the screen width
    // Adjust the axis spacing instead of the card size to make the grid responsive

    return AlignedGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      shrinkWrap: true,
      itemCount: state.albums.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return AlbumCard(albumData: state.albums[index]);
      },
    );
  }

  Widget _buildView(SliverAlbumGridViewStates? state, BuildContext context) {
    if (state == null) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Text("No data"),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: _buildAlignedGridView(state, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      onLoading: const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      (state) => _buildView(state, context),
    );
  }
}
