import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';

class GameService {
/* VARIABLES*/
  final db = Firestore.instance;
/* VARIABLES*/
  Stream<QuerySnapshot> getStream() {
    db.collection('elements').snapshots();
  }

  Future addChild(parent, value) async {
    try {
      await db.collection('elements').document(parent).updateData({
        'children': FieldValue.arrayUnion([value])
      });
    } catch (err) {
      print(err.toString());
    }
  }

  Future updateData(doc, data) async {
    var top = doc.data['top'];
    var left = doc.data['left'];
    var parent = doc.data['parent'];
    if (parent != "") {

      var document = await Firestore.instance.document('elements/$parent');
      document.get().then((document) {
        print('NOT NULL');
        var parentTop = document.data['top'];
        var parentLeft = document.data['left'];
     

      if(data[0]=="O"){
           if(top==parentTop&&left==parentLeft){
          //dont render
        }
        else{
          addData(doc, top , left+200, data, "+", doc.documentID);
        }
       
      }
       if(data[0]=="C"){
           if(top==parentTop&&left==parentLeft){
          //dont render
          print('hit');
        }
        else{

          addData(doc, top , left+200, data, "+", doc.documentID);
            addData(doc, top-200 , left, data, "+", doc.documentID);
                   addData(doc, top+200 , left, data, "+", doc.documentID);
        }
       
      }

        //if parentTop,parentLeft == addDatatop,left

        //isert add here
      });
    } else {
      switch (data[0]) {
        case "C":
          addData(doc, top - 200, left, data, "+", doc.documentID);
          addData(doc, top, left + 200, data, "+", doc.documentID);
          addData(doc, top + 200, left, data, "+", doc.documentID);
          addData(doc, top, left - 200, data, "+", doc.documentID);

          break;
        case "H":
          //IDUNNO
          // addData(doc, top - 200, left, data, "+", doc.documentID);
          // addData(doc, top, left + 200, data, "+", doc.documentID);
          // addData(doc, top + 200, left, data, "+", doc.documentID);
          // addData(doc, top, left - 200, data, "+", doc.documentID);
          break;
        case "O":
          //ADD TWO HOLDER
          // addData(doc, top - 200, left, data, "+", doc.documentID);
          // addData(doc, top, left + 200, data, "+", doc.documentID);
          // addData(doc, top + 200, left, data, "+", doc.documentID);
          // addData(doc, top, left - 200, data, "+", doc.documentID);
          break;
      }
    }

    try {
      await db.collection('elements').document(doc.documentID).updateData({
        'value': data[0],
      });
    } catch (err) {
      print(err.toString());
    }
  }

  Future addData(doc, top, left, data, value, parent) async {

    // do check get snapshot then see if top and left matches


    try {
      int max = 0;
      switch (value) {
        case "C":
          max = 4;
          break;

        case "H":
          max = 1;
          break;

        default:
      }
      await db.collection('elements').add({
        'top': top,
        'left': left,
        'value': value,
        'parent': parent,
        'children': "",
        'current': 0,
        'max': max
      }).then((value) async {
        print('welcome child');
        print('documentIDis:::::' + value.documentID);
        addChild(parent, value.documentID);
      });
    } catch (err) {}
  }

  Future reset() async {
    //delete first then add
    await db.collection('elements').getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents) {
        ds.reference.delete();
      }
    });

    print('resetting');
    DocumentReference ref = await db.collection('elements').add({
      'top': 5000,
      'left': 5000,
      'value': '+',
      'parent': '',
      'children': [],
      'current': 0,
      'max': 1
    });
  }
}
