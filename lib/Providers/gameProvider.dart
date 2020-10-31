import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/ElementModel.dart';

class GameProvider extends ChangeNotifier {
  ElementModel element;
  var changeController = new StreamController<ElementModel>();
  Stream<ElementModel> get onChange => changeController.stream;
  void doSomething() {
    ElementModel e = ElementModel();
    e.element = '';
    // do the change
    changeController.add(e);
  }

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
