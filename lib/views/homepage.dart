import 'package:flutter/material.dart';
import 'package:tlmc_player_flutter/ui_state/appbar_controller.dart';

import 'package:tlmc_player_flutter/views/mobile/mobile_homepage.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        Get.find<AppBarController>().updateFlexibleSpace(
          FlexibleSpaceBar(
            title: RichText(
              text: TextSpan(
                text: "Home Page (Paginated)",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
          ),
        );
      },
    );

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return const MobileHomePage();
      } else {
        return const Placeholder();
      }
    });
  }
}
