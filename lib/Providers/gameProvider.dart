import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Models/Element.dart';
import 'package:mynewapp/Screens/Game/gameItems.dart';

class GameProvider extends ChangeNotifier {
  ElementModel element;
  List elementCollection = [];
  ElementReader elementReader = ElementReader();
  GameProvider() {
    ElementModel _element = ElementModel();
    _element.element = 'H';
    _element.elementColor = Colors.greenAccent;
    _element.fontColor = Colors.white;
    this.element = _element;
    notifyListeners();
  }

  void changeSelectedElement({@required ElementModel element}) {
    this.element = element;
    print('changed' + this.element.element);
    notifyListeners();
  }

  void addElement(element) {
    this.elementCollection.add(element);
    notifyListeners();
  }
}

class ElementReader {
  bool condition1 = false;
  bool condition2 = false;
  bool condition21 = false;
  bool condition22 = false;
  bool condition3 = false;
  bool condition4 = false;
  bool condition41 = false;
  bool condition42 = false;
  bool condition5 = false;
  bool elementCorrect = false;
  change({double targetElement, String element}) {
    if (targetElement == 1 && element == 'H') {
      print('correct');
      this.condition1 = true;
    } else if (targetElement == 2 && element == 'C') {
      print('correct');
      this.condition2 = true;
    } else if (targetElement == 2.1 && element == 'H') {
      print('correct');
      this.condition21 = true;
    } else if (targetElement == 2.2 && element == 'H') {
      print('correct');
      this.condition22 = true;
    } else if (targetElement == 3 && element == 'O') {
      print('correct');
      this.condition3 = true;
    } else if (targetElement == 4 && element == 'C') {
      print('correct');
      this.condition4 = true;
    } else if (targetElement == 4.1 && element == 'H') {
      print('correct');
      this.condition41 = true;
    } else if (targetElement == 4.2 && element == 'H') {
      print('correct');
      this.condition42 = true;
    } else if (targetElement == 5 && element == 'H') {
      print('correct');
      this.condition5 = true;
    }
  }

  checkIfCorrect() {
    if (condition1 == true &&
        condition2 == true &&
        condition21 == true &&
        condition22 == true &&
        condition3 == true &&
        condition4 == true &&
        condition41 == true &&
        condition42 == true &&
        condition5 == true) {
      print(condition1);
      elementCorrect = true;
    }
  }
}
