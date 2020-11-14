import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Game/elementBuilder.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:nima/nima_actor.dart';

class RotateDevice extends StatefulWidget {
  RotateDevice({Key key}) : super(key: key);

  @override
  _PortraitState createState() => _PortraitState();
}

class _PortraitState extends State<RotateDevice> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: size.width * .8,
              height: size.height * .7,
              child: NimaActor("assets/monkey.nma",
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.contain,
                  animation: "Idle"),
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * .2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Please Rotate Device',
                      style: GoogleFonts.indieFlower(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
