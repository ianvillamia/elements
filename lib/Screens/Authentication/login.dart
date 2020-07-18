import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/Authentication/signup.dart';
import 'package:mynewapp/Services/auth.dart';
import 'package:mynewapp/Shared/output.dart';
import 'package:mynewapp/Shared/animation.dart';
import 'package:mynewapp/Shared/loading.dart';
import 'package:mynewapp/Global/sizes.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({ this.toggleView });

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field state
  String email = '';
  String password = '';
  String error = '';
  FocusNode fnOne = new FocusNode();
  FocusNode fnTwo = new FocusNode(); 
  bool loading = false;
  bool _isHidden = true;
  bool _enabled = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _toggleEnabled() {
    setState(() {
      _enabled = !_enabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return loading ? Loading() : Scaffold(
      body: FadeAnimation(1,
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 70, 40, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Output().buildShadowText('Welcome,', 40),
                        Text(
                          'Sign in to continue',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        Center(
                          child:Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: Size.height * .08,
                        ),
                        TextFormField(
                          focusNode: fnOne,
                          textInputAction: _enabled ? TextInputAction.next : TextInputAction.done,
                          onFieldSubmitted: (term) {
                            fnOne.unfocus();
                            if (_enabled) {
                              FocusScope.of(context).requestFocus(fnTwo);
                            }
                          },
                          decoration: new InputDecoration(
                            alignLabelWithHint: true,
                            labelStyle: TextStyle(
                              fontSize: fnOne.hasFocus ? 18 : 16.0,//I believe the size difference here is 6.0 to account padding
                              color:fnOne.hasFocus ? Colors.deepPurple[400]: Colors.grey
                            ),
                            labelText: 'Email',
                            filled: true,
                            fillColor: Colors.transparent,
                            enabledBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(14.0),
                              borderSide: new BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(14.0),
                              borderSide: new BorderSide(
                                color: Colors.deepPurple[400],
                              )
                            )
                          ),
                          style: new TextStyle(color: Colors.black),
                
                          validator: (val) => val.isEmpty ? 'Enter your email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: _isHidden,
                          focusNode: fnTwo,
                          enabled: _enabled,
                          decoration: new InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: _toggleVisibility,
                              icon: _isHidden ? Icon(Icons.visibility_off, size: 20, color: Colors.deepPurple[400]) : Icon(Icons.visibility, size: 20, color: Colors.deepPurple[400]),
                            ),
                            alignLabelWithHint: true,
                            labelStyle: TextStyle(
                              fontSize: fnTwo.hasFocus ? 18 : 16.0,//I believe the size difference here is 6.0 to account padding
                              color:fnTwo.hasFocus ? Colors.deepPurple[400]: Colors.grey
                            ),
                            labelText: 'Password',
                            filled: true,
                            fillColor: Colors.transparent,
                            enabledBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(14.0),
                              borderSide: new BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(14.0),
                              borderSide: new BorderSide(
                                color: Colors.deepPurple[400],
                              )
                            )
                          ),
                          style: new TextStyle(color: Colors.black),
                          validator: (val) => val.isEmpty ? 'Enter your password' : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Container(
                            width: Size.width * 1,
                            height: Size.height * .13,
                            padding: EdgeInsets.all(20),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.deepPurple[400],
                              child: Center(
                                child: Text(
                                  'L O G I N',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()){
                                  setState(() => loading = true);
                                  dynamic result = await _auth.signin(email, password);
                                  print(result);
                                  if (result == null) {
                                    setState(() {
                                      error = 'Invalid email or password';
                                      loading = false;
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            horizontalLine(),
                            Text("OR CONNECT WITH", style: TextStyle(color: Colors.grey)),
                            horizontalLine(),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            buildButton('assets/facebook.png', 'Facebook', Color.fromRGBO(24, 119, 242, 1), Colors.white),
                            SizedBox(width: 10),
                            buildButton('assets/google.png', 'Google', Colors.grey[100], Colors.grey),
                          ],
                        ),
                        SizedBox(height: Size.height * .17),
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
                                widget.toggleView();
                              },
                            ),
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
      ),
    );
  }

  horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          width: Size.width * .2,
          height: 1.0,
          color: Colors.black26.withOpacity(.3),
        ),
      );

  buildButton(String loc, String txt, Color color, Color txtColor) {
    return Container(
      height: 45,
      width: Size.width * .35,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), color: color, 
      boxShadow: [
        BoxShadow(
          blurRadius: 2.0,
          color: Colors.grey,
          offset: Offset(1.0, 2.0),
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
          image: AssetImage(
            loc,
          ),
          height: 26.0,
          width: 26.0,
          fit: BoxFit.contain,
        ),
        Text(
          txt,
          style: TextStyle(
            color: txtColor,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        )
        ],
      )
    );
  }
}
