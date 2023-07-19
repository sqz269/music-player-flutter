import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:tlmc_player_flutter/components/mobile_bottom_bar.dart';
import 'package:tlmc_player_flutter/ui_state/appbar_controller.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:tlmc_player_flutter/views/mobile/mobile_playing_bar.dart';

class MainLayout extends StatefulWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final AppBarController appBarController = Get.put(AppBarController());

  @override
  Widget build(BuildContext context) {
    print("Child: ${widget.child}");
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return Stack(
              children: [
                SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      GetBuilder<AppBarController>(
                        builder: (builder) => SliverAppBar(
                          backgroundColor: Colors.transparent,
                          flexibleSpace: builder.flexibleSpaceWidget.value,
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
                MobilePlayingBar(),
              ],
            );
          } else {
            return const Placeholder();
          }
        },
      ),
      bottomNavigationBar: const MobileBottomNavigationBar(),
    );
  }
}
