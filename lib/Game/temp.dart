import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Game/game_items.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Game extends StatefulWidget {
  Game({Key key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final db = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(children: <Widget>[
      Container(
          height: height * .8,
          width: width,
          color: Colors.greenAccent,
          child: Zoom(
            backgroundColor: Colors.orange,
            width: 10000,
            height: 10000,
            initZoom: 0.0,
            child: StreamBuilder<QuerySnapshot>(
              stream: db.collection('elements').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Stack(
                      children: snapshot.data.documents
                          .map((doc) => prefab(doc))
                          .toList());
                }
                return Container();
              },
            ),
          )),
      Container(
        height: height * .20,
        width: width,
        decoration: BoxDecoration(border: Border.all(), color: Colors.blue),
        child: Stack(children: <Widget>[
          dragItem("C", 5, 30, Colors.redAccent),
          dragItem("H", 5, 100, Colors.amber),
        
          Positioned(
              right: 15,
              child: MaterialButton(
                onPressed: () async{
                  db.collection('elements').getDocuments().then((snapshot){
                    for(DocumentSnapshot ds in snapshot.documents){
                      ds.reference.delete();
                    }
                  });
                   DocumentReference ref = await db.collection('elements').add({'left': 5000, 'name': '+','top':5000});
                },
                color: Colors.orangeAccent,
                child: Text('Reset'),
              ))
        ]),
      ),
    ]);
  }

  Widget prefab(DocumentSnapshot doc) {
    var id = doc.documentID;
    double top = doc.data['top'].toDouble();
    double left = doc.data['left'].toDouble();
    var name = doc.data['name'];
    if (name == "+") {
      return Positioned(
          top: top,
          left: left,
          child: DragTarget(
            onWillAccept: (data) {
              print(data);
              
           //   print("data = $data onWillAccept");
            return true;
            },
            onAccept: (List data) async {
              print(data);
              // print(" onAccept");
              // setState(() {});
              // await db
              //     .collection('elements')
              //     .document(doc.documentID)
              //     .updateData({'name': data});
            },
            
            onLeave: (data) {
              print("data = $data onLeave");
            },
            builder: (context, candidateData, rejectedData) {
              return GameItems().blank();
            },
          ));
    }
    if (name == "C") {
      return Positioned(
          top: top,
          left: left,
          child: DragTarget(
            onWillAccept: (String data) {
              print("data = $data onWillAccept");
              return true;
            },
            onAccept: (data) async {
              print(" onAccept");
              setState(() {});

              await db
                  .collection('elements')
                  .document(doc.documentID)
                  .updateData({'name': data});
              print('added');
              if (data == "H") {
                // var query = db.collection('elements').where('name','==',"H");
              }
              GameItems().blank_left(db, left, top);
              GameItems().blank_right(db, left, top);
            },
            onLeave: (data) {
              print("data = $data onLeave");
            },
            builder: (context, candidateData, rejectedData) {
              return GameItems().carbon();
            },
          ));
    }
    if (name == "H") {
      return Positioned(
          top: top,
          left: left,
          child: DragTarget(
            onWillAccept: (String data) {
              print("data = $data onWillAccept");
              return true;
            },
            onAccept: (data) async {
              print(" onAccept");
              await db
                  .collection('elements')
                  .document(doc.documentID)
                  .updateData({'name': data});
              // isVisible = true;
              //  targetText = "data";
            },
            onLeave: (data) {
              print("data = $data onLeave");
            },
            builder: (context, candidateData, rejectedData) {
              return GameItems().hydrogen();
            },
          ));
    }
    return Container();
  }
  //prefab          

  Widget dragItem(String element, double top, double left, Color color) {
    return Positioned(
      top: top,
      left: left,
      child: Draggable(
        //DATA
        data: [element,color],
        child: Container(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          width: 150,
          height: 50,
          child: Center(
            child: Text(element,
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 20.0)),
          ),
        ),

        feedback: Container(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          width: 100,
          height: 100,
          child: Center(
            child: Text(element,
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 20.0)),
          ),
        ),
        childWhenDragging: Container(),
        //data: "123"
      ),
    );
  }

  //database

}
