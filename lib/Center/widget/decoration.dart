import 'package:flutter/material.dart';


InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.purple.shade200),
      focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple.shade200)),
      enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple.shade200)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.purple.shade200, fontSize: 16);
}