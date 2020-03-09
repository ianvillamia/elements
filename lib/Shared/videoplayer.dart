import 'package:flutter/material.dart';


buildVideoPlayer() {
  return Container(
    height: 120,
    child: Row(
      children: <Widget>[
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage("assets/learn.png"),
                fit: BoxFit.cover),
          )),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text("5:12",
              style: TextStyle(
                fontSize: 15, color: Colors.grey)),
            SizedBox(height: 10),
            Text("01- What is Organic Chemistry?",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              height: 10,
              width: 160,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      width: 160,
                      decoration: ShapeDecoration(
                        color: Color.fromRGBO(243, 198, 189, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                            BorderRadius.circular(20.0)
                        ),
                        shadows: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(1, 3), // changes position of shadow
                          ),
                        ]
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: 50,
                      decoration: ShapeDecoration(
                        color: Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius:
                            BorderRadius.circular(20.0)
                            ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}