import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootContextProvider extends GetxController {
  static RootContextProvider get to => Get.find();

  final _rootContext = Rx<BuildContext?>(null);

  BuildContext? get rootContext => _rootContext.value;

  set rootContext(BuildContext? value) => _rootContext.value = value;
}
