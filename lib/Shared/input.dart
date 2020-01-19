import 'package:flutter/material.dart';

class Input {
  buildTextFormField(
      String hintText, Color color, bool isPass) {
    return TextFormField(
      obscureText: isPass,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: color)),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter something!";
        } else
          return null;
      },
    );
  }
}
