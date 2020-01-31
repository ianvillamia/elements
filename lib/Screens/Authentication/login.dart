import 'package:mynewapp/Global/validators.dart';
import 'package:mynewapp/Screens/Main/Landing/landing.dart';
import 'package:mynewapp/Shared/input.dart';
import '../../Services/auth.dart';
import '../../Shared/animation.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 310,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        right: -120,
                        width: 600,
                        height: 220,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/logo.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 100),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextFormField(
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Enter Email'),
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return 'value must not be empty';
                                          }
                                        })),
                                Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: TextFormField(
                                        controller: _passwordController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Enter Password'),
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return 'value must not be empty';
                                          }
                                        }))
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          2,
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(156, 39, 176, 1),
                                  Color.fromRGBO(224, 198, 241, 1),
                                ])),
                            child: MaterialButton(
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                     bool res = await AuthProvider().signInWithEmail(
                                    _emailController.text,
                                    _passwordController.text);
                                if (!res) {
                                  print("Login failed");
                                }
                                }
                           
                              },
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                        1.5,
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1)),
                          ),
                        ),
                      ),
                      button_rows(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget facebook_google_buttons(Function onTap, AssetImage logo) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
        image: DecorationImage(
          image: logo,
        ),
      ),
    ),
  );
}

Widget button_rows() {
  return FadeAnimation(
    1.3,
    Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          facebook_google_buttons(
            () async {},
            AssetImage(
              'assets/facebook.jpg',
            ),
          ),
          facebook_google_buttons(
            () async {
              bool res = await AuthProvider().loginWithGoogle();
              if (!res) print("error logging in with google");
            },
            AssetImage(
              'assets/google.jpg',
            ),
          ),
        ],
      ),
    ),
  );
}
