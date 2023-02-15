import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomColor.dart';

TextStyle customTitleTextStyle(){
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: titleColor,
      fontWeight: FontWeight.bold,
      fontSize: 25
    )
  );
}


TextStyle customDescriptionTextStyle(){
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          color: customGrey,
          fontWeight: FontWeight.normal,
          fontSize: 11
      )
  );
}


ButtonStyle customButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: customGreen,
);