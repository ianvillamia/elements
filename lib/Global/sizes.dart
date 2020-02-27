import 'package:flutter/material.dart';

class Size {
  static var width;
  static var height;
  void init(BuildContext context) {
    width= MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
  }
}
