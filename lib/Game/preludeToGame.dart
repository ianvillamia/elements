import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Game/gameHome.dart';
import 'package:nima/nima_actor.dart';

class PreludeToGame extends StatefulWidget {
  PreludeToGame({Key key}) : super(key: key);

  @override
  _PreludeToGameState createState() => _PreludeToGameState();
}

class _PreludeToGameState extends State<PreludeToGame> {
  String _animation = "space";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: size.width * .05, right: size.width * .05),
            child: NimaActor("assets/dino.nma",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "Idle"),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * .18,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Elements++',
                      style: GoogleFonts.indieFlower(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: size.height * .1),
                child: Container(
                    height: size.height * .1,
                    width: size.width * .4,
                    child: MaterialButton(
                      elevation: 5,
                      color: Colors.amber,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GameHome(),
                            ));
                      },
                      child: Text('Proceed to Game',
                          style: TextStyle(
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.bold)),
                    )),
              ))
        ],
      ),
    ));
  }
}
