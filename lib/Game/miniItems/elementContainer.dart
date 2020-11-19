import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Game/elementBuilder.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Providers/gameProvider.dart';

import 'package:provider/provider.dart';
import 'package:splash_tap/splash_tap.dart';
import 'package:mynewapp/Models/Element.dart';

class ElementContainer extends StatefulWidget {
  final Widget element;
  String elementName;
  ElementContainer({@required this.element, @required this.elementName});

  @override
  _ElementContainerState createState() => _ElementContainerState();
}

class _ElementContainerState extends State<ElementContainer> {
  double sidebarWidth = 50;
  bool isExpanded = false;
  Size size;
  List elements = [];
  IconData _icon = Icons.arrow_left;
  Color _elementContainer = Colors.transparent;
  bool isInit = false;
  GameProvider _gameProvider;
  @override
  Widget build(BuildContext context) {
    _gameProvider = Provider.of<GameProvider>(context, listen: false);
    size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity > 0) {
            // User swiped Left
            setState(() {
              isExpanded = false;

              sidebarWidth = 50;
              _icon = Icons.arrow_left;
              _elementContainer = Colors.transparent;
            });
          } else if (details.primaryVelocity < 0) {
            // User swiped Right

            setState(() {
              isExpanded = true;

              sidebarWidth = size.width * .5;
              _icon = Icons.arrow_right;
              _elementContainer = Colors.grey;
            });
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 130),
          width: sidebarWidth,
          curve: Curves.easeIn,
          height: size.height * .35,
          child: Stack(
            children: [
              Positioned(
                left: size.width * .5 - size.width * .45,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 130),
                  curve: Curves.easeIn,
                  width: size.width * .5,
                  height: size.height * .35,
                  decoration: BoxDecoration(
                      color: _elementContainer,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15))),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: size.width * .48,
                          height: size.height * .32,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _element(
                                element: 'C',
                                elementColor: Colors.red,
                                fontColor: Colors.white),
                            _element(
                                element: 'H',
                                elementColor: Colors.greenAccent,
                                fontColor: Colors.white),
                            _element(
                                element: 'O',
                                elementColor: Colors.blueAccent,
                                fontColor: Colors.white),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Game(
                                        element: widget.element,
                                        elementName: widget.elementName,
                                      ),
                                    ));
                              },
                              child: Text('Reset'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ClipOval(
                  child: GestureDetector(
                    onTap: () {
                      if (isExpanded) {
                        setState(() {
                          isExpanded = false;

                          sidebarWidth = 50;
                          _icon = Icons.arrow_left;
                          _elementContainer = Colors.transparent;
                        });
                      } else {
                        setState(() {
                          isExpanded = true;

                          sidebarWidth = size.width * .5;
                          _icon = Icons.arrow_right;
                          _elementContainer = Colors.grey;
                        });
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 130),
                      width: 50,
                      height: 50,
                      child: Center(
                          child: Icon(
                        _icon,
                        size: 40,
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _element(
      {@required String element,
      @required Color elementColor,
      @required Color fontColor}) {
    return Splash(
      onTap: () {
        //make selected element this
        ElementModel _element = ElementModel();
        _element.element = element;
        _element.elementColor = elementColor;
        _element.fontColor = fontColor;
        _gameProvider.changeSelectedElement(element: _element);
        if (isExpanded) {
          setState(() {
            isExpanded = false;

            sidebarWidth = 50;
            _icon = Icons.arrow_left;
            _elementContainer = Colors.transparent;
          });
        } else {
          setState(() {
            isExpanded = true;

            sidebarWidth = size.width * .5;
            _icon = Icons.arrow_right;
            _elementContainer = Colors.grey;
          });
        }
      },
      splashColor: elementColor,
      child: ElasticIn(
        child: ClipOval(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: elementColor ?? Colors.white,
            ),
            child: Center(
                child: Text(
              element,
              style: TextStyle(color: fontColor, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
