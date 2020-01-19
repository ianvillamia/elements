import 'package:flutter/material.dart';

class Input {
  buildTextFormField(
String hintText, Color color, bool isPass,Function validator,TextEditingController controller) {
    return TextFormField(
      controller: controller,
      obscureText: isPass,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: color)),
      validator:validator
    );
  }
}
