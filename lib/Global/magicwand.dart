import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class MagicWand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: FlareActor(
        "assets/animations/NewFile.flr",
        //animation: "Atom",
        //animation: "Untitled",
        animation: "magic",
        color: Colors.white,
      ),
    );
  }
}
