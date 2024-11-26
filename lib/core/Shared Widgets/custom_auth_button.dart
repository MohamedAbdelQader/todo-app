import 'package:flutter/material.dart';
typedef authFunction =void Function();
class CustomAuthButton extends StatelessWidget {
  final String childText;
  authFunction onClick;
   CustomAuthButton({
    super.key,
    required this.childText,
     required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(),
        onPressed: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              childText,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.arrow_forward,
              size: 20,
            )
          ],
        ));
  }
}
