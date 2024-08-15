import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/controllers/common/application_controller.dart';
import 'package:tlmc_player_app/extensions/get_x_extension.dart';
import 'package:tlmc_player_app/models/application_pages.dart';
import 'package:tlmc_player_app/views/mobile/screens/home_screen_mobile.dart';

class MobileApplicationPageWrapper extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final ApplicationPages page;

  const MobileApplicationPageWrapper({
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
                  return const HomeScreenMobile();
                // case ApplicationPages.explore:
                //   return const ExploreScreenMobile();
                case ApplicationPages.library:
                  return const Text("Library Page");
                case _:
                  return const Text("Home Page");
              }
            },
          );
        }

        return Get.find<FluroRouter>().generator(routeSettings);
      },
    );
  }
}

class MobileApplication extends StatelessWidget {
  final ApplicationController controller;

  MobileApplication({super.key})
      : controller = Get.getOrPut(ApplicationController());

  Widget _buildBottomNavigationBar(
      ApplicationStates state, BuildContext context) {
    final navigationOptions = [
      {
        "activeIcon": Icons.home,
        "inactiveIcon": Icons.home_outlined,
        "label": "Home",
      },
      {
        "activeIcon": Icons.explore,
        "inactiveIcon": Icons.explore_outlined,
        "label": "Explore",
      },
      {
        "activeIcon": Icons.library_music,
        "inactiveIcon": Icons.library_music_outlined,
        "label": "Library",
      }
    ];

    List<NavigationDestination> destinations = [];
    for (var option in navigationOptions) {
      destinations.add(NavigationDestination(
        icon: Icon((option["inactiveIcon"] as IconData)),
        selectedIcon: Icon((option["activeIcon"] as IconData)),
        label: option["label"] as String,
      ));
    }

    return NavigationBar(
      destinations: destinations,
      selectedIndex: state.currentPage.index,
      onDestinationSelected: (index) {
        controller.changePage(ApplicationPages.values[index]);
      },
    );
  }

  Widget _buildApplication(ApplicationStates? state, BuildContext context) {
    if (state == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // get screen size
    var screenWidth = MediaQuery.of(context).size.width;

    // Ensure the screen width is not 0
    if (screenWidth == 0) {
      return const Center(
        child: Text("Assertion Error: Screen width is 0"),
      );
    }

    return Scaffold(
      body: MobileApplicationPageWrapper(
        page: state.currentPage,
        navigatorKey: controller.getCurrentPageKey()!,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(state, context),
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
