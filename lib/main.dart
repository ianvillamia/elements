import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynewapp/Game/game.dart';
import 'package:mynewapp/Game/grid.dart';
import 'package:mynewapp/Screens/Authentication/landing.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light
  ));
  runApp(MaterialApp(
    home:Scaffold(body: Drag2TargetPage(),),


    debugShowCheckedModeBanner: false,
  ));
}
