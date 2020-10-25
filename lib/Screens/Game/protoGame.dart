import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Coordinates.dart';

class ProtoGame extends StatefulWidget {
  ProtoGame({Key key}) : super(key: key);

  @override
  _ProtoGameState createState() => _ProtoGameState();
}

class _ProtoGameState extends State<ProtoGame> {
  Color _color = Colors.white;
  double sidebarWidth = 100;
  bool isExpanded = false;
  Size size;
  List elements = [];
  IconData _icon = Icons.arrow_left;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.amber,
        width: size.width,
        height: size.height,
        child: Column(
          children: <Widget>[
            // Text('CH3-O-CH3'),
            _gameScreen()
            //enter widgets here
          ],
        ),
      ),
    );
  }

  _gameScreen() {
    Coordinates origin = Coordinates();
    origin.x = size.width * .3;
    origin.y = size.height * .367;
    elements.add(_spawnObject(coordinates: origin));
    // elements.add(_spawnObject(coordinates: origin, spawn: Spawn.left));
    // elements.add(_spawnObject(coordinates: origin, spawn: Spawn.right));
    // elements.add(_spawnObject(coordinates: origin, spawn: Spawn.top));
    // elements.add(_spawnObject(coordinates: origin, spawn: Spawn.bottom));

    return Expanded(
        child: InteractiveViewer(
      child: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  if (details.primaryVelocity > 0) {
                    // User swiped Left
                    setState(() {
                      isExpanded = false;
                      _color = Colors.white;
                      sidebarWidth = 50;
                      _icon = Icons.arrow_left;
                    });
                  } else if (details.primaryVelocity < 0) {
                    // User swiped Right

                    setState(() {
                      isExpanded = true;
                      _color = Colors.white;
                      sidebarWidth = 150;
                      _icon = Icons.arrow_right;
                    });
                  }
                },
                // onTap: () {
                //   if (isExpanded) {
                //     setState(() {
                //       isExpanded = false;
                //       _color = Colors.white;
                //       sidebarWidth = 50;
                //       _icon = Icons.arrow_left;
                //     });
                //   } else {
                //     setState(() {
                //       isExpanded = true;
                //       _color = Colors.white;
                //       sidebarWidth = 150;
                //       _icon = Icons.arrow_right;
                //     });
                //   }
                // },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  width: sidebarWidth,
                  curve: Curves.easeIn,
                  height: 100,
                  color: _color,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        child: ClipOval(
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 250),
                            width: 20,
                            height: 20,
                            color: Colors.grey,
                            child: Center(child: Icon(_icon)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 20,
                        child: Container(
                          width: 150,
                          height: 50,
                          color: Colors.pinkAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Stack(
              children: elements.map<Widget>((e) {
                return e;
              }).toList(),
            )
          ],
        ),
      ),
    ));
  }

  _spawnObject({Coordinates coordinates, Spawn spawn}) {
    if (spawn == Spawn.left) {
      Coordinates left = Coordinates();
      left.x = coordinates.x + 102.5;
      left.y = coordinates.y;
      return Positioned(
          top: coordinates.y,
          left: coordinates.x - 102.5,
          child: _element(
              color: Colors.greenAccent, coordinate: left, spawn: Spawn.left));
    } else if (spawn == Spawn.right) {
      Coordinates right = Coordinates();
      right.x = coordinates.x + 112.08;
      right.y = coordinates.y;
      return Positioned(
          top: coordinates.y,
          left: coordinates.x + 112.08,
          child: _element(
              color: Colors.blue, coordinate: right, spawn: Spawn.right));
    } else if (spawn == Spawn.top) {
      Coordinates top = Coordinates();
      top.x = coordinates.x;
      top.y = coordinates.y - 89.28;
      return Positioned(
          top: coordinates.y - 89.28,
          left: coordinates.x,
          child:
              _element(color: Colors.grey, coordinate: top, spawn: Spawn.top));
    } else if (spawn == Spawn.bottom) {
      Coordinates bot = Coordinates();
      bot.x = coordinates.x;
      bot.y = coordinates.y + 89.28;
      return Positioned(
          top: coordinates.y + 89.28,
          left: coordinates.x,
          child: _element(
              color: Colors.amber, coordinate: bot, spawn: Spawn.bottom));
    } else {
      return Positioned(
          top: coordinates.y,
          left: coordinates.x,
          child: _element(
              color: Colors.white,
              coordinate: coordinates,
              spawn: Spawn.origin));
    }
  }

  _element(
      {Color color, @required Coordinates coordinate, @required Spawn spawn}) {
    return GestureDetector(
      onTap: () => _add(coordinate, spawn),
      child: Padding(
        padding: EdgeInsets.zero,
        child: ClipOval(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _add(Coordinates origin, Spawn spawn) {
    if (spawn == Spawn.origin) {
      setState(() {
        elements.add(_spawnObject(coordinates: origin, spawn: Spawn.left));
        elements.add(_spawnObject(coordinates: origin, spawn: Spawn.right));
        elements.add(_spawnObject(coordinates: origin, spawn: Spawn.top));
        elements.add(_spawnObject(coordinates: origin, spawn: Spawn.bottom));
      });
    }
  }
}
