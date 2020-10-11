import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner extends StatefulWidget {
  Spinner({Key key}) : super(key: key);

  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(212, 81, 0, 1),
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 200.0,
        ),
      ),
    );
  }
}
