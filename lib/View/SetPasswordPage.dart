import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/Styels/BackgroundStyles.dart';
import 'package:task_manager/Styels/Style.dart';
import 'package:task_manager/View/LogInPage.dart';
import 'package:task_manager/View/signInView.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Styels/CustomColor.dart';
import '../Styels/InputDecoration.dart';

class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage({Key? key}) : super(key: key);

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGroundStyles(),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: double.infinity,
                      child: Text("Set Password",
                          style: customTitleTextStyle())),

                  Text(
                    "Minimum length password 8 character with"
                    "Latter and number combination ",
                    style: customDescriptionTextStyle(),
                  ),


                  const SizedBox(
                    height: 30.0,
                  ),


                  SizedBox(
                    height: 45.0,
                    child: TextFormField(
                      cursorWidth: 3,
                      cursorColor: customGreen,
                      decoration: customInputDecoration("Password"),
                    ),
                  ),


                  const SizedBox(
                    height: 20.0,
                  ),


                  SizedBox(
                    height: 45.0,
                    child: TextFormField(
                      cursorWidth: 3,
                      cursorColor: customGreen,
                      decoration: customInputDecoration("Confirm Password"),
                    ),
                  ),

                  const SizedBox(height: 20.0,),



                  SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: () {

                          Get.offAll(const LogInPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));

                        },
                        child: const Text("Confirm"),
                        style: customButtonStyle,
                      )),

                  const SizedBox(
                    height: 20.0,
                  ),
                  signInView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
