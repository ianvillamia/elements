import 'package:flutter/material.dart';

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
            children: <Widget>[
              
              Container(
            height: MediaQuery.of(context).copyWith().size.height/3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/learn.png'), 
                fit: BoxFit.fill
              )
            ),
          ),
          Container(
            color: Color.fromRGBO(243, 198, 189, 1),
            height: MediaQuery.of(context).copyWith().size.height/1.5,
            child: Container(
              width: MediaQuery.of(context).copyWith().size.width,
              decoration: new BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)
                  )
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Organic Chemistry",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ) 
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Become a master at doing stuff",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ) 
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.favorite_border, color: Colors.pink,), onPressed: null),
                        Text (
                          "2.1k"
                        ),
                        SizedBox(width: 10),
                        IconButton(icon: Icon(Icons.comment, color: Colors.black,), onPressed: null),
                        Text (
                          "1.5k"
                        ),
                        SizedBox(width: 10),
                        IconButton(icon: Icon(Icons.share, color: Colors.blue,), onPressed: null),
                        Text (
                          "1k"
                        ),
                        
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
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
                                fit: BoxFit.cover
                              ),
                            )
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Text(
                                "5:12",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey
                                )
                              ),
                              SizedBox(height: 10),
                              Text(
                                "01- What is Organic Chemistry?",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                )
                              ),
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
                                            borderRadius: BorderRadius.circular(20.0)
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
                                            borderRadius: BorderRadius.circular(20.0)
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
                    ),
                  ]
                )
              ),
            ),
          )
          ],)
        ],
      ),
    );
  }
}