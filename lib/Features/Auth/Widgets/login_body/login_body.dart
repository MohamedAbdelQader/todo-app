import 'package:flutter/material.dart';
import 'package:todo_app/core/Shared%20Widgets/custom_auth_button.dart';
import 'package:todo_app/core/Shared%20Widgets/custom_textformfield.dart';
import 'package:todo_app/core/constants/constants.dart';

class LoginBody extends StatelessWidget {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key:formKey  ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            CustomTextformfield(
              controller:emailController ,
              label: "Email",
              keyboardType: TextInputType.emailAddress,
              validate: (value) {
                if(value==null||value.isEmpty){
                  return "please enter your email";
                }
                if(!isValidEmail(value)){
                  return "enter valid email";
                }
                return null;
              } ,
            ),
            SizedBox(height: height*0.01,),
            CustomTextformfield(
              controller: passwordController,
              label: "Password",
              keyboardType: TextInputType.visiblePassword,
              isObscure: true,
              isPassword: true,
              validate: (value) {
                if(value==null||value.isEmpty){
                  return "please enter your password";
                }
                if(!isValidPassword(value)){
                  return "enter valid password";
                }
                return null;
              } ,
            ),
            SizedBox(height: height*0.01,),

            CustomAuthButton(
              childText: "Login",
              onClick:(){
                createAccount();
              } ,
            )


          ],
        ),
      ),
    );
  }
  createAccount(){
    formKey.currentState?.validate();
  }

}

