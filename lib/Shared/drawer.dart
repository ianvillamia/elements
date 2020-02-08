import 'package:flutter/material.dart';

buildDrawer(){
  return Drawer(
    child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/logo.png',
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("test@gmail.com"),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              //leading: Icon(Icons.photo),
              title: Text("Something 1"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Something 2"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Something 3"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Something 4"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Something 5"),
              onTap: () {},
            ),
          ],
        ),
      );
}