import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Game/elementBuilder.dart';
import 'package:mynewapp/Game/preludeToGame.dart';
import 'package:mynewapp/Global/magicwand.dart';
import 'package:mynewapp/Screens/Lessons/course.dart';
import 'package:mynewapp/Screens/Lessons/lessonsHome.dart';
import 'package:mynewapp/Screens/LewisStructureCalculator/ocr.dart';
import 'package:mynewapp/Screens/Periodic%20Table/detailpage.dart';
import 'package:mynewapp/Screens/Periodic%20Table/periodicTable.dart';
import 'package:mynewapp/Screens/authentication/signIn.dart';
import 'package:mynewapp/Screens/authentication/signUp.dart';
//import 'package:mynewapp/Screens/Home/home.dart';
import 'package:mynewapp/Strings/routes.dart';
import 'package:mynewapp/parent.dart';

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
          Parent());
  static Handler _lessonsMainHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          LessonsHome());
  static Handler _periodicTableHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          PeriodicTable());

  static Handler _preludeToGameHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          PreludeToGame());
  static Handler _lewisStructureHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          OCR());
  static Handler _quizLoadingHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          MagicWandSplashScreen());

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
    router.define(Routes.lewisstructure,
        handler: _lewisStructureHandler,
        transitionType: TransitionType.cupertino);
    router.define(Routes.preludeToGame,
        handler: _preludeToGameHandler,
        transitionType: TransitionType.cupertino);

    router.define(Routes.quizLoading,
        handler: _quizLoadingHandler, transitionType: TransitionType.cupertino);
  }
}
