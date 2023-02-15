import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/Styels/CustomColor.dart';

import '../ItemView.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({Key? key}) : super(key: key);

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10.0,),
          Row(
            children: [

              const SizedBox(width: 10,),

              Expanded(
                child: Container(
                  height: 50.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: customWhite,
                    borderRadius: BorderRadius.circular(3.0),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(top: 7,left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("09",style: GoogleFonts.poppins(fontSize: 15,color: customBlack,fontWeight: FontWeight.bold),),
                        Text("New Task",style: GoogleFonts.poppins(fontSize: 10,color: customGrey,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),

                ),
              ),
              const SizedBox(width: 5.0,),


              Expanded(
                child: Container(
                  height: 50.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: customWhite,
                    borderRadius: BorderRadius.circular(3.0),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(top: 7,left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("09",style: GoogleFonts.poppins(fontSize: 15,color: customBlack,fontWeight: FontWeight.bold),),
                        Text("Completed",style: GoogleFonts.poppins(fontSize: 10,color: customGrey,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),

                ),
              ),
              const SizedBox(width: 5.0,),


              Expanded(
                child: Container(
                  height: 50.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: customWhite,
                    borderRadius: BorderRadius.circular(3.0),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(top: 7,left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("09",style: GoogleFonts.poppins(fontSize: 15,color: customBlack,fontWeight: FontWeight.bold),),
                        Text("Cancel",style: GoogleFonts.poppins(fontSize: 10,color: customGrey,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),

                ),
              ),
              const SizedBox(width: 5.0,),


              Expanded(
                child: Container(
                  height: 50.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: customWhite,
                    borderRadius: BorderRadius.circular(3.0),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(top: 7,left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("09",style: GoogleFonts.poppins(fontSize: 15,color: customBlack,fontWeight: FontWeight.bold),),
                        Text("Progress",style: GoogleFonts.poppins(fontSize: 10,color: customGrey,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),

                ),
              ),
              const SizedBox(width: 10.0,),



            ],
          ),

          const SizedBox(height: 10.0,),

          Expanded(
              child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.zero,
                itemBuilder: (context,index){
                  return ItemView(
                      customBlue,
                      "Lorem Ipsum is simply dummy",
                      "It is a long established fact that a reader will be distracted by the readable content"
                          "of a page when looking at its layout.",
                      "Date: 12-12-2001",
                      "New",
                       index
                  );
                },
              )
          )


        ],
      ),
    );
  }
}
