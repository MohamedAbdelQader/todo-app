import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogMessage extends StatelessWidget {
  final String message;
  final String poitiveBtnTitle;
   String? negativeBtnTitle;
  final void Function() poitiveBtnPress;
   void Function()? negativeBtnPress;
   CustomDialogMessage({
    super.key,
    required this.message,
    this.poitiveBtnTitle = "Ok",
    required this.poitiveBtnPress,
     this.negativeBtnTitle,
     this.negativeBtnPress
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
      actions: [
        TextButton(onPressed: poitiveBtnPress, child: Text(poitiveBtnTitle)),
        if(negativeBtnTitle!=null)
          TextButton(onPressed: negativeBtnPress, child: Text(negativeBtnTitle!)),


      ],
    );
  }
}
