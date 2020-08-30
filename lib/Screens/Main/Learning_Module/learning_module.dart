import 'package:flutter/material.dart';
import 'package:mynewapp/Shared/videoplayer.dart';
import 'package:video_player/video_player.dart';

class LearningModule extends StatefulWidget {
  LearningModule({Key key}) : super(key: key);

  @override
  _LearningModuleState createState() => _LearningModuleState();
}

class _LearningModuleState extends State<LearningModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).copyWith().size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/learn.png'),
                        fit: BoxFit.fill)),
              ),
              Container(
                color: Color.fromRGBO(243, 198, 189, 1), // ETO YUNG PINK BG
                height: MediaQuery.of(context).copyWith().size.height / 1.5,
                child: Container(
                  //ETO YUNG WHITE BG
                  width: MediaQuery.of(context).copyWith().size.width,
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0))),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text("Organic Chemistry",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Become a master at doing stuff",
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.pink,
                                ),
                                onPressed: null),
                            Text("2.1k"),
                            SizedBox(width: 10),
                            IconButton(
                                icon: Icon(
                                  Icons.comment,
                                  color: Colors.black,
                                ),
                                onPressed: null),
                            Text("1.5k"),
                            SizedBox(width: 10),
                            IconButton(
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.blue,
                                ),
                                onPressed: null),
                            Text("1k"),
                          ],
                        ),
                        Container(
                            height:
                                MediaQuery.of(context).copyWith().size.height /
                                    2.3,
                            child: ListView(
                                padding: EdgeInsets.all(15),
                                children: <Widget>[
                                  SingleChildScrollView(
                                    child: Container(
                                        height: 600,
                                        child: Column(children: <Widget>[
                                          BuildVideoPlayer1(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          BuildVideoPlayer2(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          BuildVideoPlayer3(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          BuildVideoPlayer4(),
                                        ])),
                                  ),
                                ]))
                        //buildVideoPlayer(),
                      ])),
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            left: 20,
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.pink[300]),
                width: 50,
                height: 50,
                child: Icon(Icons.arrow_back_ios),
              ),
              onTap: () {
                print('Login');
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
