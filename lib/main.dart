import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/Authentication/landing.dart';


void main() => runApp(MaterialApp(
      //home:Login(),
      // home:SignUp(),
      home: Scaffold(
        body: Landing()
      ),
      //home:LandingPage(),
      debugShowCheckedModeBanner: false,
    ));
