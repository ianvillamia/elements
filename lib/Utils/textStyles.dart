import 'package:flutter/material.dart';

class CustomTextStyles {
  static customText({bool isBold, double size, Color color}) {
    if (isBold == null) {
      isBold = false;
    }
    return TextStyle(
        fontSize: size ?? 35,
        color: color ?? Colors.black,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal);
  }
}

class FontSizes {
  static double heading = 30;
  static double subHeading = 18;
  static double small = 12;
  static double medium = 16;
  static double large = 20;
}
