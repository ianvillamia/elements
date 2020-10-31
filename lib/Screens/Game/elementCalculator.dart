import 'package:flutter/material.dart';

class ElementCalculator extends StatefulWidget {
  ElementCalculator({Key key}) : super(key: key);

  @override
  _ElementCalculatorState createState() => _ElementCalculatorState();
}

class _ElementCalculatorState extends State<ElementCalculator> {
  TextEditingController _formula = TextEditingController();
  List elementsCollection = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .5,
      height: size.height * .25,
      color: Colors.amber,
      child: Row(
        children: [
          Container(
            width: size.width * .25,
            child: TextFormField(
              controller: _formula,
              decoration: InputDecoration(labelText: 'Element'),
            ),
          ),
          MaterialButton(
            onPressed: () => _calculate(),
            child: Text('Calculate'),
          )
        ],
      ),
    );
  }

  _calculate() {
    //todo break string
    //map string to model
    //add to array

    //add children later?

    //breaking string detect dash and numbers
    String element = 'CH3-O-H3';
    int max;
    for (int x = 0; x < element.length; x++) {
      ElementModel e = ElementModel();

      if (element[x] == 'C') {
        e.max = 4;
        max = 4;
        e.data = element[x];
        e.ref = x.toString();
        int current = x;
        elementsCollection.add(e);
        // for (int y = 1; y < 4; y++) {
        //   ElementModel child = ElementModel();

        //   if (element[current] == 'H') {
        //     child.data = 'H';
        //     child.max = 1;
        //     // e.children.add(value);
        //   }
        // }
      }
    }
  }

  RegExp _numeric = RegExp(r'^-?[0-9]+$');
  bool isNumeric(String str) {
    return _numeric.hasMatch(str);
  }
  // if (isNumeric(element[x])) {
  //     print(element[x - 1] + element[x]);
  //   }
}

class ElementModel {
  String ref;
  String data;
  List children;
  int max;
}
