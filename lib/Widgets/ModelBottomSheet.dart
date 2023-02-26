import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/Controller/API_Calling.dart';
import 'package:task_manager/Styels/CustomColor.dart';
import 'package:task_manager/Styels/Style.dart';
import 'package:get/get.dart';
import 'package:task_manager/View/NavigationView/CompletedPage.dart';
import 'package:task_manager/View/NavigationView/NewTaskPage.dart';
 bottomsheet(BuildContext context,String title,description,getId){
   String taskStack = "New";
   bool Loading = false;
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return StatefulBuilder(
            builder: (context,setState){
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [


                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: customBlack,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 15, color: customGrey, fontWeight: FontWeight.normal),
                  ),


                  RadioListTile(
                      value: "New",
                      groupValue: taskStack,
                      title: Text("New Task",style: GoogleFonts.poppins(color: customBlack,fontWeight: FontWeight.bold),),
                      onChanged: (value){
                        taskStack = value.toString();
                        setState((){});
                        print(value.toString());
                      }
                  ),



                  RadioListTile(
                      value: "Completed",
                      groupValue: taskStack,
                      title: Text("Completed Task",style: GoogleFonts.poppins(color: customBlack,fontWeight: FontWeight.bold),),
                      onChanged: (value){
                        taskStack = value.toString();
                        setState((){});
                        print(value.toString());
                      }
                  ),




                  RadioListTile(
                      value: "Progress",
                      groupValue: taskStack,
                      title: Text("Progress Task",style: GoogleFonts.poppins(color: customBlack,fontWeight: FontWeight.bold),),
                      onChanged: (value){
                        taskStack = value.toString();
                        setState((){});
                        print(value.toString());
                      }
                  ),


                  RadioListTile(
                      value: "Cancel",
                      groupValue: taskStack,
                      title: Text("Cancel Task",style: GoogleFonts.poppins(color: customBlack,fontWeight: FontWeight.bold),),
                      onChanged: (value){
                        taskStack = value.toString();
                        setState((){});
                        print(value.toString());
                      }
                  ),


                  Expanded(child: Container()),


                  SizedBox(
                    width: double.infinity,
                    height: 40.0,
                    child: ElevatedButton(
                        onPressed: ()async{
                          Loading = true;
                          setState((){});
                          switch(taskStack){
                            case "New":
                            {
                              bool getRes = await updateTask(context, getId, taskStack);
                              if(getRes == true){
                                Loading = false;
                                setState((){});
                              };
                            }
                            break;
                            case "Completed":
                            {
                             bool getRes = await updateTask(context, getId, taskStack);
                             if(getRes == true){
                               Loading = false;
                               setState((){});
                             }
                            }
                            break;

                            case "Progress":
                              {
                                bool getRes = await updateTask(context, getId, taskStack);
                                if(getRes == true){
                                  Loading = false;
                                  setState((){});
                                }
                              }
                              break;

                            case "Cancel":
                              {
                                bool getRes = await updateTask(context, getId, taskStack);
                                if(getRes == true){
                                  Loading = false;
                                  setState((){});
                                };
                              }
                              break;
                          }
                        },
                        child: Loading == false? Text("Update Task",style: TextStyle(color: Colors.white),)
                        : customCirculerPogressIndicatore(),
                      style: customButtonStyle,
                    ),
                  )

                ],
              ),
            ),
          );
        }
        );
      }
  );
}