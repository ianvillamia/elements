import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:animate_do/animate_do.dart';

class Stars extends StatefulWidget {
  @override
  _StarsState createState() => _StarsState();
}

class _StarsState extends State<Stars> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Positioned(
          top: 25,
          left: 70,
          child: _buildStars(size: size),
        ),
        Positioned(
          top: 10,
          left: 120,
          child: _buildStars(size: size),
        ),
        Positioned(
          top: 15,
          left: 210,
          child: _buildStars(size: size),
        ),
        Positioned(
          top: 8,
          left: 270,
          child: _buildStars(size: size),
        ),
        Positioned(
          top: 45,
          left: 240,
          child: _buildStars(size: size),
        ),
        Positioned(
          top: 60,
          left: 160,
          child: _buildStars(size: size),
        ),
        Positioned(
          top: 65,
          left: 90,
          child: _buildStars(size: size),
        ),
        Positioned(
          top: 110,
          left: 140,
          child: _buildStars(size: size),
        ),
        Positioned(
          top: 100,
          left: 260,
          child: _buildStars(size: size),
        ),
        Positioned(
          top: 48,
          right: 240,
          child: _buildStars(size: size),
        ),
        Positioned(
          top: 95,
          right: 220,
          child: _buildStars(size: size),
        ),
      ],
    );
  }
}

_buildStars({@required size}) {
  return Swing(
    duration: Duration(seconds: 2),
    child: Flash(
        delay: Duration(seconds: 2),
        duration: Duration(seconds: 3),
        child: Container(
          width: size.width * 0.02,
          height: size.height * 0.02,
          child: ShapeOfView(
            shape: StarShape(noOfPoints: 5),
          ),
        )),
  );
}
