import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:mynewapp/Screens/authentication/signIn.dart';
import 'package:mynewapp/main.dart';

class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  bool _isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((_) => setState(() {
          _isLoading = false;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen.navigate(
      name: 'assets/loading.flr',
      next: (context) => AuthenticationWrapper(),
      startAnimation: 'Atom',
      isLoading: _isLoading,
      backgroundColor: Colors.white,
    );
  }
}
