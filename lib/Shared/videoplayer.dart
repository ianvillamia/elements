import 'package:flutter/material.dart';
import 'package:mynewapp/Shared/chewie-item.dart';
import 'package:video_player/video_player.dart';

class BuildVideoPlayer extends StatefulWidget {
 
  @override
  _BuildVideoPlayerState createState() => _BuildVideoPlayerState();
}

class _BuildVideoPlayerState extends State<BuildVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              showSimpleCustomDialog(context);
            },
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage("assets/learn.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          
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
}

void showSimpleCustomDialog(BuildContext context) {
    Dialog fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 400.0,
        width: 320,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Column(
              children: <Widget>[
                ChewieItem(
                  videoPlayerController: VideoPlayerController.asset('assets/video.mp4'),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Okay let's go!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            Align(
        // These values are based on trial & error method
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
    showDialog(
        context: context, builder: (BuildContext context) => fancyDialog);
 }