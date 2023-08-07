import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_flutter/states/root_context_provider.dart';
import 'package:tlmc_player_flutter/views/homepage.dart';
import 'package:tlmc_player_flutter/views/mobile/mobile_album_page.dart';
import 'package:tlmc_player_flutter/views/mobile/mobile_explore.dart';

enum ParallelNavPage { home, explore, library }

class ParallelNavigator extends StatelessWidget {
  ParallelNavigator(
      {super.key, required this.navigatorKey, required this.page});
  final GlobalKey<NavigatorState> navigatorKey;
  final ParallelNavPage page;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == '/') {
          print("/ Navigation | Page: $page");
          return MaterialPageRoute(
            builder: (context) {
              switch (page) {
                case ParallelNavPage.home:
                  return const HomePage();
                case ParallelNavPage.explore:
                  return const ExplorePage();
                case ParallelNavPage.library:
                  return const Placeholder();
              }
            },
          );
        }

        if (routeSettings.name!.startsWith("/album")) {
          print("/album Navigation | Page: $page");
          print("Route settings: $routeSettings");
          return MaterialPageRoute(
            builder: (context) => MobileAlbumPage(
              routeParams: routeSettings.arguments as Map<String, String?>,
            ),
          );
        }
      },
    );
  }
}

class BottomNavigationBarPersistent extends StatelessWidget {
  final ParallelNavPage currentTab;
  final ValueChanged<ParallelNavPage>? onTabSelect;

  const BottomNavigationBarPersistent(
      {super.key, required this.currentTab, this.onTabSelect});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.explore),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.library_music),
          label: "Library",
        ),
      ],
      currentIndex: currentTab.index,
      onTap: (index) {
        print("Selected tab: $index");
        onTabSelect!(ParallelNavPage.values[index]);
      },
    );
  }
}

class ParallelNavigationApp extends StatefulWidget {
  const ParallelNavigationApp({super.key});

  @override
  State<ParallelNavigationApp> createState() => _ParallelNavigationAppState();
}

class _ParallelNavigationAppState extends State<ParallelNavigationApp> {
  final _navKeys = {
    ParallelNavPage.home: GlobalKey<NavigatorState>(),
    ParallelNavPage.explore: GlobalKey<NavigatorState>(),
    ParallelNavPage.library: GlobalKey<NavigatorState>(),
  };

  var _currentTab = ParallelNavPage.home;

  void _selectTab(ParallelNavPage page) {
    print("Selected tab: $page");
    if (_currentTab == page) {
      _navKeys[page]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(
        () {
          _currentTab = page;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    RootContextProvider.to.rootContext = context;
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != ParallelNavPage.home) {
            _selectTab(ParallelNavPage.home);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator(ParallelNavPage.home),
            _buildOffstageNavigator(ParallelNavPage.explore),
            _buildOffstageNavigator(ParallelNavPage.library),
          ],
        ),
        bottomNavigationBar: BottomNavigationBarPersistent(
          currentTab: _currentTab,
          onTabSelect: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(ParallelNavPage page) {
    print("Page: $page | Offstage: ${_currentTab != page}");
    return Offstage(
      offstage: _currentTab != page,
      child: ParallelNavigator(navigatorKey: _navKeys[page]!, page: page),
    );
  }
}
