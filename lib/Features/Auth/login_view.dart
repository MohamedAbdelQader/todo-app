import 'package:flutter/material.dart';
import 'package:todo_app/Features/Auth/Widgets/login_body/login_body.dart';
import 'package:todo_app/core/constants/app_images.dart';
import '../../core/Shared Widgets/custom_auth_appbar.dart';
class LoginView extends StatelessWidget {
  static const String routeName='login';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(AppImages.background),
              fit: BoxFit.fill
          )
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: CustomAuthAppbar(title: "Login ",),
        body: LoginBody(),
      ),
    );
  }
}
