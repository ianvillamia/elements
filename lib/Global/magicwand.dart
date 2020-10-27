import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:mynewapp/Providers/quizProvider.dart';
import 'package:mynewapp/Screens/Quiz/quizScore.dart';
import 'package:mynewapp/Screens/Quiz/quiz_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

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
  QuizProvider _quizProvider;
  @override
  Widget build(BuildContext context) {
    _quizProvider = Provider.of<QuizProvider>(context, listen: false);
    return SplashScreen.navigate(
      name: 'assets/magicwand.flr',
      next: (context) => _quizScore(),
      startAnimation: 'magic',
      until: () => Future.delayed(Duration(seconds: 2)),
      backgroundColor: Colors.yellowAccent[700],
      loopAnimation: 'magic',
    );
  }

  _quizScore() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('quizTest')
            .orderBy('sequence')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //set length
          _quizProvider.quizLength = snapshot.data.docs.length;
          if (snapshot.hasData) {
            return PageView.builder(
                controller: _quizProvider.controller,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, position) {
                  final document = snapshot.data.docs[position];
                  return QuizScore(doc: document);
                  // return ListTile(
                  //     title: new Text(document['question']),
                  //     subtitle: new Text(document['correctAnswer']));
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
