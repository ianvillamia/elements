import 'package:flutter/material.dart';

class Output {
  buildShadowText(String text){
    return Text(
                text,
                textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    shadows: [
                      Shadow(
                          blurRadius: 3.0,
                          color: Colors.grey,
                          offset: Offset(2.0, 5.0),
                          ),
                    ],
                  ),
                );
}}