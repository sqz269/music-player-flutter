import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:tlmc_player_flutter/components/mobile_bottom_bar.dart';
import 'package:tlmc_player_flutter/ui_state/appbar_controller.dart';

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
            return CustomScrollView(
              slivers: [
                GetBuilder<AppBarController>(
                  builder: (builder) => SliverAppBar(
                    backgroundColor: Colors.red,
                    elevation: 0.0,
                    flexibleSpace: builder.flexibleSpaceWidget.value,
                    pinned: true,
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
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Container(child: widget.child),
                  ),
                ),
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
