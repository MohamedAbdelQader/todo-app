import 'package:flutter/material.dart';

class CustomAuthAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  @override
  final Size preferredSize; // Define preferredSize
  CustomAuthAppbar({Key? key,required this.title})
      : preferredSize = const Size.fromHeight(60.0), // Set preferred height here
        super(key: key);

  @override
  Widget build(BuildContext context) {
  return AppBar(
  backgroundColor: Colors.transparent,
  title: Text(title,style: TextStyle(
  fontSize: 23,
  fontWeight: FontWeight.bold
  ),),

  );
  }
}
