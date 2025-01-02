import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/color/color_app.dart';

abstract class ThemeApp{
  static ThemeData light=ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: ColorApp.LightBackgroundColor,
    canvasColor: ColorApp.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorApp.lightPrimaryColor,
      primary: ColorApp.lightPrimaryColor,
      secondary: ColorApp.white,
      onPrimary: ColorApp.white
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorApp.lightPrimaryColor,
      toolbarHeight: 120,
      titleTextStyle: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
        fontSize: 22
      ),
      centerTitle: true,
      elevation: 0
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorApp.white,
      selectedItemColor: ColorApp.lightPrimaryColor,
      unselectedItemColor: ColorApp.greyColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        size: 33
      ),
        unselectedIconTheme: IconThemeData(
            size: 33,
          color:ColorApp.greyColor
        )
    )
  );

}