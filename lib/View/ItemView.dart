import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/Controller/API_Calling.dart';
import 'package:task_manager/Styels/CustomColor.dart';
import 'package:task_manager/Widgets/ModelBottomSheet.dart';

Widget ItemView(
    BuildContext context,
    Color getColor,
    String title,
    String desCription,
    String date,
    String currentState,
    String getID
    ){
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0,left: 15.0,right: 15.0),
    child: Container(
      width: double.infinity,
      height: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: customWhite,
      ),

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: customBlack,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              desCription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  fontSize: 10, color: customGrey, fontWeight: FontWeight.normal),
            ),

            Text(
              date,
              style: GoogleFonts.poppins(
                  fontSize: 10, color: customBlack, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5.0,),

            Row(
              children: [


                Container(
                  height: 17.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: getColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                    child: Text(
                      currentState,
                      style: GoogleFonts.poppins(
                          fontSize: 10, color: customWhite, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

              ],
            ),

            Row(
              children: [

                Expanded(child: Container()),

                SizedBox(
                  width: 15.0,
                  height: 15.0,
                  child: InkWell(
                      onTap: (){
                        bottomsheet(context,title,desCription,getID);
                      },
                      child: Icon(Icons.text_snippet_outlined,color: customGreen,size: 15,)
                  ),
                ),

                const SizedBox(width: 5.0,),


                SizedBox(
                  width: 15.0,
                  height: 15.0,
                  child: InkWell(
                      onTap: (){
                        deleteTask(context, getID);
                      },
                      child: Icon(Icons.delete_forever_outlined,color: Colors.red,size: 15,)
                  ),
                ),
              ],
            )

          ],
        ),
      ),

    ),
  );
}