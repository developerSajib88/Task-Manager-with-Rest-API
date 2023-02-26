import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/Controller/API_Calling.dart';
import 'package:task_manager/View/AccountPage/UpdateProfile.dart';

import '../../Styels/CustomColor.dart';

Widget CustomAppBar() {
  return Container(
    width: double.infinity,
    height: 100.0,
    alignment: Alignment.centerLeft,
    color: customGreen,
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 30.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.0,
            backgroundColor: Color(0xff0BB161),
            child: CircleAvatar(
              radius: 25.0,
              backgroundColor: customWhite,
              child: Icon(Icons.perm_identity_sharp,color: customGreen,size: 30,)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  width: 200,
                  child: Text(
                    userName!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                ),

                SizedBox(
                  width: 250,
                  child: Text(
                    userEmail!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),

          /*Expanded(
              child: IconButton(
                onPressed: (){
                  Get.to(const UpdateProfile(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                },
                icon: Icon(Icons.edit,size: 20,color: customWhite,),
              ))*/

        ],
      ),
    ),
  );
}
