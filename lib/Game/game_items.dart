import 'package:flutter/material.dart';
import 'package:mynewapp/Game/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GameItems {
  pointers(double top, double left) {
    print(top);
    return Stack(
      children: <Widget>[
        //Positioned(top: top, left: left, child: h_pointer()),
        Positioned(child: h_pointer()),

        Positioned(child: v_pointer()),
      ],
    );
  }

  //pointers
  h_pointer() {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(50))),
    );
  }

  v_pointer() {
    return Container(
      height: 150,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(50))),
    );
  }

  blank() {
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
      child: Center(
        child: Text(
          "+",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }

  carbon() {
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      child: Center(
        child: Text(
          "C",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }


  oxygen() {
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.purple),
      child: Center(
        child: Text(
          "O",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
  hydrogen() {
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
      child: Center(
        child: Text(
          "H",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }

 blank_left(db, left, top) async {
    DocumentReference ref = await db
        .collection('elements')
        .add({'left': left -250, 'name': '+', 'top': top});
  }
   blank_right(db, left, top) async {
    DocumentReference ref = await db
        .collection('elements')
        .add({'left': left +250, 'name': '+', 'top': top});
  }
}
