import 'package:flutter/material.dart';
import 'package:mynewapp/Shared/chewie-item.dart';
import 'package:video_player/video_player.dart';

//LECTURE NO. 1
class BuildVideoPlayer1 extends StatefulWidget {
  @override
  _BuildVideoPlayer1State createState() => _BuildVideoPlayer1State();
}

class _BuildVideoPlayer1State extends State<BuildVideoPlayer1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showVideoDialog1(context);
            },
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage("assets/video1.jpg"),
                    fit: BoxFit.fitHeight,
                    colorFilter:
                        ColorFilter.mode(Colors.white24, BlendMode.screen)),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text("5:12", style: TextStyle(fontSize: 15, color: Colors.grey)),
              SizedBox(height: 10),
              Text("01- What is Organic Chemistry?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                                borderRadius: BorderRadius.circular(20.0)),
                            shadows: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset:
                                    Offset(1, 3), // changes position of shadow
                              ),
                            ]),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 50,
                        decoration: ShapeDecoration(
                          color: Colors.grey[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
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
}

void showVideoDialog1(BuildContext context) {
  Dialog dialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 500.0,
      width: 120,
      child: Stack(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(children: <Widget>[
                ChewieItem(
                  videoPlayerController:
                      VideoPlayerController.asset('assets/video.mp4'),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "What is Organic Chemistry?",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Organic chemistry is the study of the structure, properties, composition, reactions, and preparation of carbon-containing compounds, which include not only hydrocarbons but also compounds with any number of other elements, including hydrogen (most compounds contain at least one carbon–hydrogen bond), nitrogen, oxygen, halogens, phosphorus, silicon, and sulfur.",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ))
              ])),
          Align(
            alignment: Alignment(1.05, -1.05),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => dialog);
}

//LECTURE NO. 2
class BuildVideoPlayer2 extends StatefulWidget {
  @override
  _BuildVideoPlayer2State createState() => _BuildVideoPlayer2State();
}

class _BuildVideoPlayer2State extends State<BuildVideoPlayer2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showVideoDialog2(context);
            },
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage("assets/learn.png"), fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text("0:00", style: TextStyle(fontSize: 15, color: Colors.grey)),
              SizedBox(height: 10),
              Text("02 - Title Number 2",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                                borderRadius: BorderRadius.circular(20.0)),
                            shadows: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset:
                                    Offset(1, 3), // changes position of shadow
                              ),
                            ]),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 50,
                        decoration: ShapeDecoration(
                          color: Colors.grey[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
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
}

void showVideoDialog2(BuildContext context) {
  Dialog dialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 500.0,
      width: 120,
      child: Stack(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(children: <Widget>[
                ChewieItem(
                  videoPlayerController:
                      VideoPlayerController.asset('assets/error.mp4'),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Title Number 2",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ))
              ])),
          Align(
            alignment: Alignment(1.05, -1.05),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => dialog);
}

//LECTURE NO. 3
class BuildVideoPlayer3 extends StatefulWidget {
  @override
  _BuildVideoPlayer3State createState() => _BuildVideoPlayer3State();
}

class _BuildVideoPlayer3State extends State<BuildVideoPlayer3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showVideoDialog3(context);
            },
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage("assets/learn.png"), fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text("0:00", style: TextStyle(fontSize: 15, color: Colors.grey)),
              SizedBox(height: 10),
              Text("03 - Title Number 3",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                                borderRadius: BorderRadius.circular(20.0)),
                            shadows: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset:
                                    Offset(1, 3), // changes position of shadow
                              ),
                            ]),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 50,
                        decoration: ShapeDecoration(
                          color: Colors.grey[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
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
}

void showVideoDialog3(BuildContext context) {
  Dialog dialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 500.0,
      width: 120,
      child: Stack(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(children: <Widget>[
                ChewieItem(
                  videoPlayerController:
                      VideoPlayerController.asset('assets/video.mp4'),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "03",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ))
              ])),
          Align(
            alignment: Alignment(1.05, -1.05),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => dialog);
}

//LECTURE NO. 4
class BuildVideoPlayer4 extends StatefulWidget {
  @override
  _BuildVideoPlayer4State createState() => _BuildVideoPlayer4State();
}

class _BuildVideoPlayer4State extends State<BuildVideoPlayer4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showVideoDialog4(context);
            },
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage("assets/learn.png"), fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text("0:00", style: TextStyle(fontSize: 15, color: Colors.grey)),
              SizedBox(height: 10),
              Text("04 - Title Number 4",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                                borderRadius: BorderRadius.circular(20.0)),
                            shadows: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset:
                                    Offset(1, 3), // changes position of shadow
                              ),
                            ]),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 50,
                        decoration: ShapeDecoration(
                          color: Colors.grey[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
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
}

void showVideoDialog4(BuildContext context) {
  Dialog dialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 500.0,
      width: 120,
      child: Stack(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.blue, //1
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(children: <Widget>[
                ChewieItem(
                  videoPlayerController:
                      VideoPlayerController.asset('assets/video.mp4'),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "04",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ))
              ])),
          Align(
            alignment: Alignment(1.05, -1.05),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => dialog);
}
