import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Models/Element.dart';

class ElementItem extends StatefulWidget {
  final Coordinates coordinate;
  final ElementModel element;
  ElementItem({this.coordinate, this.element});

  @override
  _ElementItemState createState() => _ElementItemState();
}

class _ElementItemState extends State<ElementItem> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.coordinate.y,
      left: widget.coordinate.x,
      child: ElasticIn(
        child: ClipOval(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: widget.element.elementColor),
            child: Center(
              child: Text(
                widget.element.element ?? '+',
                style: TextStyle(color: widget.element.fontColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GiveElement {
  static hydrogen() {
    ElementModel element = ElementModel();
    element.element = 'H';
    element.fontColor = Colors.white;
    element.elementColor = Colors.greenAccent;
    return element;
  }

  static carbon() {
    ElementModel element = ElementModel();
    element.element = 'C';
    element.fontColor = Colors.white;
    element.elementColor = Colors.red;
    return element;
  }

  static oxygen() {
    ElementModel element = ElementModel();
    element.element = 'O';
    element.fontColor = Colors.white;
    element.elementColor = Colors.blueAccent;
    return element;
  }
}
