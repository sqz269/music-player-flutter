// Theme config for FlexColorScheme version 7.3.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final light = FlexThemeData.light(
    scheme: FlexScheme.materialBaseline,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      blendTextTheme: true,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 6.0,
      switchThumbFixedSize: true,
      inputDecoratorUnfocusedHasBorder: false,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
      snackBarRadius: 6,
      bottomSheetRadius: 6.0,
      navigationBarIndicatorRadius: 6.0,
      navigationBarElevation: 6.0,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    // To use the Playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );

  static final dark = FlexThemeData.dark(
    scheme: FlexScheme.materialBaseline,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      blendTextTheme: true,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 6.0,
      switchThumbFixedSize: true,
      inputDecoratorUnfocusedHasBorder: false,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
      snackBarRadius: 6,
      bottomSheetRadius: 6.0,
      navigationBarIndicatorRadius: 6.0,
      navigationBarElevation: 6.0,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    // To use the Playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );
}
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
