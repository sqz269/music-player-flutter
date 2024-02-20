import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/controllers/desktop/desktop_application_controller.dart';
import 'package:tlmc_player_app/extensions/get_x_extension.dart';
import 'package:tlmc_player_app/models/application_pages.dart';
import 'package:tlmc_player_app/views/desktop/screens/home_screen_desktop.dart';
import 'package:tlmc_player_app/views/desktop/widgets/bottom_play_bar_desktop.dart';

class SideNavigationRail extends StatelessWidget {
  final ApplicationPages _currentPage;
  final Function(ApplicationPages) _onPageSelected;

  const SideNavigationRail({
    super.key,
    required ApplicationPages currentPage,
    required Function(ApplicationPages) onPageSelected,
  })  : _currentPage = currentPage,
        _onPageSelected = onPageSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      elevation: 6,
      extended: true,
      destinations: const [
        NavigationRailDestination(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          icon: Icon(Icons.explore_outlined),
          selectedIcon: Icon(Icons.explore),
          label: Text('Explore'),
        ),
        NavigationRailDestination(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          icon: Icon(Icons.library_music_outlined),
          selectedIcon: Icon(Icons.library_music),
          label: Text('Library'),
        ),
      ],
      selectedIndex: _currentPage.index,
      onDestinationSelected: (index) =>
          _onPageSelected(ApplicationPages.values[index]),
    );
  }
}

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
        if (routeSettings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              switch (page) {
                case ApplicationPages.home:
                  return const HomeScreenDesktop();
                case ApplicationPages.explore:
                  return const Text("Explore Page");
                case ApplicationPages.library:
                  return const Text("Library Page");
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
  DesktopApplicationController controller;

  DesktopApplication({super.key})
      : controller = Get.getOrPut(DesktopApplicationController());

  Widget _buildOffstageNavigator(
      DesktopApplicationStates state, BuildContext context,
      {required ApplicationPages page}) {
    return Offstage(
      offstage: state.currentPage != page,
      child: DesktopApplicationPageWrapper(
        page: page,
        navigatorKey: controller.navigatorKeys[page]!,
      ),
    );
  }

  Widget _buildBottomPlayBar(
      DesktopApplicationStates state, BuildContext context) {
    // return a fix sized container for now
    return Row(
      children: [
        BottomPlayBarDesktop(),
      ],
    );
  }

  Widget _buildApplication(
      DesktopApplicationStates? state, BuildContext context) {
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
    var controller = Get.getOrPut(DesktopApplicationController());

    return controller.obx(
      (state) => PopScope(
        child: Scaffold(
          body: _buildApplication(state, context),
        ),
      ),
    );
  }
}
