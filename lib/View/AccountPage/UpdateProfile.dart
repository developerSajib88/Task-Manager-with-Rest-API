import 'package:flutter/material.dart';
import 'package:task_manager/Styels/BackgroundStyles.dart';
import '../../Styels/CustomColor.dart';

import '../../Styels/InputDecoration.dart';
import '../../Styels/Style.dart';
import 'CustomAppBar.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGroundStyles(),
          Column(
            children: [

              CustomAppBar(),

              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Update Profile",textAlign: TextAlign.start,style: customTitleTextStyle(),),
                        const SizedBox(height: 30.0,),

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

                        const SizedBox(
                          height: 20.0,
                        ),



                        SizedBox(
                          height: 45.0,
                          child: TextFormField(
                            cursorWidth: 3,
                            cursorColor: customGreen,
                            decoration: customInputDecoration("Last Name"),
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
                            decoration: customInputDecoration("Mobile"),
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


                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
