import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/Styels/BackgroundStyles.dart';
import 'package:task_manager/View/LogInPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Get.offAll(const LogInPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGroundStyles(),
          Center(
            child: Image.asset("assets/images/logo.png",width: 120,height: 50,),
          )
        ],
      )
    );
  }
}
