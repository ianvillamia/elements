import 'package:flutter/material.dart';
class Design{
   buildCircle(double w, double h){
    return Container(
                width: w,
                height: h,
                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey.withOpacity(.5)),
              );
  }
}