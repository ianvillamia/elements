import 'package:flutter/material.dart';

left(double top, double left) {
  return Positioned(
      top: top, //+80
      left: left, //-150
      child: Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.5),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          )));
}

right(double top, double left) {
  return Positioned(
      top: top, //+80
      left: left, //+100
      child: Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.5),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          )));
}

top(double top, double left) {
  return Positioned(
      top: top, //-150
      left: left, //+75
      child: Container(
          width: 50,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          )));
}

bottom(double top, double left) {
  return Positioned(
      top: top, //+200
      left: left, //+75
      child: Container(
          width: 50,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          )));
}

