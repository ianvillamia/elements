import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Element.dart';

class GameProvider extends ChangeNotifier {
  ElementModel element;
  GameProvider() {
    ElementModel _element = ElementModel();
    _element.element = 'H';
    _element.elementColor = Colors.red;
    _element.fontColor = Colors.white;
    this.element = _element;
    notifyListeners();
  }

  void changeSelectedElement({@required ElementModel element}) {
    this.element = element;
    print('changed' + this.element.element);
    notifyListeners();
  }
}
