import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

class Dialogs {
  void success(context, String text) {
    Alert(
      context: context,
      type: AlertType.success,
      title: text,
      //desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  void fail(context,text) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: text,
      //desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
}
