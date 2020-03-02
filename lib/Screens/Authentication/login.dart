import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/Authentication/signup.dart';
import 'package:mynewapp/Screens/Main/menu.dart';
import 'package:mynewapp/Services/auth.dart';
import 'package:mynewapp/Shared/output.dart';
import 'package:mynewapp/Shared/animation.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeAnimation(
        1,
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 250.0,
                  child: Center(
                    child: Image.asset('assets/chemistry.png',
                        height: 250, fit: BoxFit.cover),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Output().buildShadowText('Elements++', 30),
                      Text(
                        'Sign in to continue',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Enter your Email',
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Enter your Password',
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 200),
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: 'OpenSans',
                                    fontSize: 14),
                              ),
                            ),
                            GestureDetector(
                              child: InkWell(
                                child: Text(
                                  "Anonymous",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: 'OpenSans',
                                      fontSize: 14),
                                ),
                              ),
                              onTap: () async {
                               dynamic result = await _auth.signInAnon();
                                if (result == null) {
                                  print("Error signing in");
                                } else {
                                  print("Signed in:");
                                  print(result);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          width: 175,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color.fromRGBO(245, 47, 89, 100),
                            child: Center(
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () async {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          horizontalLine(),
                          Text("Or"),
                          horizontalLine(),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          buildButton('assets/facebook.png', Colors.blueAccent),
                          SizedBox(width: 10),
                          buildButton('assets/google.png', Colors.grey[100]),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "New User? ",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          InkWell(
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            onTap: () {
                              print('SignUp');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: 40,
          height: 1.0,
          color: Colors.black26.withOpacity(.3),
        ),
      );

  buildButton(String loc, Color color) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Image.asset(loc),
    );
  }
}
