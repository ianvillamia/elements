import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './splash.dart';
import './toggle.dart';
import './login.dart';
class LoginCheck extends StatelessWidget {
  const LoginCheck({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context,AsyncSnapshot<FirebaseUser> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
          return SplashPage();
        if(!snapshot.hasData || snapshot.data == null)
          return Login();
        return HomePage();
      },
    );
  }
}