import 'package:flutter/material.dart';
import 'package:mynewapp/Global/sizes.dart';

class PeriodicTable extends StatefulWidget {
  PeriodicTable({Key key}) : super(key: key);

  @override
  _PeriodicTableState createState() => _PeriodicTableState();
}

class _PeriodicTableState extends State<PeriodicTable> {
  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
          children: <Widget>[
            Row(
      children: <Widget>[
        buildElement(Colors.amber),
        buildElement(Colors.deepOrange),
        buildElement(Colors.brown),
        buildElement(Colors.amber),
        buildElement(Colors.deepOrange),
        buildElement(Colors.brown),
        buildElement(Colors.amber),
        buildElement(Colors.deepOrange),
        buildElement(Colors.brown),
        buildElement(Colors.amber),
        buildElement(Colors.deepOrange),
        buildElement(Colors.brown),buildElement(Colors.amber),
        buildElement(Colors.deepOrange),
        buildElement(Colors.brown),
        
      ],
            ),
            Row(
      children: <Widget>[
        buildElement(Colors.deepPurple),
        buildElement(Colors.deepOrange)
      ],
            ),
          ],
        ),
    ));
  }

  buildElement(Color color) {
    return Container(
      width: Size.height * .112,
      height: Size.width * .0556,
      color: color,
    );
  }
}
