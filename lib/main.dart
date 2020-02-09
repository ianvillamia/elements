import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/Main/Menu/menu.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light
  ));
  runApp(MaterialApp(
    //home:Login(),
    // home:SignUp(),
    home: Scaffold(body: Menu()),
    //home:LandingPage(),
    debugShowCheckedModeBanner: false,
  ));
}
