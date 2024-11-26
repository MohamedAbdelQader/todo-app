import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/color/color_app.dart';
import 'package:todo_app/core/themes/styles/styles_app.dart';

typedef validatorType=String? Function(String?);

class CustomTextformfield extends StatefulWidget {
  final String label;
  bool isObscure;
  final bool isPassword;
  final TextInputType keyboardType;
  validatorType validate;
  TextEditingController controller;

  CustomTextformfield({
    super.key,
    required this.label,
    required this.keyboardType,
    this.isObscure = false,
    this.isPassword = false,
    required this.validate,
    required this.controller

  });

  @override
  State<CustomTextformfield> createState() => _CustomTextformfieldState();
}

class _CustomTextformfieldState extends State<CustomTextformfield> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator:widget.validate,
      obscureText: widget.isObscure,
      obscuringCharacter: "*",
      keyboardType: widget.keyboardType,
      style: StylesApp.labelTextForm.copyWith(fontSize: 18),
      decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: StylesApp.labelTextForm,
          suffixIcon: widget.isPassword ?
          IconButton(
              onPressed: () {
                setState(() {
                  widget.isObscure = !widget.isObscure;
                });
              },
              icon: Icon(widget.isObscure ? Icons.visibility_outlined : Icons
                  .visibility_off_outlined, color: ColorApp.primaryColor,
                size: 30,))
              : null
      ),
    );
  }
}
