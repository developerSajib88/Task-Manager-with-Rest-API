import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/Controller/API_Calling.dart';
import 'package:task_manager/Styels/BackgroundStyles.dart';
import 'package:task_manager/Styels/CustomColor.dart';
import 'package:task_manager/Styels/Style.dart';

import 'SetPasswordPage.dart';
import 'signInView.dart';

class PinVarificationPage extends StatefulWidget {
   PinVarificationPage({Key? key,required this.getEmail}) : super(key: key);

  String getEmail;

  @override
  State<PinVarificationPage> createState() => _PinVarificationPageState();
}

class _PinVarificationPageState extends State<PinVarificationPage> {

  late String currentText;
  bool Loading = false;


  TextEditingController textEditingController = TextEditingController();



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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Text("PIN Varification",style: customTitleTextStyle(),),
                    ),
                    
                    Text(
                        "A 6 digit verification pin will send to your"
                        "email address",
                      style: customDescriptionTextStyle(),
                    ),


                    const SizedBox(
                      height: 20.0,
                    ),



                    //PIN Code Fileds Widget Start from here=======================================================

                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                        disabledColor: customWhite,
                        inactiveColor: customGreen,
                        inactiveFillColor: customWhite,
                        selectedColor: customGreen,

                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.blue.shade50,
                      enableActiveFill: true,
                      //errorAnimationController: errorController,
                      controller: textEditingController,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                      validator: (value){
                        if(value!.length < 6)return "Enter your 6 digit PIN";
                      },
                    ),

                    //PIN Code fields end here====================================================



                    const SizedBox(
                      height: 20.0,
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: ()async{
                            if(textEditingController.text.length == 6){
                              Loading = true;
                              setState(() {});
                             bool getResponse = await PinVerificationRequest(context, widget.getEmail, textEditingController.text);
                             if(getResponse == true){
                               Loading = false;
                               setState(() {});
                             }
                            }
                          },
                          child: Loading == false? const Text("Verify")
                          :customCirculerPogressIndicatore(),
                        style: customButtonStyle,
                      ),
                    ),

                    const SizedBox(height: 20.0,),

                    signInView(),


                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
