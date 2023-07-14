import 'package:flutter/material.dart';

import 'package:tlmc_player_flutter/components/mobile_bottom_bar.dart';

class MainLayout extends StatefulWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  Widget build(BuildContext context) {
    print("Child: ${widget.child}");
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: const Text('TLMC Player'),
                  backgroundColor: Colors.transparent,
                  floating: true,
                  snap: true,
                  elevation: 0.0,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: widget.child,
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
