import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/color/color_app.dart';

abstract class ThemeApp{
  static ThemeData light=ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: ColorApp.backgroundColor,
    canvasColor: ColorApp.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorApp.primaryColor,
      primary: ColorApp.primaryColor,
      secondary: ColorApp.white,
      onPrimary: ColorApp.white
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorApp.primaryColor,
      centerTitle: true,
      elevation: 0
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorApp.white,
      selectedItemColor: ColorApp.primaryColor,
      unselectedItemColor: ColorApp.greyColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        size: 33
      ),
        unselectedIconTheme: IconThemeData(
            size: 33
        )
    )
  );

}