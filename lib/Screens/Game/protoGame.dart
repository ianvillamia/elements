import 'package:flutter/material.dart';

class ProtoGame extends StatefulWidget {
  ProtoGame({Key key}) : super(key: key);

  @override
  _ProtoGameState createState() => _ProtoGameState();
}

class _ProtoGameState extends State<ProtoGame> {
  Size size;
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
    print(size.width);
    print(size.width * .46);
    print(size.width * .5);
    return Expanded(
        child: Container(
      color: Colors.red,
      child: Stack(
        children: [
          // Align(
          //   alignment: Alignment.center,
          //   child: _element(),
          // ),

          //origin
          Positioned(
              top: size.height * .367,
              left: size.width * .3,
              child: _element(color: Colors.white)),
          //right
          Positioned(
              top: size.height * .367,
              left: size.width * .464,
              child: _element(color: Colors.blue)),
          //top
          Positioned(
              top: size.height * .15,
              left: size.width * .3,
              child: _element(color: Colors.grey)),
          //left
          Positioned(
              top: size.height * .367,
              left: size.width * .15,
              child: _element(color: Colors.greenAccent)),
          //bottom
          Positioned(
              top: size.height * .6,
              left: size.width * .3,
              child: _element(color: Colors.amber)),

          // Positioned(
          //     top: size.height * .367,
          //     left: size.width * .6,
          //     child: _element(color: Colors.white)),
        ],
      ),
    ));
  }

  _element({Color color}) {
    return Padding(
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
    );
  }
}
