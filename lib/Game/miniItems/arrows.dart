import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Arrows {
  static verticalLine({@required double x, @required double y}) {
    return Positioned(
      top: y,
      left: x,
      child: ElasticIn(
        child: Container(
          width: 10,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  static horizontalLine({@required double x, @required double y}) {
    return Positioned(
      top: y,
      left: x,
      child: ElasticIn(
        child: Container(
          width: 30,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
