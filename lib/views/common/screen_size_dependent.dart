import 'package:flutter/material.dart';

class ScreenSizeDependent extends StatelessWidget {
  final Widget? desktopScreen;
  final Widget? mobileScreen;

  const ScreenSizeDependent({
    Key? key,
    this.desktopScreen,
    this.mobileScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 700) {
          return desktopScreen ?? Placeholder();
        } else {
          return mobileScreen ?? Placeholder();
        }
      },
    );
  }
}
