import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
        ),
        content:
        Container(
          height: MediaQuery.of(context).size.height*0.05,
          child:Center(
            child: CircularProgressIndicator()
            ,),
        )
    );
  }
}
