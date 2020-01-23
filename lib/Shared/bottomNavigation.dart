import 'package:flutter/material.dart';

 buildBottomNavigation() {
 return  BottomNavigationBar(items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.mail),
      title: Text('Messages'),
    ),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile'))
  ]);
}
