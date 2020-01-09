import 'package:flutter/material.dart';

class textFormField {

  TextFormField buildTextFormField(
      TextEditingController controller, String text,IconData icon) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration:
          InputDecoration(contentPadding:EdgeInsets.zero,hintText: text),
      validator: (value) {
        value.isEmpty ? 'Should have value' : null;
      },
    );
  }
}
