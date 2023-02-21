import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:task_manager/Styels/CustomToast.dart';
import 'package:task_manager/View/AccountPage/LogInPage.dart';
import 'package:task_manager/View/AccountPage/PinVarificationPage.dart';
import 'package:task_manager/View/AccountPage/SetPasswordPage.dart';
import 'package:task_manager/View/HomePage.dart';



  String baseUrl = "https://task.teamrabbil.com/api/v1";
  var requestHeader  = {'Content-Type': 'application/json; charset=UTF-8',};

//This method for User Authentication
  Future<bool> LogInAccount(BuildContext context,String email,password)async{
    Uri requestUri = Uri.parse("${baseUrl}/login");
    http.Response response = await http.post(
      requestUri,
      headers: requestHeader,
      body: jsonEncode({
        "email":email,
        "password":password,
      }),
    );

    Map<String,dynamic> getMap = jsonDecode(response.body);

    if(response.statusCode == 200 && getMap["status"] == "success"){
      Get.off(const HomePage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
      successToast(context, "Sign In Successfull");
      return true;
    }else{
      failedToast(context, "${getMap["status"]}!");
      return true;
    }

  }


//User registration method======================================================
  Future<bool> createAccount(
      BuildContext context,
      String email,firstName,lastName,mobile,password
      )async{

    final Uri requestUri = Uri.parse("${baseUrl}/registration");

    http.Response response = await http.post(
        requestUri,
        headers: requestHeader,
        body: jsonEncode(
            {
              "email":email,
              "firstName":firstName,
              "lastName":lastName,
              "mobile":mobile,
              "password":password,
              "photo":""
            }
        )
    );

    if(response.statusCode == 200){
      Get.off(const LogInPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
      successToast(context, "Congratulation! Your account is Successfull");
      return true;
    }else{
      failedToast(context, "Your account create is faile! try again");
      return true;

    }


  }


  //Email Varification for Password change
  Future<bool> VerifyRecoverEmail(BuildContext context,String email)async{

    final Uri requestUri = Uri.parse("${baseUrl}/RecoverVerifyEmail/$email");
    http.Response response = await http.get(requestUri);

    Map<String,dynamic> getMap = jsonDecode(response.body);

    if(response.statusCode == 200 && getMap["status"] == "success"){
      Get.to(PinVarificationPage(getEmail: email,),transition: Transition.cupertino, duration: const Duration(milliseconds: 500));
      return true;
    }else{
      failedToast(context, "${getMap["data"]}. Try! Again",);
      return true;
    }


  }



  Future<bool> PinVerificationRequest(BuildContext context, String email, getOTP)async{
    Uri requestUri = Uri.parse("${baseUrl}/RecoverVerifyOTP/${email}/${getOTP}");
    http.Response response = await http.get(requestUri);
    
    Map<String,dynamic> getMap = jsonDecode(response.body);
    
    if(response.statusCode == 200 && getMap["status"] == "success"){
      Get.to(SetPasswordPage(getEmail: email,getOTP: getOTP,),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
      return true;
    }else{
      failedToast(context, "${getMap["data"]}");
      return true;
    }
  }
  
  
  
  //Reset Password mehtod
Future<bool> setPassword(BuildContext context, String email,OTP,password)async{
    Uri requestUri = Uri.parse("${baseUrl}//RecoverResetPass");
    http.Response response = await http.post(
      requestUri,
      headers: requestHeader,
      body: jsonEncode({
        "email": email,
        "OTP" : OTP,
        "password": password
      }),

    );

    Map<String,dynamic> getMap = jsonDecode(response.body);

    if(response.statusCode == 200 && getMap["status"] == "success"){
      Get.offAll(const LogInPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
      successToast(context, "Your password reset is success");
      return true;
    }else{
      failedToast(context, "${getMap["data"]}");
      return true;
    }

}




