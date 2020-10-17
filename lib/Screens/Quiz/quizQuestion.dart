import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mynewapp/Screens/Quiz/timer/timer.dart';
import 'package:mynewapp/Strings/images.dart';

enum SingingCharacter { lafayette, jefferson }

class QuizQuestion extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuizQuestion> {
  Size size;
  String selected;
  SingingCharacter _character = SingingCharacter.lafayette;
  int group = 1;
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
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * .15,
          ),
          Text('What are HydroCarbons?',
              style: GoogleFonts.openSans(
                  fontSize: 30, fontWeight: FontWeight.bold)),
          Container(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _listTile(text: 'dada', val: 1),
                _listTile(text: 'dada', val: 2),
                _listTile(text: 'dada', val: 3)
              ],
            ),
          )
        ],
      ),
    );
  }

  _listTile({String text, int val}) {
    return ListTile(
      title: Text(text),
      leading: Radio(
        value: val,
        groupValue: group,
        onChanged: (i) {
          setState(() {
            selected = text;
            group = i;
          });
        },
      ),
    );
  }
}
