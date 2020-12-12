import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:mynewapp/Screens/authentication/signIn.dart';

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

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen.navigate(
      name: 'assets/Elementss.flr',
      next: (context) => SignIn(),
      startAnimation: 'Atom',
      isLoading: _isLoading,
      backgroundColor: Colors.white,
    );
  }
}
