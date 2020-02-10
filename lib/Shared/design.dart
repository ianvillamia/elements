import 'package:flutter/material.dart';
class Design{
   buildCircle(double w, double h, int r, int g, int b , double o){
    return Container(
                width: w,
                height: h,
                decoration: BoxDecoration(shape: BoxShape.circle,color: Color.fromRGBO(r, g, b, o)),
              );
  }
}