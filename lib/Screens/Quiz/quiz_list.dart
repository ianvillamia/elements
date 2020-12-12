import 'package:basic_utils/basic_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynewapp/Providers/quizProvider.dart';
import 'package:mynewapp/Screens/Quiz/quizQuestion.dart';
import 'package:mynewapp/Screens/Quiz/quiz_builder.dart';
import 'package:mynewapp/Screens/Quiz/quiz_title.dart';
import 'package:provider/provider.dart';

class QuizList extends StatefulWidget {
  final String quizLevel;
  QuizList({@required this.quizLevel});

  @override
  _QuizListState createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final _quizProvider = Provider.of<QuizProvider>(context, listen: false);
    final firebaseUser = context.watch<User>();
    print(firebaseUser.uid);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(firebaseUser.uid)
                  .collection('quizzes')
                  .where('level', isEqualTo: widget.quizLevel)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.data == null ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasData &&
                    snapshot.data.docs != null &&
                    snapshot.connectionState == ConnectionState.active) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * .2,
                          vertical: size.height * .1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: snapshot.data.docs.map<Widget>((doc) {
                          if (doc.data()['isTaken']) {
                            return Text('taken');
                          } else {
                            return Card(
                              elevation: 5,
                              child: InkWell(
                                onTap: () {
                                  //set selected quiz
                                  //wipe
                                  _quizProvider.selectCurrentQuiz(doc: doc);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                    return QuizTitle();
                                  }));
                                },
                                child: Container(
                                  width: size.width * .5,
                                  height: size.height * .1,
                                  child: Center(
                                      child: Text(
                                    StringUtils.capitalize(doc.data()['title']),
                                    style: TextStyle(fontSize: 20),
                                  )),
                                ),
                              ),
                            );
                          }
                        }).toList(),
                      ),
                    ),
                  );
                } else {
                  return Text('No quiz with that level');
                }
              })),
    );
  }
}
