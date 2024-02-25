import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/models/application_pages.dart';

class DesktopApplicationStates {
  ApplicationPages currentPage;
  GlobalKey<NavigatorState> currentNavigationKey;
  DesktopApplicationStates(
      {required this.currentPage, required this.currentNavigationKey});
}

class DesktopApplicationController extends GetxController
    with StateMixin<DesktopApplicationStates> {
  final Map<ApplicationPages, GlobalKey<NavigatorState>> navigatorKeys;

  DesktopApplicationController()
      : navigatorKeys = {
          ApplicationPages.home: GlobalKey<NavigatorState>(),
          ApplicationPages.explore: GlobalKey<NavigatorState>(),
          ApplicationPages.library: GlobalKey<NavigatorState>(),
        };

  @override
  void onInit() {
    super.onInit();
    changePage(ApplicationPages.home);
  }

  GlobalKey<NavigatorState>? getPageKey(ApplicationPages page) {
    return navigatorKeys[page];
  }

  GlobalKey<NavigatorState>? getCurrentPageKey() {
    return navigatorKeys[state!.currentPage];
  }

  void changePage(ApplicationPages page) {
    change(
        DesktopApplicationStates(
            currentPage: page, currentNavigationKey: navigatorKeys[page]!),
        status: RxStatus.success());
  }

  String? getCurrentPath() {
    String? path;
    getCurrentPageKey()!.currentState!.popUntil((route) {
      path = route.settings.name;
      return true;
    });

    return path;
  }
}
