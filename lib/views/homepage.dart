import 'package:flutter/material.dart';

import 'package:tlmc_player_flutter/views/mobile/mobile_homepage.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return LayoutBuilder(builder: (context, constraints) {
    //   // if (constraints.maxWidth < 450) {
    //   //   return MobileHomePage();
    //   // } else {
    //   //   return const Placeholder();
    //   // }
    // });
    return MobileHomePage();
  }
}
