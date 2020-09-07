import 'package:flutter/material.dart';

class PeriodicTable extends StatefulWidget {
  PeriodicTable({Key key}) : super(key: key);

  @override
  _PeriodicTableState createState() => _PeriodicTableState();
}

class _PeriodicTableState extends State<PeriodicTable>
    with TickerProviderStateMixin {
  Size size;
  Animation<Matrix4> _animationReset;
  AnimationController _controllerReset;
  final TransformationController _transformationController =
      TransformationController();

  @override
  void dispose() {
    _controllerReset.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controllerReset = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  void _onAnimateReset() {
    _transformationController.value = _animationReset.value;
    if (!_controllerReset.isAnimating) {
      _animationReset?.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset.reset();
    }
  }

  void _animateResetInitialize() {
    _controllerReset.reset();
    _animationReset = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(_controllerReset);
    _animationReset.addListener(_onAnimateReset);
    _controllerReset.forward();
  }

// Stop a running reset to home transform animation.
  void _animateResetStop() {
    _controllerReset.stop();
    _animationReset?.removeListener(_onAnimateReset);
    _animationReset = null;
    _controllerReset.reset();
  }

  void _onInteractionStart(ScaleStartDetails details) {
    // If the user tries to cause a transformation while the reset animation is
    // running, cancel the reset animation.
    if (_controllerReset.status == AnimationStatus.forward) {
      _animateResetStop();
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text('Periodic Table of Elements'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800]),
      backgroundColor: Color.fromRGBO(71, 88, 115, 1),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateResetInitialize,
        tooltip: 'Reset',
        child: Icon(Icons.replay),
        backgroundColor: Colors.purple[800],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: ListView(
          padding: EdgeInsets.all(5),
          children: <Widget>[
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: InteractiveViewer(
                  //onInteractionStart: _onInteractionStart,
                  transformationController: _transformationController,
                  boundaryMargin: EdgeInsets.all(double.infinity),
                  maxScale: 1.0,
                  minScale: 0.2,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          //FIRST ROW
                          children: <Widget>[
                            buildElement(Color.fromRGBO(77, 182, 172, 100), "H",
                                "1", "Hydrogen"),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Color.fromRGBO(66, 194, 255, 100),
                                "He", "2", "Helium"),
                          ],
                        ),
                        Row(
                          //SECOND ROW
                          children: <Widget>[
                            buildElement(Color.fromRGBO(252, 123, 83, 100),
                                "Li", "3", "Lithium"),
                            buildElement(Color.fromRGBO(250, 157, 20, 100),
                                "Be", "4", "Beryllium"),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "B", "5", "Boron"),
                            buildElement(Color.fromRGBO(77, 182, 172, 100), "C",
                                "6", "Carbon"),
                            buildElement(Color.fromRGBO(77, 182, 172, 100), "N",
                                "7", "Nitrogen"),
                            buildElement(Color.fromRGBO(77, 182, 172, 100), "O",
                                "8", "Oxygen"),
                            buildElement(Color.fromRGBO(77, 214, 232, 100), "F",
                                "9", "Fluorine"),
                            buildElement(Color.fromRGBO(66, 194, 255, 100),
                                "Ne", "10", "Neon"),
                          ],
                        ),
                        Row(
                          //THIRD ROW
                          children: <Widget>[
                            buildElement(Color.fromRGBO(252, 123, 83, 100),
                                "Na", "11", "Sodium"),
                            buildElement(Color.fromRGBO(250, 157, 20, 100),
                                "Mg", "12", "Magnesium"),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Color.fromRGBO(169, 224, 103, 100),
                                "Al", "13", "Aluminum"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Si", "14", "Silicon"),
                            buildElement(Color.fromRGBO(77, 182, 172, 100), "P",
                                "15", "Phosphorus"),
                            buildElement(Color.fromRGBO(77, 182, 172, 100), "S",
                                "16", "Sulfur"),
                            buildElement(Color.fromRGBO(77, 214, 232, 100),
                                "Cl", "17", "Chlorine"),
                            buildElement(Color.fromRGBO(66, 194, 255, 100),
                                "Ar", "18", "Argon"),
                          ],
                        ),
                        Row(
                          //FOURTH ROW
                          children: <Widget>[
                            buildElement(Color.fromRGBO(252, 123, 83, 100), "K",
                                "19", "Potassium "),
                            buildElement(Color.fromRGBO(250, 157, 20, 100),
                                "Ca", "20", "Calcium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Sc", "21", "Scandium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Ti", "22", "Titanium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100), "V",
                                "23", "Vanadium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Cr", "24", "Chromium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Mn", "25", "Manganese"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Fe", "26", "Iron"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Co", "27", "Cobalt"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Ni", "28", "Nickel"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Cu", "29", "Copper"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Zn", "30", "zinc"),
                            buildElement(Color.fromRGBO(169, 224, 103, 100),
                                "Ga", "31", "Gallium"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Ge", "32", "Germanium"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "As", "33", "Arsenic"),
                            buildElement(Color.fromRGBO(77, 182, 172, 100),
                                "Se", "34", "Selenium"),
                            buildElement(Color.fromRGBO(77, 214, 232, 100),
                                "Br", "35", "Bromine"),
                            buildElement(Color.fromRGBO(66, 194, 255, 100),
                                "Kr", "36", "Krypton"),
                          ],
                        ),
                        Row(
                          //FIFTH ROW
                          children: <Widget>[
                            buildElement(Color.fromRGBO(252, 123, 83, 100),
                                "Rb", "37", "Rubidium"),
                            buildElement(Color.fromRGBO(250, 157, 20, 100),
                                "Sr", "38", "Stronium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100), "Y",
                                "39", "Yttrium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Zr", "40", "Zirconium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Nb", "41", "Niobium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Mo", "42", "Molybdenum"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Tc", "43", "Technetium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Ru", "44", "Ruthenium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Rh", "45", "Rhodium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Pd", "46", "Paladium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Ag", "47", "Silver"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Cd", "48", "Cadmium"),
                            buildElement(Color.fromRGBO(169, 224, 103, 100),
                                "In", "49", "Indium"),
                            buildElement(Color.fromRGBO(169, 224, 103, 100),
                                "Sn", "50", "Tin"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Sb", "51", "Antimony"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Te", "52", "Tellurium"),
                            buildElement(Color.fromRGBO(77, 214, 232, 100), "I",
                                "53", "Iodine"),
                            buildElement(Color.fromRGBO(66, 194, 255, 100),
                                "Xe", "54", "Xenon"),
                          ],
                        ),
                        Row(
                          //SIXTH ROW
                          children: <Widget>[
                            buildElement(Color.fromRGBO(252, 123, 83, 100),
                                "Cs", "55", "Cesium"),
                            buildElement(Color.fromRGBO(250, 157, 20, 100),
                                "Ba", "56", "Barium"),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Color.fromRGBO(200, 100, 217, 100),
                                "La", "57", "Lanthanum"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Ce", "58", "Cerium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Pr", "59", "Praseodymium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Nd", "60", "Neodymium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Pm", "61", "Promethium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Sm", "62", "Samarium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Eu", "63", "Europium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Gd", "64", "Gadolinium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Tb", "65", "Terbium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Dy", "66", "Dysprosium"),
                            buildElement(Color.fromRGBO(169, 224, 103, 100),
                                "Ho", "67", "Holmium"),
                            buildElement(Color.fromRGBO(169, 224, 103, 100),
                                "Er", "68", "Erbium"),
                            buildElement(Color.fromRGBO(169, 224, 103, 100),
                                "Tm", "69", "Thulium"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Yb", "70", "Ytterbium"),
                            buildElement(Color.fromRGBO(77, 214, 232, 100),
                                "Lu", "71", "Lutetium"),
                          ],
                        ),
                        Row(
                          //SEVENTH ROW
                          children: <Widget>[
                            buildElement(Color.fromRGBO(252, 123, 83, 100),
                                "Fr", "73", ""),
                            buildElement(Color.fromRGBO(250, 157, 20, 100),
                                "Ra", "74", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Rf", "104", "Rutherfordium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Db", "105", "Dubnium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Sg", "106", "Seaborgium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Bh", "107", "Bohrium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Hs", "108", "Hassium"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Mt", "109", "Meitnerium"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Ds", "110", "Darmstadtium"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Rg", "111", "Roentgenium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Cn", "112", "Copernicium"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Nh", "113", "Nihonium"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Fl", "114", "Flevorium"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Mc", "115", "Moscovium"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Lv", "116", "Livermorium"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Ts", "117", "Tennessine"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Og", "118", "Oganesson"),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          //EIGHT ROW
                          children: <Widget>[
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Color.fromRGBO(200, 100, 217, 100),
                                "La", "57", "Lanthanum"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Ce", "58", "Cerium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Pr", "59", "Praseodymium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Nd", "60", "Neodymium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Pm", "61", "Promethium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Sm", "62", "Samarium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Eu", "63", "Europium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Gd", "64", "Gadolinium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Tb", "65", "Terbium"),
                            buildElement(Color.fromRGBO(252, 214, 96, 100),
                                "Dy", "66", "Dysprosium"),
                            buildElement(Color.fromRGBO(169, 224, 103, 100),
                                "Ho", "67", "Holmium"),
                            buildElement(Color.fromRGBO(169, 224, 103, 100),
                                "Er", "68", "Erbium"),
                            buildElement(Color.fromRGBO(169, 224, 103, 100),
                                "Tm", "69", "Thulium"),
                            buildElement(Color.fromRGBO(188, 227, 190, 100),
                                "Yb", "70", "Ytterbium"),
                            buildElement(Color.fromRGBO(77, 214, 232, 100),
                                "Lu", "71", "Lutetium"),
                          ],
                        ),
                        Row(
                          //NINTH ROW END
                          children: <Widget>[
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Colors.transparent, "", "", ""),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "Ac", "89", "Actinium"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "Th", "90", "Thorium"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "Pa", "91", "Proctinium"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100), "U",
                                "92", "Uranium"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "Np", "93", "Neptunim"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "Pu", "94", "Plutonium"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "Am", "95", "Americium"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "Cm", "96", "Curium"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "Bk", "97", "Berkelium"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "Cf", "98", "Californium"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "Es", "99", "Einsteinium"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "Fm", "100", "Fermium"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "Md", "101", "Mendelevium"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "No", "102", "Nobelium"),
                            buildElement(Color.fromRGBO(242, 78, 133, 100),
                                "Lr", "103", "Lawrencium"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  buildElement(Color color, String text, String atom, String name) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: EdgeInsets.all(3),
      child: Container(
        width: orientation == Orientation.landscape
            ? size.width * .14
            : size.width * .25,
        height: orientation == Orientation.landscape
            ? size.height * .23
            : size.height * .13,
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              atom,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
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
