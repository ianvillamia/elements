import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/authentication/signIn.dart';
import 'package:mynewapp/Strings/rotes.dart';

class FluroRouter {
  static Router router = Router();

  static Handler _signInHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          SignIn());

//-----------------------Routenames----------------------------------------//
  static void setupRouter() {
    router.define(Routes.def,
        handler: _signInHandler, transitionType: TransitionType.fadeIn);
  }
}
