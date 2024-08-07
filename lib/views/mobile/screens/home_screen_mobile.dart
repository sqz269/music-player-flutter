import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/controllers/common/widget/sliver_album_grid_view_controller.dart';
import 'package:tlmc_player_app/extensions/get_x_extension.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';
import 'package:tlmc_player_app/views/common/widget/sliver_album_grid_view.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

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
            leading: Icon(Icons.menu),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/search", arguments: {});
                },
                icon: Icon(Icons.search),
              ),
              PopupMenuButton<String>(
                onSelected: (option) {
                  switch (option) {
                    case 'Login':
                      // Get.find<OidcAuthenticationService>().authenticate();
                      break;
                    case 'Logout':
                      // Get.find<OidcAuthenticationService>().logout();
                      break;
                    case 'Settings':
                      Navigator.pushNamed(context, "/settings", arguments: {});
                      break;
                    case 'Account':
                      Navigator.pushNamed(context, "/account", arguments: {});
                      break;
                  }
                },
                itemBuilder: (BuildContext context) {
                  // Options will change depending on if the user is authenticated
                  List<String> options;
                  // if (Get.find<OidcAuthenticationService>()
                  //     .isAuthenticated
                  //     .isTrue) {
                  //   options = ['Account', 'Settings', 'Logout'];
                  // } else {
                  options = ['Login'];
                  // }
                  return options
                      .map((option) => PopupMenuItem<String>(
                            value: option,
                            child: Text(option),
                          ))
                      .toList();
                },
              ),
            ],
          ),
          SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverAlbumGridView(controller: controller)),
        ],
      ),
    );
  }
}
