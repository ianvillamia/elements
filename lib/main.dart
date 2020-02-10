import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynewapp/Screens/Main/Learning_Module/learning_module.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light
  ));
  runApp(MaterialApp(
    //home:Login(),
    // home:SignUp(),
    home: Scaffold(body: LearningModule()),
    //home:LandingPage(),
    debugShowCheckedModeBanner: false,
  ));
}
