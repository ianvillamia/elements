import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Models/Element.dart';
import 'package:mynewapp/Screens/Game/gameItems.dart';

class GameProvider extends ChangeNotifier {
  ElementModel element;
  List elementCollection = [];
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
