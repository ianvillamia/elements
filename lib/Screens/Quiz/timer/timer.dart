import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Screens/Quiz/quizQuestion.dart';

class Timer extends StatefulWidget {
  Timer({Key key}) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  String data = '3';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        data = '2';
      });
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        data = '1';
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        data = '0';
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuizQuestion()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Data(data)),
    );
  }
}

class Data extends StatelessWidget {
  final String data;
  const Data(this.data);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ElasticIn(
      child: Text(data,
          style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: size.height * .08,
              fontWeight: FontWeight.w700)),
    );
  }
}
