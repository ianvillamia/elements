import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Coordinates.dart';

class ElementModel {
  String element;
  Color elementColor;
  Color fontColor;
  double x;
  double y;
  Spawn spawn;
  ElementModel() {}
  ElementModel.getData({DocumentSnapshot doc}) {
    this.element = doc.data()['element'];
    this.elementColor = Colors.red;
    this.fontColor = Colors.white;
    this.x = doc.data()['coordinate']['x'].toDouble();
    this.y = doc.data()['coordinate']['y'].toDouble();
    this.spawn = Spawn.origin;
  }
}
