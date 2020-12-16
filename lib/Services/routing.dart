import 'package:fluro/fluro.dart' as fluro;
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
  static fluro.Router router = fluro.Router();

  static fluro.Handler _signInHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          SignIn());
  static fluro.Handler _signUpHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          SignUp());
  static fluro.Handler _homeHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          Parent());
  static fluro.Handler _lessonsMainHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          LessonsHome());
  static fluro.Handler _periodicTableHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          PeriodicTable());

  static fluro.Handler _preludeToGameHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          PreludeToGame());
  static fluro.Handler _lewisStructureHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          OCR());
  static fluro.Handler _quizLoadingHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          MagicWandSplashScreen());

//-----------------------Routenames----------------------------------------//
  static void setupRouter() {
    router.define(Routes.def,
        handler: _signInHandler, transitionType: fluro.TransitionType.fadeIn);
    router.define(Routes.signIn,
        handler: _signInHandler, transitionType: fluro.TransitionType.fadeIn);
    router.define(Routes.signUp,
        handler: _signUpHandler,
        transitionType: fluro.TransitionType.cupertino);
    router.define(Routes.home,
        handler: _homeHandler, transitionType: fluro.TransitionType.cupertino);
    router.define(Routes.lessonsMain,
        handler: _lessonsMainHandler,
        transitionType: fluro.TransitionType.cupertino);
    router.define(Routes.periodicTable,
        handler: _periodicTableHandler,
        transitionType: fluro.TransitionType.cupertino);
    router.define(Routes.lewisstructure,
        handler: _lewisStructureHandler,
        transitionType: fluro.TransitionType.cupertino);
    router.define(Routes.preludeToGame,
        handler: _preludeToGameHandler,
        transitionType: fluro.TransitionType.cupertino);

    router.define(Routes.quizLoading,
        handler: _quizLoadingHandler,
        transitionType: fluro.TransitionType.cupertino);
  }
}
