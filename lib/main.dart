import 'package:flutter/material.dart';
import 'package:todo_app/Features/Auth/login_view.dart';
import 'package:todo_app/Features/Auth/sign_up_view.dart';
import 'package:todo_app/core/themes/themes/themes_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Features/Home/presentation/views/home_screen.dart';
import 'Features/splash/splash_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        HomeScreen.routeName:(_)=>const HomeScreen(),
        LoginView.routeName:(_)=>const LoginView(),
        SignUpView.routeName:(_)=>const SignUpView(),
        SplashScreen.routeName:(_)=>const SplashScreen(),

      },
      initialRoute:SplashScreen.routeName,
    );
  }
}
