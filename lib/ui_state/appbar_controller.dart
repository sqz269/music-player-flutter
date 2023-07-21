import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppBarController extends GetxController {
  static AppBarController get to => Get.find<AppBarController>();

  var flexibleSpaceWidget = Rx<Widget>(
    FlexibleSpaceBar(
      title: const Text('The Last Minute Crew'),
      centerTitle: true,
    ),
  );

  void updateFlexibleSpace(FlexibleSpaceBar newFlexibleSpaceWidget) {
    print("Flexible Space Updated");
    flexibleSpaceWidget.value = newFlexibleSpaceWidget;
    update();
  }
}
