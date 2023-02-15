import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/Styels/BackgroundStyles.dart';
import 'package:task_manager/Styels/Style.dart';
import 'package:task_manager/View/ResetPasswordPage.dart';
import 'package:task_manager/View/SignUpPage.dart';

import '../Styels/CustomColor.dart';
import '../Styels/InputDecoration.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGroundStyles(),
          SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: double.infinity,
                            child: Text("Get Started With",style: customTitleTextStyle())),



                        const SizedBox(
                          height: 30.0,
                        ),


                        SizedBox(
                          height: 45.0,
                          child: TextFormField(
                            cursorWidth: 3,
                            cursorColor: customGreen,
                            decoration: customInputDecoration("Email"),
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
                            decoration: customInputDecoration("Password"),
                          ),
                        ),


                        const SizedBox(
                          height: 20.0,
                        ),

                        SizedBox(
                            width: double.infinity,
                            height: 40.0,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Icon(Icons.arrow_circle_right_outlined),
                              style: customButtonStyle,
                            )),

                        const SizedBox(
                          height: 50.0,
                        ),


                        TextButton(
                          onPressed: () {
                            Get.to(const ResetPasswordPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                          },
                          child: Text("Forget Password ?",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 11),
                                  color: customGrey)),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have account ?",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 12),),

                            const SizedBox(width: 5.0,),

                            InkWell(
                                onTap: () {
                                  Get.to(const SignUpPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.poppins(
                                      color: customGreen,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
