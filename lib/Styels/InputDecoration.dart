import 'package:flutter/material.dart';

import 'CustomColor.dart';

InputDecoration customInputDecoration(String labelText) {
  return InputDecoration(
      filled: true,
      fillColor: customWhite,
      hintText: labelText,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: customWhite)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: customWhite)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: customWhite)));
}
