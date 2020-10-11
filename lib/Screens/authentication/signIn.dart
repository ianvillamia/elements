import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Global/spinner.dart';
import 'package:mynewapp/Services/authentication_service.dart';
import 'package:mynewapp/Strings/routes.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
  bool isLoading = false;

  bool _isHidden = true;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return isLoading
        ? Spinner()
        : Scaffold(
            body: Form(
              key: _formKey,
              child: Container(
                color: Colors.white,
                width: size.width,
                height: size.height,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 40, 30, 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Elements++',
                          style: GoogleFonts.indieFlower(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        Text(
                          'Welcome,',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text('Sign in to continue!',
                            style: CustomTextStyles.customText(
                                color: Colors.grey, size: 25, isBold: true)),
                        SizedBox(height: size.height * .05),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8.0),
                              labelText: 'Email'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter your Email' : null,
                        ),
                        SizedBox(height: size.height * .05),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8.0),
                            labelText: 'Password',
                            suffixIcon: IconButton(
                                onPressed: _toggleVisibility,
                                icon: _isHidden
                                    ? Icon(Icons.visibility_off, size: 20)
                                    : Icon(Icons.visibility, size: 20)),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter your password' : null,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Forgot Password?',
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(height: size.height * .05),
                        Center(
                          child: MaterialButton(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            height: size.height * .075,
                            minWidth: size.width * 0.7,
                            //color: Color.fromRGBO(86, 43, 167, 1),

                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Login',
                                style: CustomTextStyles.customText(
                                    size: 27, color: Colors.blue),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                setState(() => isLoading = true);
                                context
                                    .read<AuthenticationService>()
                                    .signIn(
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .catchError((error) {
                                  print(error);
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(height: size.height * .15),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Don't have an account? "),
                              InkWell(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, '/signUp');
                                },
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
}
