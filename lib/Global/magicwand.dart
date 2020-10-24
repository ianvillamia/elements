import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:mynewapp/Screens/Quiz/quizScore.dart';
import 'package:mynewapp/Screens/Quiz/quiz_builder.dart';

class MagicWand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 150,
    //   width: 150,
    //   child: FlareActor(
    //     "assets/Loading.flr",
    //     animation: "Untitled",
    //     color: Colors.white,
    //   ),
    // );
  }
}

class MagicWandSplashScreen extends StatefulWidget {
  @override
  _MagicWandSplashScreenState createState() => _MagicWandSplashScreenState();
}

class _MagicWandSplashScreenState extends State<MagicWandSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen.navigate(
      name: 'assets/magicwand.flr',
      next: (context) => QuizScore(),
      startAnimation: 'magic',
      until: () => Future.delayed(Duration(seconds: 3)),
      backgroundColor: Colors.yellowAccent[700],
      loopAnimation: 'magic',
    );
  }
}
