import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '';

class ShowStructure extends StatefulWidget {
  final String condensed;
  ShowStructure({this.condensed});

  @override
  _ShowStructureState createState() => _ShowStructureState();
}

class _ShowStructureState extends State<ShowStructure> {
  String image = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder<QuerySnapshot>(
        future: getImage(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            //show image here
            var image = '';
            if (snapshot.data.docs.length > 0) {
              snapshot.data.docs.forEach((element) {
                image = element.data()['image'];
              });
              return Container(
                width: size.width,
                height: size.height,
                color: Colors.white,
                child: CachedNetworkImage(
                  imageUrl: image,
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              );
            } else {
              return Container(
                width: size.width,
                height: size.height,
                color: Colors.white,
                child: Text('No element with that name'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<QuerySnapshot> getImage() async {
    print(widget.condensed);
    var getImage = await FirebaseFirestore.instance
        .collection('structures')
        .where('element', isEqualTo: widget.condensed)
        .get();
    return getImage;
  }
}
