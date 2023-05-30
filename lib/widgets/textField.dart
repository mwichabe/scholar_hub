import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final bool obscureText;
  final Function? onChange;
  TextFieldWidget(
      { this.hintText,
       this.prefixIconData,
       this.suffixIconData,
       required this.obscureText,
       this.onChange});

  @override
  Widget build(BuildContext context) {
    return  TextField
      (
      //onChanged: onChange,
      cursorColor: Colors.black,
      obscureText: obscureText,
      decoration: InputDecoration
        (
        hintText: hintText,
        prefixIcon: Icon
          (
          prefixIconData,
          size: 18,
          color: Colors.black,
        ),
        filled: true,
        enabledBorder: UnderlineInputBorder
          (
          borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder
          (
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white38),
        ),
          suffixIcon: Icon
          (
          suffixIconData,
        size: 18,
      ),
      labelStyle: TextStyle(color: Colors.white60),
        focusColor: Colors.white60,
      ),
    );
  }
}
