import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Features/Auth/login_view.dart';
import 'package:todo_app/Features/Auth/sign_up_view.dart';
import 'package:todo_app/Features/Home/presentation/views/home_screen.dart';
import 'package:todo_app/core/constants/app_images.dart';
import 'package:flutter_animate/flutter_animate.dart';


class SplashScreen extends StatefulWidget {
  static const routeName="splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      navigateToInitialScreen();
    });
  }

  void navigateToInitialScreen() {
if(FirebaseAuth.instance.currentUser==null){
  Navigator.pushReplacementNamed(context, LoginView.routeName);
}else{
  Navigator.pushReplacementNamed(context, HomeScreen.routeName);

}
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.logo,height: height*0.3,width: width*0.6,fit: BoxFit.fill
        ).animate().scale(
          curve: Curves.fastOutSlowIn,
          duration: Duration(seconds: 2)
        ),
      ),
    );
  }
}
