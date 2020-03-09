import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BuildVideoPlayer extends StatefulWidget {
  @override
  _BuildVideoPlayerState createState() => _BuildVideoPlayerState();
}

class _BuildVideoPlayerState extends State<BuildVideoPlayer> {
  VideoPlayerController playerController;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState(){
    playerController = VideoPlayerController.asset("assets/video.mp4");
_initializeVideoPlayerFuture = playerController.initialize();

    // Use the controller to loop the video.
    playerController.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    playerController.dispose();

    super.dispose();
  }
 
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
                  ),
                  
                ],
              ),
            )
          ],
        )
      ],
    ),
  );

    
}
void showSimpleCustomDialog(BuildContext context) {
    Dialog fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 380.0,
        width: 300.0,
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
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: playerController.value.aspectRatio,
                    child: VideoPlayer(playerController),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  // If the video is playing, pause it.
                  if (playerController.value.isPlaying) {
                    playerController.pause();
                  } else {
                    // If the video is paused, play it.
                    playerController.play();
                  }
                });
              },
              child: Icon(playerController.value.isPlaying ? Icons.pause : Icons.play_arrow,),
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "01- What is Organic Chemistry?",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
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
                  playerController.pause();
                },
                child: Container(
                  height: 30,
                  width: 30,
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
}

