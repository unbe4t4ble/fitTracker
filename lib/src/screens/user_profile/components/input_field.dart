import 'package:flutter/material.dart';

Widget inputField(BuildContext context, TextEditingController controller, String textHint) {
  return TextFormField(
    controller: controller,
    validator: (value) {
      if (value == null) {
        return 'Please enter a valid value';
      }
      return null;
    },
    keyboardType: TextInputType.number,
    textAlign: TextAlign.start,
    maxLines: 1,
    decoration: InputDecoration(
      hintText: textHint,
    ),
    onSaved: (value) {
      // print(value);
    },
  );
}
