import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Models/Element.dart';

class Element extends StatefulWidget {
  final Coordinates coordinates;
  Element({@required this.coordinates, ElementModel element});
  @override
  _ElementState createState() => _ElementState();
}

class _ElementState extends State<Element> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.coordinates.y,
      left: widget.coordinates.x,
      child: GestureDetector(
          onTap: () {
            //elemenclick
          },
          child: ElasticIn(
            child: ClipOval(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(color: Colors.grey
                    // color: isNull ? Colors.grey : gameProvider.element.elementColor,
                    ),
                child: Center(
                  child: Text(
                      //   isNull ? '+' : gameProvider.element.element,
                      '+',
                      style: TextStyle(color: Colors.white
//isNull ? Colors.black : gameProvider.element.fontColor),
                          )),
                ),
              ),
            ),
          )),
    );
  }
}
