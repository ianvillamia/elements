import 'package:flutter/material.dart';
import './shared/textFormFields.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  textFormField input = new textFormField();
  TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
    Positioned(
          child: Container(
        
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/background.jpg"),fit: BoxFit.cover)),
      ),
    ),
    Positioned
    (
      top: 10,
      child: Container(
        height:500,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[input.buildTextFormField(_emailController,"something",Icons.zoom_out_map )],
          ),
        ),
      ),
    )
        ],
      );
  }
}

void loggingIn(String username, String password) {}
