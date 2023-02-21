import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/Styels/CustomColor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/View/CreateTaskPage.dart';
import 'package:task_manager/View/NavigationView/CancelPage.dart';
import 'package:task_manager/View/NavigationView/CompletedPage.dart';
import 'package:task_manager/View/NavigationView/NewTaskPage.dart';
import 'package:task_manager/View/NavigationView/ProgressPage.dart';

import 'AccountPage/CustomAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List NavigationPage = const[NewTaskPage(), CompletedPage(), CancelPage(), ProgressPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customWhite,

      floatingActionButton: Visibility(
        visible: currentIndex == 0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 70.0,),
          child: FloatingActionButton(
            onPressed: (){
              Get.to(const CreateTaskPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
            },
            backgroundColor: customGreen,
            child:const Icon(Icons.add,size: 30.0,),
          ),
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            CustomAppBar(),

            Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: NavigationPage[currentIndex],
                )
            ),

            Container(
              width: double.infinity,
              height: 60.0,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.2,
                    blurRadius: 5.0
                  )
                ]
              ),
              child: Row(
                children: [


                  Expanded(
                      child: InkWell(
                    onTap: () {
                      currentIndex = 0;
                      setState(() {});
                    },
                    child: Container(
                      color: currentIndex == 0 ? customGreen : customWhite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset(
                              "assets/icons/document_ic.png",
                              width: 30.0,
                              height: 30.0,
                              color:
                                  currentIndex == 0 ? customWhite : customBlack,
                            ),
                          ),


                          Text(
                            "New Task",
                            style: GoogleFonts.poppins(
                                textStyle:  TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: currentIndex == 0
                                        ? Colors.white
                                        : customBlack)),
                          )
                        ],
                      ),
                    ),
                  )),

                  Expanded(
                      child: InkWell(
                        onTap: () {
                          currentIndex = 1;
                          setState(() {});
                        },
                        child: Container(
                          color: currentIndex == 1 ? customGreen : customWhite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Image.asset(
                                  "assets/icons/document_ic.png",
                                  width: 30.0,
                                  height: 30.0,
                                  color:
                                  currentIndex == 1 ? customWhite : customBlack,
                                ),
                              ),


                              Text(
                                "Completed",
                                style: GoogleFonts.poppins(
                                    textStyle:  TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: currentIndex == 1
                                            ? Colors.white
                                            : customBlack)),
                              )
                            ],
                          ),
                        ),
                      )),


                  Expanded(
                      child: InkWell(
                        onTap: () {
                          currentIndex = 2;
                          setState(() {});
                        },
                        child: Container(
                          color: currentIndex == 2 ? customGreen : customWhite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Image.asset(
                                  "assets/icons/document_ic.png",
                                  width: 30.0,
                                  height: 30.0,
                                  color:
                                  currentIndex == 2 ? customWhite : customBlack,
                                ),
                              ),


                              Text(
                                "Cancel",
                                style: GoogleFonts.poppins(
                                    textStyle:  TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: currentIndex == 2
                                            ? Colors.white
                                            : customBlack)),
                              )
                            ],
                          ),
                        ),
                      )),

                  Expanded(
                      child: InkWell(
                        onTap: () {
                          currentIndex = 3;
                          setState(() {});
                        },
                        child: Container(
                          color: currentIndex == 3 ? customGreen : customWhite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Image.asset(
                                  "assets/icons/document_ic.png",
                                  width: 30.0,
                                  height: 30.0,
                                  color:
                                  currentIndex == 3 ? customWhite : customBlack,
                                ),
                              ),


                              Text(
                                "Progress",
                                style: GoogleFonts.poppins(
                                    textStyle:  TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: currentIndex == 3
                                            ? Colors.white
                                            : customBlack)),
                              )
                            ],
                          ),
                        ),
                      )),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
