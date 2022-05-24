import 'package:flutter/material.dart';
import 'package:odc_project/utilites/themes.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  String hintText;
  final Function validator;
  final TextInputType textInputType;
    Widget? prefixIcon;
    Widget? suffixIcon;


  AuthTextFromField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.hintText,
    required this.textInputType,
      this.prefixIcon,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: AUTHTEXTFORMFIELDCOLOR,
      style: TextStyle(color: PARAGRAPH.withOpacity(.6)),
      keyboardType: textInputType,
      validator: (value) => validator(value),
      decoration: InputDecoration(
          prefixIcon: prefixIcon ,
          suffixIcon: suffixIcon,
          // label: Text(
          //   hintText,
          //   style: TextStyle(color: AUTHTEXTFORMFIELDCOLOR),
          // ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: DISABLED,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AUTHTEXTFORMFIELDCOLOR,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorStyle: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
