import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Utils/textStyles.dart';
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
                child: Image.network(image),
              );
            } else {
              return Scaffold(
                body: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: size.width,
                    height: size.height,
                    color: Colors.white,
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No element with that name',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.indieFlower(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'press to retry',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.indieFlower(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                ),
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
