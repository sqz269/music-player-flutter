import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:tlmc_player_flutter/components/mobile_bottom_bar.dart';
import 'package:tlmc_player_flutter/ui_state/appbar_controller.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:tlmc_player_flutter/views/mobile/mobile_miniplayer_bar.dart';

class MainLayout extends StatefulWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return Stack(
              children: [
                SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      Obx(
                        () => SliverAppBar(
                          backgroundColor: Colors.transparent,
                          flexibleSpace:
                              AppBarController.to.flexibleSpaceWidget.value,
                          actions: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.account_circle_outlined),
                            ),
                          ],
                          pinned: false,
                          primary: true,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 66.0),
                              child: Container(child: widget.child),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                MobileMiniplayerBar(),
              ],
            );
          } else {
            return const Placeholder();
          }
        },
      ),
      bottomNavigationBar: Obx(
        () {
          var opacity = 1 - playerExpandProgressPerc.value;
          if (opacity < 0) {
            opacity = 0;
          }
          if (opacity > 1) {
            opacity = 1;
          }

          return SizedBox(
            height: kBottomNavigationBarHeight -
                kBottomNavigationBarHeight * playerExpandProgressPerc.value,
            child: Transform.translate(
              offset: Offset(
                  0.0,
                  kBottomNavigationBarHeight *
                      playerExpandProgressPerc.value *
                      0.5),
              child: Opacity(
                opacity: opacity,
                child: OverflowBox(
                  maxHeight: kBottomNavigationBarHeight,
                  child: MobileBottomNavigationBar(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
