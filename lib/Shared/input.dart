import 'package:flutter/material.dart';

class Input {
  buildTextFormField(
      String hintText, Color color, bool isPass,Function validator) {
    return TextFormField(
      obscureText: isPass,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: color)),
      validator:validator
    
    );
  }
}
