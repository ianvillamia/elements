import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Strings/routes.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Elements++',
                  style: GoogleFonts.indieFlower(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signUp);
                },
                child: Text('SignUp'),
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
