import 'package:flutter/material.dart';
import 'package:mynewapp/Global/sizes.dart';
import 'package:flutter/services.dart';

class PeriodicTable extends StatefulWidget {
  PeriodicTable({Key key}) : super(key: key);

  @override
  _PeriodicTableState createState() => _PeriodicTableState();
}

class _PeriodicTableState extends State<PeriodicTable> {
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return Scaffold(
      body: ListView(
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

  buildElement(Color color, String text, String atom) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        width: Size.width * .13,
        height: Size.height * .20,
        color: color,
        child: Column(
          children: <Widget>[
            Text (
            atom,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
