import 'package:flutter/material.dart';
import 'package:todo_app/Features/Home/presentation/views/home_screen.dart';
import 'package:todo_app/core/themes/themes/themes_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.light,
      home: HomeScreen(),
    );
  }
}
