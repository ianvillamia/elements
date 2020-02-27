import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynewapp/Game/game.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light
  ));
  runApp(MaterialApp(
    home:Scaffold(//body: Game(),
    body: Game(),
    ),


    debugShowCheckedModeBanner: false,
  ));
}
