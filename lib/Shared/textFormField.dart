import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.only(left: 8),
);

class PasswordDecoration extends StatefulWidget {
  final String pass;
  const PasswordDecoration ({ Key key, this.pass }): super(key: key);
  @override
  _PasswordDecorationState createState() => _PasswordDecorationState();
}

class _PasswordDecorationState extends State<PasswordDecoration> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isHidden,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 16),
        hintText: widget.pass,
        suffixIcon: IconButton(
          onPressed: _toggleVisibility,
          icon: _isHidden ? Icon(Icons.visibility_off, size: 20) : Icon(Icons.visibility, size: 20),
        ),
      )
    );
  }
}