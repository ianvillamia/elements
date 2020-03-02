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

Future addData(db,left,top,name) async {
  try {
  await db
        .collection('elements')
        .add({'left': left, 'name': name, 'top': top});
  } catch (err) {}
}
