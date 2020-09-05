import 'package:flutter/material.dart';

class LessonsMain extends StatefulWidget {
  LessonsMain({Key key}) : super(key: key);

  @override
  _LessonsMainState createState() => _LessonsMainState();
}

class _LessonsMainState extends State<LessonsMain> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: <Widget>[
              //enter widgets here
              //topbar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.sort),
                    onPressed: () {},
                    splashColor: Colors.blue,
                  ),
                  ClipOval(
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
