import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';

class GameService {
/* VARIABLES*/
  final db = Firestore.instance;
/* VARIABLES*/
  Stream<QuerySnapshot> getStream() {
    db.collection('elements').snapshots();
  }

  Future updateData(doc, data) async {
    //do checking before adding
    //print('id is:::->'+doc.documentID);
    // addData(doc, data, "C", doc.documentID);
    var top = doc.data['top'];
    var left = doc.data['left'];
    var parent = doc.data['parent'];
    if (parent != "") {
      var document = await Firestore.instance.document('elements/$parent');
      document.get().then((document) {
        print('NOT NULL');
     print(document.data['value']);
      });
    }
  // else{
      addData(doc,top,left+200, data, "C", doc.documentID);
  //  }

    // try {
    //   await db
    //       .collection('elements')
    //       .document(doc.documentID)
    //       .updateData({'value': data[0],
    //       });
    // } catch (err) {
    //   print(err.toString());
    // }
  }

  Future addData(doc,top,left ,data, value, parent) async {
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
        'left':  left,
        'value': value,
        'parent': parent,
        'children': "",
        'current': 0,
        'max': max
      }).then((value) {
        print(value.documentID);
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
      'children': "",
      'current': 0,
      'max': 1
    });
  }
}
