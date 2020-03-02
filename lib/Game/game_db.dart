Future updateData(db, doc, data) async {
  try {
    await db
        .collection('elements')
        .document(doc.documentID)
        .updateData({'name': data[0]});
  } catch (err) {
    print(err.toString());
  }
}

Future addData(db, left, top, name) async {
  try {
    var doc = await db
        .collection('elements')
        .add({'left': left, 'name': name, 'top': top}).then((doc) async {
      var d2 = await db
          .collection('elements')
          .add({'id':doc.documentID});
    });
  } catch (err) {}
}
