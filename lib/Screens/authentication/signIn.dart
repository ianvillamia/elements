import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  bool isLoading = false;
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  Size size;
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    size = MediaQuery.of(context).size;
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
                        greetings(),
                        SizedBox(height: size.height * .05),
                        emailField(),
                        SizedBox(height: size.height * .05),
                        passwordField(),
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
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim())
                                    .then((value) {
                                  setState(() => isLoading = false);
                                  print(value);
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/', (Route<dynamic> route) => false);
                                }).catchError((error) {
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

  greetings() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Elements++',
        style:
            GoogleFonts.indieFlower(fontSize: 50, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: size.height * .05,
      ),
      Text(
        'Welcome,',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      Text(
        'Sign in to continue!',
        style: CustomTextStyles.customText(
            color: Colors.grey, size: 25, isBold: true),
      )
    ]);
  }

  emailField() {
    return TextFormField(
        controller: emailController,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        decoration: InputDecoration(
            hintText: 'abcd@gmail.com',
            contentPadding: const EdgeInsets.all(8.0),
            labelText: 'Email'),
        validator: (val) {
          if (val.length == 0)
            return "Please enter your email";
          else if (!val.contains("@"))
            return "Please enter valid email";
          else
            return null;
        });
  }

  passwordField() {
    return TextFormField(
        controller: passwordController,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
        obscureText: _isHidden,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8.0),
          labelText: 'Password',
          suffixIcon: IconButton(
              onPressed: _toggleVisibility,
              icon: _isHidden
                  ? Icon(Icons.visibility_off, size: 20)
                  : Icon(Icons.visibility, size: 20)),
        ));
  }
}
