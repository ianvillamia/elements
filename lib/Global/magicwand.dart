import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Providers/quizProvider.dart';
import 'package:mynewapp/Screens/Quiz/quizScore.dart';
import 'package:mynewapp/Screens/Quiz/quiz_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class MagicWandSplashScreen extends StatefulWidget {
  @override
  _MagicWandSplashScreenState createState() => _MagicWandSplashScreenState();
}

class _MagicWandSplashScreenState extends State<MagicWandSplashScreen> {
  QuizProvider _quizProvider;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _quizProvider = Provider.of<QuizProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SplashScreen.navigate(
              name: 'assets/bb.flr',
              next: (context) => _quizScore(),
              startAnimation: 'active',
              until: () => Future.delayed(Duration(seconds: 5)),
              backgroundColor: Color.fromRGBO(10, 10, 58, 1),
              loopAnimation: 'magic',
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Loading',
                style: GoogleFonts.indieFlower(
                    color: Colors.white,
                    fontSize: size.height * .1,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  _quizScore() {
    return QuizScore();
  }
}
