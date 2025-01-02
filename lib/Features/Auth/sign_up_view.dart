import 'package:flutter/material.dart';
import 'package:todo_app/core/Shared%20Widgets/custom_auth_appbar.dart';
import 'package:todo_app/core/constants/app_images.dart';

import 'Widgets/signup_body/signup_body.dart';

class SignUpView extends StatelessWidget {
  static const String routeName='signup';
  const SignUpView({super.key});

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
        appBar: CustomAuthAppbar(title: "Create Account",),
        body: SignupBody(),
      ),
    );
  }
}
