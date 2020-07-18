import 'package:flutter/material.dart';

class Output {
  buildShadowText(String text,double size){
    return Text(
                text,
                textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    // shadows: [
                    //   Shadow(
                    //       blurRadius: 3.0,
                    //       color: Colors.grey,
                    //       offset: Offset(2.0, 5.0),
                    //       ),
                    // ],
                  ),
                );
}}