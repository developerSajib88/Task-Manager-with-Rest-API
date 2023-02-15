import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/Styels/BackgroundStyles.dart';
import 'package:task_manager/Styels/Style.dart';
import 'package:task_manager/View/PinVarificationPage.dart';
import 'package:task_manager/View/SetPasswordPage.dart';
import 'package:task_manager/View/signInView.dart';

import '../Styels/CustomColor.dart';
import '../Styels/InputDecoration.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
                      child: Text("Your Email Address",style: customTitleTextStyle())),
                  Text("A 6 digit verification pin will send to your email address",style: customDescriptionTextStyle(),),

                  const SizedBox(height: 30.0,),


                  SizedBox(
                    height: 45.0,
                    child: TextFormField(
                      cursorWidth: 3,
                      cursorColor: customGreen,
                      decoration: customInputDecoration("Email"),
                    ),
                  ),

                  const SizedBox(height: 20.0,),

                  SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: () {
                         Get.to(const PinVarificationPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                        },
                        child: const Icon(Icons.arrow_circle_right_outlined),
                        style: customButtonStyle,
                      )),

                  const SizedBox(height:20.0,),

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
