import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/Firebase/FireStore/model/User-Model.dart' as MyUser;
import 'package:flutter/material.dart';
import 'package:todo_app/core/Shared%20Widgets/custom_auth_button.dart';
import 'package:todo_app/core/Shared%20Widgets/custom_textformfield.dart';
import 'package:todo_app/core/constants/FirebaseAuthCodes.dart';
import 'package:todo_app/core/constants/constants.dart';

import '../../../../Firebase/FireStore/FireStoreHandler.dart';
import '../../../../core/Shared Widgets/custom_dialog_message.dart';
import '../../../../core/Shared Widgets/custom_loading_dialog.dart';
import '../../../Home/presentation/views/home_screen.dart';


class SignupBody extends StatelessWidget {
  TextEditingController fullNameController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController passwordConfirmationController=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignupBody({super.key});

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
              controller: fullNameController,
              label: "Full Name",
              keyboardType: TextInputType.name,
              validate: (value) {
                if(value==null||value.isEmpty){
                  return "please enter your full name";
                }
        
                return null;
              } ,
            ),
            SizedBox(height: height*0.01,),
            CustomTextformfield(
              controller: ageController,
              label: "Age",
              keyboardType: TextInputType.number,
              validate: (value) {
                if(value==null||value.isEmpty){
                  return "please enter your age";
                }

                return null;
              } ,
            ),
            SizedBox(height: height*0.01,),
            CustomTextformfield(
              controller: phoneController,
              label: "Phone Number",
              keyboardType: TextInputType.number,
              validate: (value) {
                if(value==null||value.isEmpty){
                  return "please enter your phone number";
                }
                if(value.length!=11){
                  return "please enter correct number";
                }

                return null;
              } ,
            ),
            SizedBox(height: height*0.01,),
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
              isObscure: false,
              isPassword: true,
              validate: (value) {
                if(value==null||value.isEmpty){
                  return "please enter your password";
                }
                if(isValidPassword(value)){
                  return "enter valid password";
                }
                return null;
              } ,
            ),
            SizedBox(height: height*0.01,),
            CustomTextformfield(
              controller: passwordConfirmationController,
              label: "Password Confirmation",
              keyboardType: TextInputType.visiblePassword,
              isObscure: false,
              isPassword: true,
              validate: (value) {
                if(value==null||value.isEmpty){
                  return "please enter your confirmation password";
                }
                if(value!=passwordController.text ){
                  return 'should be same as password';
                }
                return null;
              } ,
            ),
            SizedBox(height: height*0.05,),
            CustomAuthButton(
              childText: "Create Account",
              onClick:(){
                createAccount(context);
              } ,
            )
        
        
          ],
        ),
      ),
    );
  }
  createAccount(BuildContext context)async{
    print("test");
  if(formKey.currentState?.validate()==true){
    //call firebase auth create account
    try{
      showDialog(context: context, builder: (context)=>CustomLoadingDialog(),);

      UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await FirestoreHandler.createUser(MyUser.User(
        id:userCredential.user!.uid,
        fullName: fullNameController.text,
        age: ageController.text,
        phone: phoneController.text,
        email: emailController.text,
      ));
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route)=>false);

    }on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      if (e.code == FirebaseAuthCodes.weakpassword) {
        showDialog(context: context, builder:(context)=>
            CustomDialogMessage(message: "The password provided is too weak.",
                poitiveBtnPress:(){Navigator.pop(context);} ));
        print('The password provided is too weak.');
      } else if (e.code == FirebaseAuthCodes.emailAlreadyInUse) {
        showDialog(context: context, builder:(context)=>
            CustomDialogMessage(message: "The account already exists for that email.",
                poitiveBtnPress:(){Navigator.pop(context);} ));
        print('The account already exists for that email.');
      }}
    catch(e){

    }
  }

  }

  }



