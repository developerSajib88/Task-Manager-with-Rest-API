import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/View/AccountPage/LogInPage.dart';

import '../../Styels/CustomColor.dart';


Widget signInView() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Have account ?",
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12),
      ),

      TextButton(
          onPressed: () {
            Get.to(const LogInPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
          },
          child: Text(
            "Sign In",
            style: GoogleFonts.poppins(
                color: customGreen, fontSize: 12, fontWeight: FontWeight.bold),
          ))
    ],
  );
}
