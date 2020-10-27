import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Providers/quizProvider.dart';
import 'package:mynewapp/Screens/Quiz/quizQuestion.dart';
import 'package:provider/provider.dart';

class QuizBuilder extends StatefulWidget {
  QuizBuilder({Key key}) : super(key: key);

  @override
  _QuizBuilderState createState() => _QuizBuilderState();
}

class _QuizBuilderState extends State<QuizBuilder> {
  @override
  Widget build(BuildContext context) {
    final _quizProvider = Provider.of<QuizProvider>(context, listen: false);
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            width: size.width,
            height: size.height,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('quizTest')
                    .orderBy('sequence')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  //set length

                  if (snapshot.data == null ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasData &&
                      snapshot.data.docs != null &&
                      snapshot.connectionState == ConnectionState.active) {
                    _quizProvider.quizLength = snapshot.data.docs.length;
                    print('length' + snapshot.data.docs.length.toString());
                    return PageView.builder(
                        controller: _quizProvider.controller,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, position) {
                          final document = snapshot.data.docs[position];
                          return QuizQuestion(doc: document);
                          // return ListTile(
                          //     title: new Text(document['question']),
                          //     subtitle: new Text(document['correctAnswer']));
                        });
                  }
                })));
  }
}
