import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileBottomNavigationBar extends StatefulWidget {
  const MobileBottomNavigationBar({
    super.key,
  });

  @override
  State<MobileBottomNavigationBar> createState() =>
      _MobileBottomNavigationBarState();
}

class _MobileBottomNavigationBarState extends State<MobileBottomNavigationBar> {
  int selectedIndex = 0;

  static var NavigtaionOptions = [
    {
      "activeIcon": Icons.home,
      "inactiveIcon": Icons.home_outlined,
      "label": "Home",
      "route": "/"
    },
    {
      "activeIcon": Icons.explore,
      "inactiveIcon": Icons.explore_outlined,
      "label": "Explore",
      "route": "/explore"
    },
    {
      "activeIcon": Icons.library_music,
      "inactiveIcon": Icons.library_music_outlined,
      "label": "Library",
      "route": "/library"
    }
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    Get.toNamed(NavigtaionOptions[index]["route"] as String);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: NavigtaionOptions.asMap().entries.map((entry) {
        return BottomNavigationBarItem(
          icon: Icon(
            selectedIndex == entry.key
                ? (entry.value["activeIcon"] as IconData)
                : (entry.value["inactiveIcon"] as IconData),
          ),
          label: entry.value["label"] as String,
          backgroundColor: Colors.amber,
        );
      }).toList(),
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Theme.of(context).primaryColor,
      selectedFontSize: Theme.of(context).textTheme.bodySmall!.fontSize!,
      unselectedFontSize: Theme.of(context).textTheme.bodySmall!.fontSize!,
      selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
    );
  }
}
