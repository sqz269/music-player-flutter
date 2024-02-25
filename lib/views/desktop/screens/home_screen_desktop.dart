import 'package:BackendClientApi/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/controllers/common/widget/sliver_album_grid_view_controller.dart';
import 'package:tlmc_player_app/extensions/get_x_extension.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';
import 'package:tlmc_player_app/services/impl/authentication_service.dart';
import 'package:tlmc_player_app/views/common/widget/sliver_album_grid_view.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.getOrPut(
      SliverAlbumGridViewController(
        fetchAlbums: (p0, p1, sortField, sortDirection) {
          var albumApi = AlbumApi(Get.find<ApiClientProvider>().getApiClient());
          return albumApi.getAlbums(
              start: p0, limit: p1, sort: sortField, sortOrder: sortDirection);
        },
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const Icon(Icons.menu),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/search", arguments: {});
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  var oidcService = Get.find<OidcAuthenticationService>();
                  if (oidcService.isAuthenticated.isTrue) {
                    oidcService.logout();
                  } else {
                    oidcService.authenticate();
                  }
                },
                icon: const Icon(Icons.account_circle_outlined),
              ),
            ],
            pinned: true,
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
