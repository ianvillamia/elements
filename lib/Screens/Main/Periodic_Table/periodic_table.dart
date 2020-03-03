import 'package:flutter/material.dart';
import 'package:mynewapp/Global/sizes.dart';
import 'package:flutter/services.dart';

class PeriodicTable extends StatefulWidget {
  PeriodicTable({Key key}) : super(key: key);

  @override
  _PeriodicTableState createState() => _PeriodicTableState();
}

class _PeriodicTableState extends State<PeriodicTable> {
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return Scaffold(
      body: ListView(
      padding: EdgeInsets.all(15),
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: Size.height * 2,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      buildElement(Colors.amber, "H"),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.brown, "He"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildElement(Colors.amber, "Li"),
                      buildElement(Colors.deepOrange, "Be"),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.amber, "B"),
                      buildElement(Colors.deepOrange, "C"),
                      buildElement(Colors.brown, "N"),
                      buildElement(Colors.amber, "O"),
                      buildElement(Colors.deepOrange, "F"),
                      buildElement(Colors.brown, "Ne"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildElement(Colors.amber, "Na"),
                      buildElement(Colors.deepOrange, "Mg"),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.amber, "Al"),
                      buildElement(Colors.deepOrange, "Si"),
                      buildElement(Colors.brown, "P"),
                      buildElement(Colors.amber, "S"),
                      buildElement(Colors.deepOrange, "Cl"),
                      buildElement(Colors.brown, "Ar"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildElement(Colors.amber, "K"),
                      buildElement(Colors.deepOrange, "Ca"),
                      buildElement(Colors.brown, "Sc"),
                      buildElement(Colors.amber, "Ti"),
                      buildElement(Colors.deepOrange, "V"),
                      buildElement(Colors.brown, "Cr"),
                      buildElement(Colors.amber, "Mn"),
                      buildElement(Colors.deepOrange, "Fe"),
                      buildElement(Colors.brown, "Co"),
                      buildElement(Colors.amber, "Ni"),
                      buildElement(Colors.deepOrange, "Cu"),
                      buildElement(Colors.brown, "Zn"),
                      buildElement(Colors.amber, "Ga"),
                      buildElement(Colors.deepOrange, "Ge"),
                      buildElement(Colors.brown, "As"),
                      buildElement(Colors.amber, "Se"),
                      buildElement(Colors.deepOrange, "Br"),
                      buildElement(Colors.brown, "Kr"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildElement(Colors.amber, "Rb"),
                      buildElement(Colors.deepOrange, "Sr"),
                      buildElement(Colors.brown, "Y"),
                      buildElement(Colors.amber, "Zr"),
                      buildElement(Colors.deepOrange, "Nb"),
                      buildElement(Colors.brown, "Mo"),
                      buildElement(Colors.amber, "Tc"),
                      buildElement(Colors.deepOrange, "Ru"),
                      buildElement(Colors.brown, "Rh"),
                      buildElement(Colors.amber, "Pd"),
                      buildElement(Colors.deepOrange, "Ag"),
                      buildElement(Colors.brown, "Cd"),
                      buildElement(Colors.amber, "In"),
                      buildElement(Colors.deepOrange, "Sn"),
                      buildElement(Colors.brown, "Sb"),
                      buildElement(Colors.amber, "Te"),
                      buildElement(Colors.deepOrange, "I"),
                      buildElement(Colors.brown, "Xe"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildElement(Colors.amber, "Cs"),
                      buildElement(Colors.deepOrange, "Ba"),
                      buildElement(Colors.brown, "La"),
                      buildElement(Colors.amber, "Hf"),
                      buildElement(Colors.deepOrange, "Ta"),
                      buildElement(Colors.brown, "W"),
                      buildElement(Colors.amber, "Re"),
                      buildElement(Colors.deepOrange, "Os"),
                      buildElement(Colors.brown, "Ir"),
                      buildElement(Colors.amber, "Pt"),
                      buildElement(Colors.deepOrange, "Au"),
                      buildElement(Colors.brown, "Hg"),
                      buildElement(Colors.amber, "Tl"),
                      buildElement(Colors.deepOrange, "Pb"),
                      buildElement(Colors.brown, "Bi"),
                      buildElement(Colors.amber, "Po"),
                      buildElement(Colors.deepOrange, "At"),
                      buildElement(Colors.brown, "Rn"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildElement(Colors.amber, "Fr"),
                      buildElement(Colors.deepOrange, "Raa"),
                      buildElement(Colors.brown, "Ac"),
                      buildElement(Colors.amber, "Rf"),
                      buildElement(Colors.deepOrange, "Db"),
                      buildElement(Colors.brown, "Sg"),
                      buildElement(Colors.amber, "Bh"),
                      buildElement(Colors.deepOrange, "Hs"),
                      buildElement(Colors.brown, "Mt"),
                      buildElement(Colors.amber, "Ds"),
                      buildElement(Colors.deepOrange, "Rg"),
                      buildElement(Colors.brown, "Cn"),
                      buildElement(Colors.amber, "Nh"),
                      buildElement(Colors.deepOrange, "Fl"),
                      buildElement(Colors.brown, "Mc"),
                      buildElement(Colors.amber, "Lv"),
                      buildElement(Colors.deepOrange, "Ts"),
                      buildElement(Colors.brown, "Og"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.brown, "Ce"),
                      buildElement(Colors.amber, "Pr"),
                      buildElement(Colors.deepOrange, "Nd"),
                      buildElement(Colors.brown, "Pm"),
                      buildElement(Colors.amber, "Sm"),
                      buildElement(Colors.deepOrange, "Eu"),
                      buildElement(Colors.brown, "Gd"),
                      buildElement(Colors.amber, "Tb"),
                      buildElement(Colors.deepOrange, "Dy"),
                      buildElement(Colors.brown, "Ho"),
                      buildElement(Colors.amber, "Er"),
                      buildElement(Colors.deepOrange, "Tm"),
                      buildElement(Colors.brown, "Yb"),
                      buildElement(Colors.amber, "Lu"),
                      buildElement(Colors.transparent, ""),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.transparent, ""),
                      buildElement(Colors.brown, "Th"),
                      buildElement(Colors.amber, "Pa"),
                      buildElement(Colors.deepOrange, "U"),
                      buildElement(Colors.brown, "Np"),
                      buildElement(Colors.amber, "Pu"),
                      buildElement(Colors.deepOrange, "Am"),
                      buildElement(Colors.brown, "Cm"),
                      buildElement(Colors.amber, "Bk"),
                      buildElement(Colors.deepOrange, "Cf"),
                      buildElement(Colors.brown, "Es"),
                      buildElement(Colors.amber, "Fm"),
                      buildElement(Colors.deepOrange, "Md"),
                      buildElement(Colors.brown, "No"),
                      buildElement(Colors.amber, "Lr"),
                      buildElement(Colors.transparent, ""),
                    ],
                  ),
                ]
              )
            )
          )
        ]
      )  
    );
  }

  buildElement(Color color, String text) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        width: Size.width * .13,
        height: Size.height * .20,
        color: color,
        child: Center(
          child: Text(
            text
          ),
        )
      )
    );
  }
}
