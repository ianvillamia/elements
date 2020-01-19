import 'package:flutter/material.dart';
class Validator{
  validator(String arg){
    if(arg.isEmpty){
      return "Must not be Empty";
    }
    else{
      return null;
    }
  }
}