import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowStructure extends StatefulWidget {
  final String condensed;
  ShowStructure({this.condensed});

  @override
  _ShowStructureState createState() => _ShowStructureState();
}

class _ShowStructureState extends State<ShowStructure> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder<String>(
        future: getImage(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            //show image here
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future getImage() async {
    var getImage = await FirebaseFirestore.instance
        .collection('users')
        .where('element', isEqualTo: widget.condensed)
        .get();
    if (getImage.docs.length > 0) {
      //has
      getImage.docs.forEach((element) {
        print(element.data()['image']);
        print('works');
      });
    } else {
      //no element with that name
      //show proper widget
    }
  }
}
