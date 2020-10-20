import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Global/magicwand.dart';
import 'package:mynewapp/Models/Lessons.dart';
import 'package:mynewapp/Screens/Lessons/lesson.dart';

import 'package:mynewapp/Screens/Quiz/timer/timer.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:flare_flutter/flare_actor.dart';

class QuizHome extends StatefulWidget {
  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  Size size;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(child: _topbar()),
            Positioned(top: size.height * .25, child: _body())
          ],
        ),
      ),
    );
  }

  _topbar() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Images.quiz_time), fit: BoxFit.fill)),
      height: size.height * .3,
      width: size.width,
    );
  }

  _body() {
    return Container(
      width: size.width,
      height: size.height * .75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MagicWand(),
          Text('Ready?',
              style: GoogleFonts.openSans(
                  fontSize: size.height * .08, fontWeight: FontWeight.w800)),
          MaterialButton(
            color: Color.fromRGBO(245, 47, 89, 1),
            minWidth: size.width * .8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Timer()));
            },
            child: Text('Start',
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: size.height * .08,
                    fontWeight: FontWeight.w700)),
          ),
          SizedBox(
            height: size.height * .03,
          ),
          Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_circles(), _circles(), _circles()],
              ))
        ],
      ),
    );
  }

  _circles() {
    return Padding(
      padding: EdgeInsets.only(right: 5),
      child: ClipOval(
        child: Container(
          height: 30,
          width: 30,
          color: Colors.grey,
        ),
      ),
    );
  }
}
