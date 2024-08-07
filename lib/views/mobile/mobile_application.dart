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

  Widget _buildApplication(ApplicationStates? state, BuildContext context) {
    if (state == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      body: MobileApplicationPageWrapper(
        page: state.currentPage,
        navigatorKey: controller.getCurrentPageKey()!,
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
