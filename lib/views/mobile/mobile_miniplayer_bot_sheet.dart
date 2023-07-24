import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MiniplayerQueueBottomSheet extends StatelessWidget {
  MiniplayerQueueBottomSheet({
    super.key,
    required this.perc,
  }) {}

  final double perc;
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (perc < 0.4) {
      return const SizedBox.shrink();
    }

    // DraggableScrollableSheet(
    //   initialChildSize: 0.06,
    //   minChildSize: 0.06,
    //   maxChildSize: 1,
    //   snap: true,
    //   snapSizes: const [0.06, 1],
    //   builder: (context, scrollController) {
    //     return GestureDetector(
    //       dragStartBehavior: DragStartBehavior.down,
    //       behavior: HitTestBehavior.translucent,
    //       child: Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(16),
    //             topRight: Radius.circular(16),
    //           ),
    //           color: Theme.of(context).colorScheme.surface,
    //         ),
    //         child: Column(
    //           children: [
    //             Container(
    //               height: 4,
    //               width: 40,
    //               margin: const EdgeInsets.symmetric(vertical: 10),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(2),
    //                 color: Colors.grey.shade600,
    //               ),
    //             ),
    //             Expanded(
    //               child: ListView.builder(
    //                 controller: scrollController,
    //                 itemBuilder: (context, index) {
    //                   return ListTile(
    //                     title: Text("Item $index"),
    //                   );
    //                 },
    //                 shrinkWrap: true,
    //                 itemCount: 100,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );

    // return DefaultTabController(
    //   length: 3,
    //   child: DraggableScrollableSheet(
    //     initialChildSize: 0.1,
    //     minChildSize: 0.1,
    //     maxChildSize: 1,
    //     snap: true,
    //     snapSizes: const [0.1, 1],
    //     builder: (context, scrollController) => Scaffold(
    //       body: Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(16),
    //             topRight: Radius.circular(16),
    //           ),
    //           color: Theme.of(context).colorScheme.surface,
    //         ),
    //         child: NestedScrollView(
    //           headerSliverBuilder: null,
    //           body: null,
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    // return DraggableScrollableSheet(
    //   initialChildSize:
    //       0.4, // initial height of the sheet as a percentage of screen height
    //   minChildSize:
    //       0.2, // minimum height of the sheet as a percentage of screen height
    //   maxChildSize:
    //       0.7, // maximum height of the sheet as a percentage of screen height
    //   builder: (BuildContext context, ScrollController scrollController) {
    //     return Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(16),
    //           topRight: Radius.circular(16),
    //         ),
    //         color: Theme.of(context).colorScheme.surfaceVariant,
    //       ),
    //       child: DefaultTabController(
    //         length: 2, // the number of tabs
    //         child: Column(
    //           children: <Widget>[
    //             TabBar(
    //               tabs: <Tab>[
    //                 Tab(text: 'Queue'),
    //                 Tab(text: 'History'),
    //               ],
    //             ),
    //             Expanded(
    //               child: TabBarView(
    //                 children: <Widget>[
    //                   ListView.builder(
    //                     controller:
    //                         scrollController, // pass the scrollController to ListView
    //                     itemCount: 50,
    //                     itemBuilder: (BuildContext context, int index) {
    //                       return ListTile(
    //                         title: Text('Item $index'),
    //                       );
    //                     },
    //                   ),
    //                   ListView.builder(
    //                     controller:
    //                         scrollController, // pass the scrollController to ListView
    //                     itemCount: 50,
    //                     itemBuilder: (BuildContext context, int index) {
    //                       return ListTile(
    //                         title: Text('Item $index'),
    //                       );
    //                     },
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );

    // return NestedScrollView(
    //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    //     return <Widget>[];
    //   },
    //   body: DraggableScrollableSheet(
    //     initialChildSize: 0.4,
    //     minChildSize: 0.2,
    //     maxChildSize: 0.7,
    //     builder:
    //         (BuildContext context, ScrollController sheetScrollController) {
    //       return Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(16),
    //             topRight: Radius.circular(16),
    //           ),
    //           color: Theme.of(context).colorScheme.surfaceVariant,
    //         ),
    //         child: DefaultTabController(
    //           length: 2,
    //           child: Column(
    //             children: <Widget>[
    //               TabBar(
    //                 tabs: <Tab>[
    //                   Tab(text: 'Queue'),
    //                   Tab(text: 'History'),
    //                 ],
    //               ),
    //               Expanded(
    //                 child: TabBarView(
    //                   children: <Widget>[
    //                     ListView.builder(
    //                       controller: sheetScrollController,
    //                       itemCount: 50,
    //                       itemBuilder: (BuildContext context, int index) {
    //                         return ListTile(
    //                           title: Text('Item $index'),
    //                         );
    //                       },
    //                     ),
    //                     ListView.builder(
    //                       controller: sheetScrollController,
    //                       itemCount: 50,
    //                       itemBuilder: (BuildContext context, int index) {
    //                         return ListTile(
    //                           title: Text('Item $index'),
    //                         );
    //                       },
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );

    return DraggableScrollableSheet(
      initialChildSize: 0.09,
      minChildSize: 0.09,
      maxChildSize: 0.9,
      snap: true,
      snapSizes: const [0.09, 0.9],
      builder: (context, scrollController) => DefaultTabController(
        length: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            body: CustomScrollView(
              controller: scrollController,
              slivers: <Widget>[
                SliverToBoxAdapter(
                  // grab bar
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 4,
                        width: 40,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: TabBar(
                    tabs: [
                      Tab(text: 'Queue'),
                      Tab(text: 'History'),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  child: TabBarView(
                    children: [
                      Center(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('Item $index'),
                            );
                          },
                          itemCount: 50,
                        ),
                      ),
                      Center(child: Text('Tab 2')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
