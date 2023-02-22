import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/Controller/API_Calling.dart';
import 'package:task_manager/Styels/BackgroundStyles.dart';
import 'package:task_manager/Styels/Style.dart';
import 'package:task_manager/View/AccountPage/LogInPage.dart';
import 'package:task_manager/View/AccountPage/signInView.dart';

import '../../Styels/CustomColor.dart';
import '../../Styels/InputDecoration.dart';

class SetPasswordPage extends StatefulWidget {

  String getEmail;
  String getOTP;

  SetPasswordPage({Key? key,required this.getEmail, required this.getOTP}) : super(key: key);

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {

  bool Loading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();


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
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: double.infinity,
                        child: Text("Set Password",
                            style: customTitleTextStyle())
                    ),

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
                        controller: password,
                        cursorWidth: 3,
                        cursorColor: customGreen,
                        decoration: customInputDecoration("Password"),
                        validator: (value){
                          if(value!.isEmpty)return "Enter minimum 6 caracter password!";
                        },
                      ),
                    ),


                    const SizedBox(
                      height: 20.0,
                    ),


                    SizedBox(
                      height: 45.0,
                      child: TextFormField(
                        controller: confirmPassword,
                        obscureText: true,
                        cursorWidth: 3,
                        cursorColor: customGreen,
                        decoration: customInputDecoration("Confirm Password"),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter your confirm password!";
                          }else if(value != password.text){
                            return "Confirm Password is Not Match!";
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 20.0,),



                    SizedBox(
                        width: double.infinity,
                        height: 40.0,
                        child: ElevatedButton(
                          onPressed: ()async{
                            if(formKey.currentState!.validate()){
                              Loading = true;
                              setState(() {});
                              bool getResponse = await setPassword(context, widget.getEmail, widget.getOTP, password.text);
                              if(getResponse == true){
                                Loading = false;
                                setState(() {});
                              }

                            }
                          },
                          child: Loading == false? const Text("Confirm")
                          : customCirculerPogressIndicatore(),
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
