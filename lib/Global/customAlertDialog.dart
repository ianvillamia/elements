import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  final Widget content;
  final Widget title;
  CustomAlertDialog({this.title, this.content});

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title,
      content: widget.content,
    );
  }
}
