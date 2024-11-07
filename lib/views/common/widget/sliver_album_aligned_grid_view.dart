import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:tlmc_player_app/controllers/common/widget/sliver_album_grid_view_controller.dart';
import 'package:tlmc_player_app/views/common/widget/album_card.dart';

class SliverAlbumAlignedGridView extends StatelessWidget {
  final SliverAlbumGridViewController controller;
  final ScrollController scrollController = ScrollController();

  SliverAlbumAlignedGridView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  Widget _buildSortSelections(
      SliverAlbumGridViewStates state, BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text("Order By:"),
                DropdownButton(
                  value: controller.orderOptions.value,
                  items: const [
                    DropdownMenuItem(
                      value: AlbumOrderOptions.id,
                      child: Text("Id"),
                    ),
                    DropdownMenuItem(
                      value: AlbumOrderOptions.title,
                      child: Text("Name"),
                    ),
                    DropdownMenuItem(
                      value: AlbumOrderOptions.date,
                      child: Text("Date"),
                    ),
                  ],
                  onChanged: (value) => controller.changeSortField(value!),
                  isDense: true,
                ),
              ],
            ),
            Row(
              children: [
                const Text("Order:"),
                DropdownButton(
                  value: controller.sortOrder.value,
                  items: const [
                    DropdownMenuItem(
                      value: SortOrder.ascending,
                      child: Text("Ascending"),
                    ),
                    DropdownMenuItem(
                      value: SortOrder.descending,
                      child: Text("Descending"),
                    ),
                  ],
                  onChanged: (value) => controller.changeSortOrder(value!),
                  isDense: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAlignedGridView(
      SliverAlbumGridViewStates state, BuildContext context) {
    return AlignedGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      itemCount: state.albums.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return AlbumCard(albumData: state.albums[index]);
      },
    );
  }

  Widget _buildPaginator(
      SliverAlbumGridViewStates state, BuildContext context) {
    return SliverToBoxAdapter(
      child: NumberPaginator(
        numberPages: state.totalPages,
        initialPage: state.currentPage,
        onPageChange: controller.changePage,
      ),
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

    return MultiSliver(
      children: [
        _buildSortSelections(state, context),
        _buildAlignedGridView(state, context),
        _buildPaginator(state, context),
      ],
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
