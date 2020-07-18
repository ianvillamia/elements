import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/Authentication/landing.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

class TestSplash extends StatefulWidget {
  @override
  _TestSplashState createState() => _TestSplashState();
}

class _TestSplashState extends State<TestSplash> {

  bool _isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((_) => setState(() {
          _isLoading = false;
        }));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SplashScreen.navigate(
    name: 'assets/Elementss.flr',
      next: (context) => Wrapper(),
      startAnimation: 'Atom',
      isLoading: _isLoading,
      backgroundColor: Colors.black,
    );
  }
}