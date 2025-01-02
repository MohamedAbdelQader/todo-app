import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Features/Auth/sign_up_view.dart';
import 'package:todo_app/Firebase/FireStore/FireStoreHandler.dart';
import 'package:todo_app/core/Shared%20Widgets/custom_auth_button.dart';
import 'package:todo_app/core/Shared%20Widgets/custom_textformfield.dart';
import 'package:todo_app/core/constants/FirebaseAuthCodes.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/Firebase/FireStore/model/User-Model.dart' as MyUser;

import '../../../../core/Shared Widgets/custom_dialog_message.dart';
import '../../../../core/Shared Widgets/custom_loading_dialog.dart';
import '../../../Home/presentation/views/home_screen.dart';

class LoginBody extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextformfield(
              controller: emailController,
              label: "Email",
              keyboardType: TextInputType.emailAddress,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter your email";
                }
                if (!isValidEmail(value)) {
                  return "enter valid email";
                }
                return null;
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextformfield(
              controller: passwordController,
              label: "Password",
              keyboardType: TextInputType.visiblePassword,
              isObscure: false,
              isPassword: true,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter your password";
                }
                if (isValidPassword(value)) {
                  return "enter valid password";
                }
                return null;
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomAuthButton(
              childText: "Login",
              onClick: () {
                login(context);
              },
            ),
            SizedBox(
              height: height * 0.04,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
                child: Text(
                  "Or create new account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }

  login(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      try {
        showDialog(context: context, builder: (context)=>CustomLoadingDialog(),);
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text,
            password: passwordController.text);
        MyUser.User? user = await FirestoreHandler.ReadUser(
            userCredential.user!.uid
        );
        Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route)=>false);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == FirebaseAuthCodes.userNotFound) {
          showDialog(context: context, builder:(context)=>
              CustomDialogMessage(message: "No user found for that email.",
                poitiveBtnPress:(){Navigator.pop(context);} ,));
          print('No user found for that email.');
        } else if (e.code == FirebaseAuthCodes.wrongPassword) {
          showDialog(context: context, builder:(context)=>
              CustomDialogMessage(message: "Wrong password provided for that user.",
              poitiveBtnPress: (){Navigator.pop(context);},));

          print('Wrong password provided for that user.');
        }
      } catch (e) {
        Navigator.pop(context);
        CustomDialogMessage(message: e.toString(),
          poitiveBtnPress:(){Navigator.pop(context);} ,);

      }
    }
  }
}
