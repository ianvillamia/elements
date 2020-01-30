import 'package:mynewapp/Global/validators.dart';
import 'package:mynewapp/Shared/input.dart';

import '../../Shared/animation.dart';
import 'package:flutter/material.dart';
class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  bool _autoValidate= false;

  TextEditingController _password1Controller = TextEditingController(),
  _password2Controller = TextEditingController(),
  _firstNameController=TextEditingController(),
  _lastNameController = TextEditingController(),
  _emailController=TextEditingController()
  ;

  String password1,password2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        autovalidate: _autoValidate,
        key: _formKey,
              child: Container(
          child: SingleChildScrollView(
                    child: Column(
              children: <Widget>[
                Container(
                  height: 310,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'), fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      // Positioned(
                      //   left: 30,
                      //   width: 80,
                      //   height: 200,
                      //   child: FadeAnimation(
                      //       1,
                      //       Container(
                      //         decoration: BoxDecoration(
                      //             image: DecorationImage(
                      //                 image: AssetImage('assets/light-1.png'))),
                      //       )),
                      // ),
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
                      // Positioned(
                      //   right: 40,
                      //   top: 40,
                      //   width: 80,
                      //   height: 150,
                      //   child: FadeAnimation(
                      //       1.5,
                      //       Container(
                      //         decoration: BoxDecoration(
                      //             image: DecorationImage(
                      //                 image: AssetImage('assets/clock.png'))),
                      //       )),
                      // ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 100),
                              child: Center(
                                child: Text(
                                  "Sign-Up",
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
                                          bottom:
                                              BorderSide(color: Colors.grey[100]))),
                                  child: Input().buildTextFormField("First Name",Colors.grey[400], false,Validators().emailValidator(),_firstNameController)
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Input().buildTextFormField("Last Name",Colors.grey[400], false,Validators().emailValidator(),_lastNameController)
                                ),
                                 Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Input().buildTextFormField("Email",Colors.grey[400], false,Validators().emailValidator(),_emailController)
                                ),
                                 Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Input().buildTextFormField("Password",Colors.grey[400], false,Validators().passwordValidator(),_password1Controller)
                                ),
                                 Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Input().buildTextFormField("Confirm Password",Colors.grey[400], false,Validators().passwordValidator(),_password2Controller)
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
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
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            onPressed: (){
                              _validateInputs();
                            },
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      
                          SizedBox(height: 10,),
                      FadeAnimation(
                          1.5,
                          Text(
                            "Forgot Password?",
                            style:
                                TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                          )),
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
  void _validateInputs() async{
    if(_formKey.currentState.validate()){

    }
    else{
      setState(() {
        _autoValidate=true;
      });
    }
  }
}



