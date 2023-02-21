import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomColor.dart';

InputDecoration customInputDecoration(String labelText) {
  return InputDecoration(
      filled: true,
      fillColor: customWhite,
      hintText: labelText,
      contentPadding: const EdgeInsets.all(10.0),

      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: customGreen,width: 2)),

      errorStyle: const TextStyle(fontSize: 7),
      errorBorder: InputBorder.none,

     border: InputBorder.none,



  );



}
