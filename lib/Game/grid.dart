import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

bool isVisible = false;

class Game extends StatefulWidget {
  @override
  _Game createState() => _Game();
}

class _Game extends State<Game> {
  var targetText = "Target";

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
                  Positioned(
                    top: 5000,
                    left: 5000,
                    child: Container(
                      width: 500,
                      height: 500,
                      child: DragTarget(
                        onWillAccept: (String data) {
                          print("data = $data onWillAccept");
                          return true;
                        },
                        onAccept: (data) {
                          print(" onAccept");
                          setState(() {
                            isVisible = true;
                            targetText = "data";
                          });
                        },
                        onLeave: (data) {
                          print("data = $data onLeave");
                        },
                        builder: (context, candidateData, rejectedData) {
                          return Container(
                            width: 150.0,
                            height: 150.0,
                            color: Colors.blue[500],
                            child: Center(
                              child: Text(targetText),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible:isVisible,
                    child: Positioned(
                    top: 5100,
                    left: 5500,
                    child: DragTarget(
                      onWillAccept: (String data) {
                        print("data = $data onWillAccept");
                        return true;
                      },
                      onAccept: (data) {
                        print(" onAccept");
                        setState(() {
                          isVisible = true;
                          targetText = "data";
                        });
                      },
                      onLeave: (data) {
                        print("data = $data onLeave");
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          width: 150.0,
                          height: 150.0,
                          color: Colors.red[500],
                          child: Center(
                            child: Text(targetText),
                          ),
                        );
                      },
                    ),
                  ),
            
                  )
                ],
              ),
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          color: Colors.redAccent,
          child: Stack(
            children: <Widget>[
              Draggable(
                //DATA
                data: "C",
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  width: 150,
                  height: 50,

                  //  color: widget.itemColor,

                  child: Center(
                    child: Text("C",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 20.0)),
                  ),
                ),

                //FEEDBACK WHILE DRAGGING
                feedback: Container(
                  decoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Text("C",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 20.0)),
                  ),
                ),
                childWhenDragging: Container(),
                //data: "123"
              ),
            ],
          ),
        )
      ],
    );
  }
}
