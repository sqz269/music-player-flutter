import 'package:backend_client_api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tlmc_player_app/utils/url_util.dart';
import 'package:tlmc_player_app/views/controllers/common/widget/sliver_album_grid_view_controller.dart';
import 'package:tlmc_player_app/extensions/get_x_extension.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';
import 'package:tlmc_player_app/views/common/widget/sliver_album_aligned_grid_view.dart';

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
            title: Text('Home'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              PopupMenuButton<String>(
                onSelected: (option) {
                  switch (option) {
                    case 'Login':
                      break;
                    case 'Logout':
                      break;
                    case 'Settings':
                      break;
                    case 'Account':
                      break;
                    case 'Audio Debug':
                      GoRouter.of(context).pushNamed('home_audio_debug');
                      break;
                    case 'URL Debug':
                      UrlUtil.openYoutubeSearch('test');
                      break;
                    case 'URL Debug 2':
                      UrlUtil.openYoutubeSearchV2('test 2');
                      break;
                    case 'URL Debug 3':
                      UrlUtil.openYoutubeSearchV3('test 3');
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
                  options = [
                    'Login',
                    'Audio Debug',
                    'URL Debug',
                    'URL Debug 2',
                    'URL Debug 3'
                  ];
                  // }
                  return options
                      .map(
                        (option) => PopupMenuItem<String>(
                          value: option,
                          child: Text(option),
                        ),
                      )
                      .toList();
                },
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            sliver: SliverAlbumAlignedGridView(controller: controller),
          ),
        ],
      ),
    );
  }
}
