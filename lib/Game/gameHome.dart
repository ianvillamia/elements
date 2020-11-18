import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Game/elementBuilder.dart';
import 'package:mynewapp/Game/elements/Ethoxyethane.dart';
import 'package:mynewapp/Game/elements/Methoxymethane.dart';
import 'package:mynewapp/Game/elements/Propanone.dart';
import 'package:mynewapp/Game/elements/Propoxybutane.dart';

class GameHome extends StatefulWidget {
  GameHome({Key key}) : super(key: key);

  @override
  _GameHomeState createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Pick an Element',
                style: GoogleFonts.indieFlower(
                    fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Wrap(
                children: [
                  ElementCard(
                    elementName: 'Methoxymethane',
                    element: Methoxymethane(),
                  ),
                  ElementCard(
                    elementName: 'Ethoxyethane',
                    element: Ethoxyethane(),
                  ),
                  ElementCard(
                    elementName: 'Propoxybutane',
                    element: Propoxybutane(),
                  ),
                  ElementCard(
                    elementName: 'Propanone',
                    element: Propanone(),
                  ),
                  // ElementCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ElementCard extends StatefulWidget {
  final Widget element;
  final String elementName;
  ElementCard({@required this.element, @required this.elementName});

  @override
  _ElementCardState createState() => _ElementCardState();
}

class _ElementCardState extends State<ElementCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Game(
                  element: widget.element,
                ),
              ));
        },
        child: Container(
          width: 300,
          height: 100,
          child: Center(
              child: Text(
            widget.elementName.toString(),
            style: GoogleFonts.indieFlower(
                fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
