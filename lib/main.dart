import 'package:flutter/material.dart';
import 'package:todo_app/Features/Auth/login_view.dart';
import 'package:todo_app/Features/Auth/sign_up_view.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.light,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        LoginView.routeName:(_)=>LoginView(),
        SignUpView.routeName:(_)=>SignUpView(),

      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
