import 'package:flutter/material.dart';
import 'package:mynewapp/Services/auth.dart';

buildDrawer() {
  return Drawer(
      child: ListView(
    children: <Widget>[
      DrawerHeader(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //image
            
            //name
            Text("Emma Watson"),
            //email
            Text("emmaWatson@gmail.com")
          ],
        ),
        decoration: BoxDecoration(color: Colors.redAccent),
      ),
      ListTile(
          title: Container(
        alignment: Alignment.topLeft,
        height: 100,
        color: Colors.redAccent,
        child: Column(
          children: <Widget>[],
        ),
      )),
      ListTile(
        title: Text("Item 2"),
        trailing: Icon(Icons.arrow_forward),
      ),
      ListTile(
          title: MaterialButton(
        color: Colors.redAccent,
        onPressed: () async{
          await AuthService().signOut();
        },
        child: Text('data'),
      ))
    ],
  ));
}
