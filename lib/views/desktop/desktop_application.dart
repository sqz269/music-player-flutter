import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/views/controllers/common/application_controller.dart';
import 'package:tlmc_player_app/extensions/get_x_extension.dart';
import 'package:tlmc_player_app/models/application_pages.dart';
import 'package:tlmc_player_app/views/desktop/screens/explore_screen_desktop.dart';
import 'package:tlmc_player_app/views/desktop/screens/home_screen_desktop.dart';
import 'package:tlmc_player_app/views/desktop/widgets/bottom_play_bar_desktop.dart';
import 'package:tlmc_player_app/views/desktop/widgets/side_navigation_rail_desktop.dart';

class DesktopApplicationPageWrapper extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final ApplicationPages page;

  const DesktopApplicationPageWrapper({
    Key? key,
    required this.page,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        String? currentPath;
        navigatorKey.currentState?.popUntil((route) {
          currentPath = route.settings.name;
          return true;
        });

        if (currentPath == "/queue") {
          navigatorKey.currentState?.pop();
        }

        if (routeSettings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              switch (page) {
                case ApplicationPages.home:
                  return const HomeScreenDesktop();
                case ApplicationPages.explore:
                  return const ExploreScreenDesktop();
                case ApplicationPages.library:
                  return const Text("Library PAAAage");
              }
            },
          );
        }

        return Get.find<FluroRouter>().generator(routeSettings);
      },
    );
  }
}

class DesktopApplication extends StatelessWidget {
  final ApplicationController controller;

  DesktopApplication({super.key})
      : controller = Get.getOrPut(ApplicationController());

  Widget _buildOffstageNavigator(ApplicationStates state, BuildContext context,
      {required ApplicationPages page}) {
    return Offstage(
      offstage: state.currentPage != page,
      child: DesktopApplicationPageWrapper(
        page: page,
        navigatorKey: controller.navigatorKeys[page]!,
      ),
    );
  }

  Widget _buildBottomPlayBar(ApplicationStates state, BuildContext context) {
    // return a fix sized container for now
    return Row(
      children: [
        BottomPlayBarDesktop(),
      ],
    );
  }

  Widget _buildApplication(ApplicationStates? state, BuildContext context) {
    if (state == null) {
      throw Exception('State is null');
    }

    bool isFirstRouteInCurrentTab =
        state.currentNavigationKey.currentState?.canPop() ?? false;
    if (isFirstRouteInCurrentTab) {
      controller.changePage(ApplicationPages.home);
    }

    return PopScope(
      canPop: isFirstRouteInCurrentTab,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  SideNavigationRail(
                    currentPage: state.currentPage,
                    onPageSelected: controller.changePage,
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          _buildOffstageNavigator(
                            state,
                            context,
                            page: ApplicationPages.home,
                          ),
                          _buildOffstageNavigator(
                            state,
                            context,
                            page: ApplicationPages.explore,
                          ),
                          _buildOffstageNavigator(
                            state,
                            context,
                            page: ApplicationPages.library,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildBottomPlayBar(state, context),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.getOrPut(ApplicationController());

    return controller.obx(
      (state) => PopScope(
        child: Scaffold(
          body: _buildApplication(state, context),
        ),
      ),
    );
  }
}
