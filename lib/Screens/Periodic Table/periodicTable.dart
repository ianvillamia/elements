import 'package:flutter/material.dart';

class PeriodicTable extends StatefulWidget {
  PeriodicTable({Key key}) : super(key: key);

  @override
  _PeriodicTableState createState() => _PeriodicTableState();
}

class _PeriodicTableState extends State<PeriodicTable> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text('Periodic Table of Elements'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800]),
      backgroundColor: Color.fromRGBO(71, 88, 115, 1),
      body: Container(
        height: size.height,
        width: size.width,
        child: ListView(
          padding: EdgeInsets.all(5),
          children: <Widget>[
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        buildElement(
                            Color.fromRGBO(77, 182, 172, 100), "H", "1"),
                        buildElement(Color.fromRGBO(27, 36, 51, 100), "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(
                            Color.fromRGBO(66, 194, 255, 100), "He", "2"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildElement(
                            Color.fromRGBO(252, 123, 83, 100), "Li", "3"),
                        buildElement(
                            Color.fromRGBO(250, 157, 20, 100), "Be", "4"),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "B", "5"),
                        buildElement(
                            Color.fromRGBO(77, 182, 172, 100), "C", "6"),
                        buildElement(
                            Color.fromRGBO(77, 182, 172, 100), "N", "7"),
                        buildElement(
                            Color.fromRGBO(77, 182, 172, 100), "O", "8"),
                        buildElement(
                            Color.fromRGBO(77, 214, 232, 100), "F", "9"),
                        buildElement(
                            Color.fromRGBO(66, 194, 255, 100), "Ne", "10"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildElement(
                            Color.fromRGBO(252, 123, 83, 100), "Na", "11"),
                        buildElement(
                            Color.fromRGBO(250, 157, 20, 100), "Mg", "12"),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(
                            Color.fromRGBO(169, 224, 103, 100), "Al", "13"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Si", "14"),
                        buildElement(
                            Color.fromRGBO(77, 182, 172, 100), "P", "15"),
                        buildElement(
                            Color.fromRGBO(77, 182, 172, 100), "S", "16"),
                        buildElement(
                            Color.fromRGBO(77, 214, 232, 100), "Cl", "17"),
                        buildElement(
                            Color.fromRGBO(66, 194, 255, 100), "Ar", "18"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildElement(
                            Color.fromRGBO(252, 123, 83, 100), "K", "19"),
                        buildElement(
                            Color.fromRGBO(250, 157, 20, 100), "Ca", "20"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Sc", "21"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Ti", "22"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "V", "23"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Cr", "24"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Mn", "25"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Fe", "26"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Co", "27"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Ni", "28"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Cu", "29"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Zn", "30"),
                        buildElement(
                            Color.fromRGBO(169, 224, 103, 100), "Ga", "31"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Ge", "32"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "As", "33"),
                        buildElement(
                            Color.fromRGBO(77, 182, 172, 100), "Se", "34"),
                        buildElement(
                            Color.fromRGBO(77, 214, 232, 100), "Br", "35"),
                        buildElement(
                            Color.fromRGBO(66, 194, 255, 100), "Kr", "36"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildElement(
                            Color.fromRGBO(252, 123, 83, 100), "Rb", "37"),
                        buildElement(
                            Color.fromRGBO(250, 157, 20, 100), "Sr", "38"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Y", "39"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Zr", "40"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Nb", "41"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Mo", "42"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Tc", "43"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Ru", "44"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Rh", "45"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Pd", "46"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Ag", "47"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Cd", "48"),
                        buildElement(
                            Color.fromRGBO(169, 224, 103, 100), "In", "49"),
                        buildElement(
                            Color.fromRGBO(169, 224, 103, 100), "Sn", "50"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Sb", "51"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Te", "52"),
                        buildElement(
                            Color.fromRGBO(77, 214, 232, 100), "I", "53"),
                        buildElement(
                            Color.fromRGBO(66, 194, 255, 100), "Xe", "54"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildElement(
                            Color.fromRGBO(252, 123, 83, 100), "Cs", "55"),
                        buildElement(
                            Color.fromRGBO(250, 157, 20, 100), "Ba", "56"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "La", "57"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Hf", "58"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Ta", "59"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "W", "60"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Re", "61"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Os", "62"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Ir", "63"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Pt", "64"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Au", "65"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Hg", "66"),
                        buildElement(
                            Color.fromRGBO(169, 224, 103, 100), "Tl", "67"),
                        buildElement(
                            Color.fromRGBO(169, 224, 103, 100), "Pb", "68"),
                        buildElement(
                            Color.fromRGBO(169, 224, 103, 100), "Bi", "69"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Po", "70"),
                        buildElement(
                            Color.fromRGBO(77, 214, 232, 100), "At", "71"),
                        buildElement(
                            Color.fromRGBO(66, 194, 255, 100), "Rn", "72"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildElement(
                            Color.fromRGBO(252, 123, 83, 100), "Fr", "73"),
                        buildElement(
                            Color.fromRGBO(250, 157, 20, 100), "Ra", "74"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "Ac", "75"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Rf", "76"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Db", "77"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Sg", "78"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Bh", "79"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Hs", "80"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Mt", "81"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Ds", "82"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Rg", "83"),
                        buildElement(
                            Color.fromRGBO(252, 214, 96, 100), "Cn", "84"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Nh", "85"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Fl", "86"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Mc", "87"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Lv", "88"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Ts", "89"),
                        buildElement(
                            Color.fromRGBO(188, 227, 190, 100), "Og", "90"),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Ce", "91"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Pr", "92"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Nd", "93"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Pm", "94"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Sm", "95"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Eu", "96"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Gd", "97"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Tb", "98"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Dy", "99"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Ho", "100"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Er", "101"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Tm", "102"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Yb", "103"),
                        buildElement(
                            Color.fromRGBO(200, 100, 217, 100), "Lu", "104"),
                        buildElement(Colors.transparent, "", ""),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(Colors.transparent, "", ""),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "Th", "105"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "Pa", "106"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "U", "107"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "Np", "108"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "Pu", "109"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "Am", "110"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "Cm", "111"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "Bk", "112"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "Cf", "113"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "Es", "114"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "Fm", "115"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "Md", "116"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "No", "117"),
                        buildElement(
                            Color.fromRGBO(242, 78, 133, 100), "Lr", "118"),
                        buildElement(
                          Colors.transparent,
                          "",
                          "",
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  buildElement(Color color, String text, String atom) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Container(
        width: size.width * .25,
        height: size.height * .13,
        color: color,
        child: Column(
          children: <Widget>[
            Text(
              atom,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
