import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/Controller/API_Calling.dart';
import 'package:task_manager/Styels/BackgroundStyles.dart';
import 'package:task_manager/Styels/Style.dart';
import 'package:task_manager/View/AccountPage/VerifyEmailAddress.dart';
import 'package:task_manager/View/AccountPage/SignUpPage.dart';

import '../../Styels/CustomColor.dart';
import '../../Styels/InputDecoration.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 final TextEditingController _email = TextEditingController();
 final TextEditingController _password = TextEditingController();

 bool loading = false;


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
                key: _formKey,
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
                            controller: _email,
                            cursorWidth: 3,
                            cursorColor: customGreen,
                            decoration: customInputDecoration("Email"),
                            validator: (value){
                              if(value!.length < 6){
                                return "Enter Valid Email";
                              }
                            },

                          ),
                        ),


                        const SizedBox(
                          height: 20.0,
                        ),


                        SizedBox(
                          height: 45.0,
                          child: TextFormField(
                            controller: _password,
                            cursorWidth: 3,
                            cursorColor: customGreen,
                            decoration: customInputDecoration("Password"),
                            validator: (value){
                              if(value!.length < 6){
                                return "Minimum 6 digit password";
                              }
                            },
                          ),
                        ),


                        const SizedBox(
                          height: 20.0,
                        ),

                        SizedBox(
                            width: double.infinity,
                            height: 40.0,
                            child: ElevatedButton(
                              onPressed: ()async{
                                if(_formKey.currentState!.validate()){
                                  loading = true;
                                  setState(() {});
                                 bool response = await LogInAccount(context, _email.text, _password.text);
                                 if(response == true){
                                   loading = false;
                                   setState(() {});
                                 }
                                }
                              },
                              child: loading == false? Icon(Icons.arrow_circle_right_outlined)
                                  : customCirculerPogressIndicatore(),
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
                                  Get.off(const SignUpPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
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
