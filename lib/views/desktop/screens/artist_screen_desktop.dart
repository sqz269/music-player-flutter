import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/views/controllers/common/widget/sliver_album_grid_view_controller.dart';
import 'package:tlmc_player_app/extensions/get_x_extension.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';
import 'package:tlmc_player_app/views/common/widget/sliver_album_grid_view.dart';

class ArtistScreenDesktop extends StatelessWidget {
  SliverAlbumGridViewController controller;

  ArtistScreenDesktop({super.key, required String artistId})
      : controller = Get.getOrPut(
          SliverAlbumGridViewController(
            fetchAlbums: (p0, p1, sortField, sortDirection) {
              var circleApi =
                  CircleApi(Get.find<ApiClientProvider>().getApiClient());
              return circleApi.getCircleAlbumsById(
                artistId,
                start: p0,
                limit: p1,
                sort: sortField,
                sortOrder: sortDirection,
              );
            },
          ),
          tag: artistId,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/search", arguments: {});
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_circle_outlined),
              ),
            ],
            pinned: false,
            // floating: true,
            primary: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverAlbumGridView(controller: controller),
          ),
        ],
      ),
    );
  }
}
