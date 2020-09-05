import 'package:flutter/material.dart';
import 'package:mynewapp/Utils/textStyles.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: <Widget>[
              //enter widgets here
              //topbar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 30,
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
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .1,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hey Alex',
                        style: CustomTextStyles.customText(),
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Text(
                        'Find a course you want to learn',
                        style: CustomTextStyles.customText(
                            color: Color.fromRGBO(129, 134, 163, 1),
                            size: FontSizes.subHeading),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
