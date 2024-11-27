import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/views/controllers/common/widget/artist_info_view_controller.dart';
import 'package:tlmc_player_app/views/controllers/common/widget/sliver_album_grid_view_controller.dart';
import 'package:tlmc_player_app/extensions/get_x_extension.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';
import 'package:tlmc_player_app/views/common/widget/sliver_album_aligned_grid_view.dart';

class CircleScreenMobile extends StatelessWidget {
  final String circleId;
  const CircleScreenMobile({super.key, required this.circleId});

  @override
  Widget build(BuildContext context) {
    var albumViewController = Get.getOrPut(
      SliverAlbumGridViewController(
        fetchAlbums: (p0, p1, sortField, sortDirection) {
          var circleApi =
              CircleApi(Get.find<ApiClientProvider>().getApiClient());
          return circleApi.getCircleAlbumsById(
            circleId,
            start: p0,
            limit: p1,
            sort: sortField,
            sortOrder: sortDirection,
          );
        },
      ),
      tag: circleId,
    );

    var artistInfoViewController = Get.getOrPut(
      ArtistInfoViewController(circleId: circleId),
      tag: circleId,
    );
    return artistInfoViewController.obx(
      (state) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(state!.circle.name ?? ''),
              actions: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.radio),
                  label: const Text('Start Radio'),
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              sliver:
                  SliverAlbumAlignedGridView(controller: albumViewController),
            ),
          ],
        ),
      ),
    );
  }
}
