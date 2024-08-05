import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/controllers/common/widget/sliver_album_grid_view_controller.dart';
import 'package:tlmc_player_app/views/common/widget/album_card.dart';

class SliverAlbumGridView extends StatelessWidget {
  final SliverAlbumGridViewController controller;

  const SliverAlbumGridView({
    super.key,
    required this.controller,
  });

  Widget _buildSortSelections(
      SliverAlbumGridViewStates states, BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text("Ordered By: "),
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
                const Text("Sort Order: "),
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

  Widget _buildGridView(SliverAlbumGridViewStates state, BuildContext context) {
    var itemsCount = MediaQuery.of(context).size.width ~/ 250;
    var calculatedHeight = 250 * 1.05;

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: itemsCount,
        crossAxisSpacing: 1,
        mainAxisExtent: calculatedHeight,
        mainAxisSpacing: 10,
      ),
      itemCount: state.albums.length,
      itemBuilder: (context, index) {
        return RepaintBoundary(
            child: AlbumCard(albumData: state.albums[index]));
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

  Widget _buildMainView(
      SliverAlbumGridViewStates? states, BuildContext context) {
    if (states == null) {
      throw Exception('Unexpected null value for states');
    }

    return MultiSliver(
      children: [
        _buildSortSelections(states, context),
        _buildGridView(states, context),
        _buildPaginator(states, context),
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
      (state) => _buildMainView(state, context),
    );
  }
}
