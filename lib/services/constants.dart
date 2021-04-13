import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFFBC42);
const kSecondaryColor = Color(0xFF29335C);
const kbackgroundColor = Color(0xFFFFFAFB);

const kTextFieldDecoration = InputDecoration(
  labelText: 'Digite un valor',
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  filled: true,
  fillColor: Color(0xFFFFFAFB),
  focusColor: kPrimaryColor,
  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
  ),
);
const kTextFieldDisabledDecoration = InputDecoration(
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  filled: true,
  fillColor: Color(0xFFEEEEEE),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
  ),
);

const kTextCardStyle = TextStyle(
  color: kSecondaryColor,
);

const kFloatingIcon = Icon(Icons.settings, size: 20, color: kPrimaryColor);
