import 'package:flutter/material.dart';

import './components.dart' as components;

import 'package:zoom_widget/zoom_widget.dart';

bool isVisible = false;

class Grid extends StatefulWidget {
  const Grid({Key key}) : super(key: key);

  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.white30,
            child: Zoom(
              backgroundColor: Colors.orange,
              width: 10000,
              height: 10000,
              initZoom: 0.0,
              child: Stack(
                children: <Widget>[
                  prefab(5000.00, 5000),
                  Visibility(
                    visible: isVisible,
                    child: Center(child: Text('Do')),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Stack(
                      children: <Widget>[
                        //top top=orgin-350,left = same
                        buildDragT(4650, 5000, Colors.redAccent, true),
                        //right top=same,left=origin-350
                        buildDragT(5000, 4650, Colors.redAccent, true),
                        //bottom origin=origin+350,left=same
                        buildDragT(5350, 5000, Colors.redAccent, true),
                        //left
                        buildDragT(5000, 5350, Colors.redAccent, true)
                      ],
                    ),
                  )

                  // Visibility(
                  //     visible: true,
                  //     child: prefab(5200, 5500),
                  // )
                  //kailangan ko ng list na nag lilisten sa 2 values
                  //stream add
                ],
              ),
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          color: Colors.redAccent,
          child: Stack(
            children: <Widget>[
              Positioned(left: 10, child: dragItem("C", Colors.amber)),
              Positioned(
                left: 80,
                child: dragItem("O", Colors.blueAccent),
              ),
            ],
          ),
        )
      ],
    );
  }

  dragItem(String data, Color color) {
    return Draggable(
      data: data, //DATA

      child: Container(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        width: 150,
        height: 50,

        //  color: widget.itemColor,

        child: Center(
          child: Text(data,
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 20.0)),
        ),
      ),

      //FEEDBACK WHILE DRAGGING
      feedback: Container(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        width: 100,
        height: 100,
        child: Center(
          child: Text(data,
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 20.0)),
        ),
      ),
      childWhenDragging: Container(),
    );
  }

  buildDragT(double top, double left, Color c, bool isVisible) {
    var elementName = "Drag";
    Color color = c;
    return Positioned(
      top: top,
      left: left,
      child: DragTarget(
        onWillAccept: (data) {
          print("data = $data onWillAccept");
          return true;
        },
        onAccept: (String data) {
          print(" onAccept");
          setState(() {
            print("set state called");
            isVisible = true;
          });
        },
        onLeave: (data) {
          print("data = $data onLeave");
        },
        // onAccept: (String value) {
        //   //push here in firestore
        //   print("Set State Called");
        //   print(value);

        //   if (value == "C") {
        //     setState(() {
        //       print("went to c");
        //       isVisible = true;
        //       print(isVisible);
        //       elementName = value;
        //       color = Colors.yellow;
        //     });
        //   }
        //   if (value == "O") {
        //     setState(() {
        //       isVisible = true;
        //       elementName = value;
        //       color = Colors.blue;
        //     });
        //   }
        //},
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Stack(children: <Widget>[
            Container(
              width: 200,
              height: 200.0,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              child: Center(
                child: Text(elementName,
                    style: TextStyle(fontSize: 40, color: Colors.white)),
              ),
            ),
          ]);
        },
      ),
    );
  }

  prefab(double t, double l) {
    return Stack(children: <Widget>[
      buildDragT(t, l, Colors.redAccent, true),
      // components.left(t + 80, l - 150),
      //components.right(t + 80, l + 200),
      //components.top(t - 150, l + 75),
      //components.bottom(t + 200, l + 75)
    ]);
  }
}
