import 'package:flutter/material.dart';
import 'package:mynewapp/Shared/appbar.dart';
import 'package:mynewapp/Shared/drawer.dart';
import 'package:mynewapp/Shared/bottomNavigation.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: buildDrawer(),
      bottomNavigationBar:buildBottomNavigation(),
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                buildappbar(context,_scaffoldKey),
                Container(
                  child: Text('dito na'),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}