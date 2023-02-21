import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/Controller/AccountAuthentication.dart';
import 'package:task_manager/Styels/BackgroundStyles.dart';
import 'package:task_manager/Styels/Style.dart';
import 'package:task_manager/View/AccountPage/PinVarificationPage.dart';

import '../../Styels/CustomColor.dart';
import '../../Styels/InputDecoration.dart';
import 'signInView.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  bool Loading = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _resetEmail = TextEditingController();

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
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        controller: _resetEmail,
                        cursorWidth: 3,
                        cursorColor: customGreen,
                        decoration: customInputDecoration("Email"),
                        validator: (value){
                          if(value!.isEmpty || value.length < 10)return "Enter your valid email";
                        },
                      ),
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
                           bool getResponse = await VerifyRecoverEmail(context, _resetEmail.text);
                           if(getResponse == true){
                             Loading = false;
                             setState(() {});
                           }else{
                             Loading = false;
                             setState(() {});
                           }
                         }
                        },
                        child: Loading == false? Icon(Icons.arrow_circle_right_outlined)
                        :customCirculerPogressIndicatore(),
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
