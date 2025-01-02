import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/color/color_app.dart';

abstract class StylesApp{
  static const TextStyle appBarStyle=TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: ColorApp.white
  );
  static const TextStyle titlesTextStyle=TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.bold,
      color: ColorApp.lightPrimaryColor,
  );
  static const TextStyle bottomSheetTitle=TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ColorApp.black
  );
  static const TextStyle dateStyle=TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.w500);
  static const TextStyle bodyTextStyle=TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: ColorApp.black
  );
  static const TextStyle labelTextForm=TextStyle(
    fontSize: 12,
    color: Colors.black
  );
  static const TextStyle unselectedCalenderDayStyle =TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 15);
  static const TextStyle selectedCalenderDayStyle =TextStyle(color: ColorApp.lightPrimaryColor,fontWeight: FontWeight.bold, fontSize: 15);

  //Dark

  static const TextStyle appBarDarkStyle=TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: ColorApp.black
  );
}