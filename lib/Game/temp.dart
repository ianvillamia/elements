// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:mynewapp/Game/game_db.dart';
// import 'package:mynewapp/Game/game_items.dart';
// import 'package:zoom_widget/zoom_widget.dart';

// class Game extends StatefulWidget {
//   Game({Key key}) : super(key: key);

//   @override
//   _GameState createState() => _GameState();
// }

// class _GameState extends State<Game> {
//   final db = Firestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;

//     return Column(children: <Widget>[
//       Container(
//           height: height * .8,
//           width: width,
//           color: Colors.greenAccent,
//           child: Zoom(
//             backgroundColor: Colors.orange,
//             width: 10000,
//             height: 10000,
//             initZoom: 0.0,
//             child: StreamBuilder<QuerySnapshot>(
//               stream: db.collection('elements').snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return Stack(
//                       children: snapshot.data.documents
//                           .map((doc) => prefab(doc))
//                           .toList());
//                 }
//                 return Container();
//               },
//             ),
//           )),
//       Container(
//         height: height * .20,
//         width: width,
//         decoration: BoxDecoration(border: Border.all(), color: Colors.blue),
//         child: Stack(children: <Widget>[
//           dragItem("C", 5, 30, Colors.redAccent),
//           dragItem("H", 5, 100, Colors.amber),
//           dragItem("O", 5, 170, Colors.purple),
//           //deleters buttoners
//           Positioned(
//               right: 15,
//               child: MaterialButton(
//                 onPressed: () async {
//                   db.collection('elements').getDocuments().then((snapshot) {
//                     for (DocumentSnapshot ds in snapshot.documents) {
//                       ds.reference.delete();
//                     }
//                   });
//                   DocumentReference ref = await db
//                       .collection('elements')
//                       .add({'left': 5000, 'name': '+', 'top': 5000});
//                 },
//                 color: Colors.orangeAccent,
//                 child: Text('Reset'),
//               ))
//         ]),
//       ),
//     ]);
//   }

//   Widget prefab(DocumentSnapshot doc) {
//     var id = doc.documentID;
//     double top = doc.data['top'].toDouble();
//     double left = doc.data['left'].toDouble();
//     var name = doc.data['name'];
//     //get parent 
      

//     if (name == "+") {
//       return Positioned(
//           top: top,
//           left: left,
//           child: DragTarget(
//             onWillAccept: (List data) {
//               print(id);
//               return true;
//             },
//             onAccept: (List data) async {
//               print(data);

//               print(" onAccept");
//               setState(() {});
//               updateData(db, doc, data);
//               if (data[0] == "C") {
//                 addData(db, left, top - 150, "+");
//                 addData(db, left - 150, top, "+");
//                 addData(db, left + 150, top, "+");
//                 addData(db, left, top + 150, "+");
//               }
//             },
//             onLeave: (data) {
//               print("data = $data onLeave");
//             },
//             builder: (context, candidateData, rejectedData) {
//               return GameItems().blank();
//             },
//           ));
//     }
//     if (name == "C") {
//       return Positioned(
//           top: top,
//           left: left,
//           child: DragTarget(
//             onWillAccept: (List data) {
//               print(id);
//               return true;
//             },
//             onAccept: (List data) async {
//               print(data);
//               print(" onAccept");
//               //setState(() {});
//               updateData(db, doc, data);
//             },
//             onLeave: (data) {
//               print("data = $data onLeave");
//             },
//             builder: (context, candidateData, rejectedData) {
//               return GameItems().carbon();
//             },
//           ));
//     }
//     if (name == "H") {
//       return Positioned(
//           top: top,
//           left: left,
//           child: DragTarget(
//             onWillAccept: (List data) {
//               print(id);
//               return true;
//             },
//             onAccept: (List data) async {
//               print(data);
//               print(" onAccept");
//               //setState(() {});
//               updateData(db, doc, data);
//             },
//             onLeave: (data) {
//               print("data = $data onLeave");
//             },
//             builder: (context, candidateData, rejectedData) {
//               return GameItems().hydrogen();
//             },
//           ));
//     }
//      if (name == "O") {
//       return Positioned(
//           top: top,
//           left: left,
//           child: DragTarget(
//             onWillAccept: (List data) {
//               print(id);
//               return true;
//             },
//             onAccept: (List data) async {
//               print(data);
//               print(" onAccept");
//               //setState(() {});
//               updateData(db, doc, data);
//             },
//             onLeave: (data) {
//               print("data = $data onLeave");
//             },
//             builder: (context, candidateData, rejectedData) {
//               return GameItems().hydrogen();
//             },
//           ));
//     }

//     return Container();
//   }

//   Widget dragItem(String element, double top, double left, Color color) {
//     return Positioned(
//       top: top,
//       left: left,
//       child: Draggable(
//         //DATA
//         data: [element, color],
//         child: Container(
//           decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//           width: 150,
//           height: 50,
//           child: Center(
//             child: Text(element,
//                 style: TextStyle(
//                     color: Colors.white,
//                     decoration: TextDecoration.none,
//                     fontSize: 20.0)),
//           ),
//         ),

//         feedback: Container(
//           decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//           width: 100,
//           height: 100,
//           child: Center(
//             child: Text(element,
//                 style: TextStyle(
//                     color: Colors.white,
//                     decoration: TextDecoration.none,
//                     fontSize: 20.0)),
//           ),
//         ),
//         childWhenDragging: Container(),
//         //data: "123"
//       ),
//     );
//   }

//   //database

// }
