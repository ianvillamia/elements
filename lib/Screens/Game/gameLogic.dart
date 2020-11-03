import 'package:animate_do/animate_do.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Providers/gameProvider.dart';
import 'package:flutter/material.dart';
import 'element.dart' as element;

class GameLogic {
  identifyGroup(
      {@required String element, @required GameProvider gameProvider}) {
    //separates groups of bonds
    List elementGroup = [];
    elementGroup = element.split(" ");
    //isolate elements
    double left = 0.0;
    for (var element in elementGroup) {
      //add container here per element
      //print(element);
      // print(left);
      _drawContainer(gameProvider: gameProvider, left: left, element: element);
      left += 250;
//     _groupDeconstructor(element: element, gameProvider: gameProvider);

    }
  }
}

_drawContainer({GameProvider gameProvider, left, @required element}) {
  // print('drawing container');
  gameProvider.addElement(ElementGroup(
    element: element,
    left: left,
  ));
}

class ElementGroup extends StatefulWidget {
  final left;
  final element;
  ElementGroup({this.left, @required this.element});

  @override
  _ElementGroupState createState() => _ElementGroupState();
}

class _ElementGroupState extends State<ElementGroup> {
  List drawItems = [];
  List elements = [];
  something(element) {
    for (int x = 0; x < element.length; x++) {
      drawItems.add(element[x]);
      if (isNumeric(element[x])) {
        drawItems.remove(element[x - 1]);
        drawItems.remove(element[x]);
        drawItems.add(element[x - 1] + element[x]);
      }
    }

    _drawElements(drawItems);
  }

  _drawElements(drawItems) {
    for (var item in drawItems) {
      // print(item);

      if (elementLoop(item)) {
        _drawChildren(
          item: item,
        );
        //draw element item loop
      } else {
        //spawn C

      }
    }
  }

  _drawChildren({item, origin, GameProvider gameProvider}) {
    List things = [];
    //always value of 2 one for the element one for the loop number
    for (int x = 0; x < item.length; x++) {
      things.add(item[x]);
    }
    int loopElement = int.parse(things[1]);
    String element = things[0];
    //no need to loop
    /*
  if 1 = left?
  2=top, bot
  3=top,left,bot
  */
    switch (loopElement) {
      case 1:
        break;
      case 2:
        //mid top and bot
        setState(() {
          this.elements.add(_buildPositioned(top: 0.0, left: 100.0));
          this.elements.add(_buildPositioned(top: 100.0, left: 100.0));
          this.elements.add(_buildPositioned(top: 200.0, left: 100.0));
        });

        break;
      case 3:
        //top left bot
        setState(() {
          this.elements.add(_buildPositioned(top: 0.0, left: 0.0));
          this.elements.add(_buildPositioned(top: 0.0, left: 100.0));
          this.elements.add(_buildPositioned(top: 100.0, left: 100.0));
          this.elements.add(_buildPositioned(top: 200.0, left: 100.0));
        });
        break;
      default:
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    something(widget.element);
  }

  @override
  Widget build(BuildContext context) {
    // something(widget.element);

    var size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * .2,
      left: widget.left,
      child: Container(
        width: 250,
        height: 250,
        color: Colors.red,
        child: Stack(
          children: elements.map<Widget>((e) {
            return e;
          }).toList(),
        ),
      ),
    );
  }

  _buildPositioned({top, left}) {
    return Positioned(
        top: top,
        left: left,
        child: ClipOval(
          child: Container(
            width: 50,
            height: 50,
            color: Colors.white,
          ),
        ));
  }
}

_groupDeconstructor({element, GameProvider gameProvider}) {
  List drawItems = [];
  for (int x = 0; x < element.length; x++) {
    drawItems.add(element[x]);
    if (isNumeric(element[x])) {
      drawItems.remove(element[x - 1]);
      drawItems.remove(element[x]);
      drawItems.add(element[x - 1] + element[x]);
    }
  }
  // print(drawItems);
  // print('drawing items');
  _drawElements(drawItems: drawItems, gameProvider: gameProvider);
}

_drawElements({drawItems, GameProvider gameProvider}) {
  //NEED TO REFACTOR THIS MAKE THIS INSIDE CONTAINER?
  print(drawItems);
  Coordinates origin = Coordinates();
  origin.x = 205.02857142857144;
  origin.y = 150.99428571428572;
  //this coordinate is not gonna work
  //

  gameProvider.drawEverything();
}

class ElementItem extends StatefulWidget {
  final Coordinates coordinate;
  final String element;
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
            decoration: BoxDecoration(color: Colors.grey),
            child: Center(
              child: Text(
                widget.element ?? '+',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*****************************************************************************************************/
//regex'es
bool elementLoop(String x) {
  RegExp _numeric = RegExp(r'\d');
  return _numeric.hasMatch(x);
}

/// check if the string contains only numbers
bool isNumeric(String str) {
  RegExp _numeric = RegExp(r'^-?[0-9]+$');
  return _numeric.hasMatch(str);
}
