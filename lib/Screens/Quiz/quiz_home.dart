import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Screens/Quiz/quiz_list.dart';

class QuizHome extends StatefulWidget {
  QuizHome({Key key}) : super(key: key);

  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //enter widgets here
            Text(
              'Select Difficulty',
              style: GoogleFonts.indieFlower(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * .1,
            ),
            _buildButton(text: 'Easy', color: Colors.greenAccent),
            _buildButton(text: 'Medium', color: Colors.yellowAccent),
            _buildButton(text: 'Hard', color: Colors.redAccent),
          ],
        ),
      ),
    );
  }

  _buildButton({@required String text, @required Color color}) {
    return MaterialButton(
      onPressed: () {
        //navigator push populate list bla bla
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return QuizList(quizLevel: text);
        }));
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      color: color,
      minWidth: size.width * .4,
      child: Text(
        text,
        style:
            GoogleFonts.indieFlower(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
