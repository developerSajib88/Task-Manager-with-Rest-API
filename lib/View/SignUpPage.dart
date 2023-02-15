import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/Styels/BackgroundStyles.dart';
import 'package:task_manager/Styels/Style.dart';
import 'package:task_manager/View/signInView.dart';

import '../Styels/CustomColor.dart';
import '../Styels/InputDecoration.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGroundStyles(),
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: double.infinity,
                        child: Text("Join With Us",
                            style: customTitleTextStyle())),


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
                        decoration: customInputDecoration("First Name"),
                      ),
                    ),

                    const SizedBox(height: 20.0,),


                    SizedBox(
                      height: 45.0,
                      child: TextFormField(
                        cursorWidth: 3,
                        cursorColor: customGreen,
                        decoration: customInputDecoration("Last Name"),
                      ),
                    ),

                    const SizedBox(height: 20.0,),



                    SizedBox(
                      height: 45.0,
                      child: TextFormField(
                        cursorWidth: 3,
                        cursorColor: customGreen,
                        decoration: customInputDecoration("Mobile"),
                      ),
                    ),

                    const SizedBox(height: 20.0,),


                    SizedBox(
                      height: 45.0,
                      child: TextFormField(
                        cursorWidth: 3,
                        cursorColor: customGreen,
                        decoration: customInputDecoration("Password"),
                      ),
                    ),

                    const SizedBox(height: 20.0,),




                    SizedBox(
                        width: double.infinity,
                        height: 40.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Icon(Icons.arrow_circle_right_outlined),
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
          ),
        ],
      ),
    );
  }
}
