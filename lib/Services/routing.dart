import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/Lessons/course.dart';
import 'package:mynewapp/Screens/Lessons/lessons_home.dart';
import 'package:mynewapp/Screens/Periodic%20Table/detailpage.dart';
import 'package:mynewapp/Screens/Periodic%20Table/periodicTable.dart';
import 'package:mynewapp/Screens/authentication/signIn.dart';
import 'package:mynewapp/Screens/authentication/signUp.dart';
import 'package:mynewapp/Screens/Home/home.dart';
import 'package:mynewapp/Strings/routes.dart';

class FluroRouter {
  static Router router = Router();

  static Handler _signInHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          SignIn());
  static Handler _signUpHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          SignUp());
  static Handler _homeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          Home());
  static Handler _lessonsMainHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          LessonsMain());
  static Handler _periodicTableHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          PeriodicTable());

//-----------------------Routenames----------------------------------------//
  static void setupRouter() {
    router.define(Routes.def,
        handler: _signInHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.signUp,
        handler: _signUpHandler, transitionType: TransitionType.cupertino);
    router.define(Routes.home,
        handler: _homeHandler, transitionType: TransitionType.cupertino);
    router.define(Routes.lessonsMain,
        handler: _lessonsMainHandler, transitionType: TransitionType.cupertino);
    router.define(Routes.periodicTable,
        handler: _periodicTableHandler,
        transitionType: TransitionType.cupertino);
  }
}
