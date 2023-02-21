import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
              backgroundImage: NetworkImage(
                "https://www.befunky.com/images/wp/wp-2021-01-linkedin-profile-picture-focus-face.jpg?auto=avif,webp&format=jpg&width=944",
              ),
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
                    "Hellary Klinton",
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
                    "klington@gmail.com",
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

          Expanded(
              child: IconButton(
                onPressed: (){
                  Get.to(const UpdateProfile(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                },
                icon: Icon(Icons.edit,size: 20,color: customWhite,),
              ))

        ],
      ),
    ),
  );
}
