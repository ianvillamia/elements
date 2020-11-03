import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Models/Element.dart';
import 'package:mynewapp/Screens/Game/gameItems.dart';

class GameProvider extends ChangeNotifier {
  ElementModel element;
  List elementCollection = [];
  List elementStack = [];
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
    //this should add as a stack
    this.elementCollection.add(element);
    notifyListeners();
  }

  //after end add to stack?
  void drawEverything() {
    for (var stack in elementStack) {
      this.addElement(stack);
    }
  }

  void drawContainer(widget) {
    this.elementCollection.add(widget);
    notifyListeners();
  }

  void addToStack(group) {
    this.elementStack.add(group);
    notifyListeners();
  }
}
