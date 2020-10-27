import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Screens/Game/protoGame.dart';
import 'package:splash_tap/splash_tap.dart';

class ElementContainer extends StatefulWidget {
  ElementContainer({Key key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
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
          duration: Duration(milliseconds: 250),
          width: sidebarWidth,
          curve: Curves.easeIn,
          height: size.height * .35,
          child: Stack(
            children: [
              Positioned(
                left: size.width * .5 - size.width * .45,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeIn,
                  width: size.width * .5,
                  height: size.height * .35,
                  decoration: BoxDecoration(
                      color: _elementContainer,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
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
                          elementColor: Colors.red,
                          fontColor: Colors.white),
                      _element(
                          element: 'O',
                          elementColor: Colors.red,
                          fontColor: Colors.white),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProtoGame(),
                              ));
                        },
                        child: Text('Reset'),
                      )
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
                      duration: Duration(milliseconds: 250),
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
      onTap: () {},
      splashColor: Colors.blue,
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
              style: TextStyle(color: fontColor),
            )),
          ),
        ),
      ),
    );
  }
}
