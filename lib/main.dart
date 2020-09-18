import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Screens/Lessons/questionItem.dart';
import 'package:mynewapp/Screens/authentication/signIn.dart';
import 'package:mynewapp/Services/routing.dart';
import 'package:mynewapp/Strings/routes.dart';
import 'package:flutter/services.dart';

void main() {
  FluroRouter.setupRouter();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //setup fluro
      onGenerateRoute: FluroRouter.router.generator,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.periodicTable,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: SignIn(),
    );
  }
}
