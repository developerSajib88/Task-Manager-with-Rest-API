import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/Styels/CustomColor.dart';
import 'package:task_manager/Styels/Style.dart';

import '../../Controller/API_Calling.dart';
import '../ItemView.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({Key? key}) : super(key: key);

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {

  List newTaskList = [];
  int newTask = 0;
  int completedTask = 0;
  int cancelTask = 0;
  int progressTask = 0;

  Future getNewTask()async{
    newTaskList = await getTaskList("New");
    setState(() {});
  }

  Future getTaskCont()async{
    List getList = await taskCount();

    for(int index = 0; index<getList.length; index++){
      if(getList[index]["_id"] == "Completed"){
        completedTask = getList[index]["sum"];
      }
      else if(getList[index]["_id"] == "Cancel"){
        cancelTask = getList[index]["sum"];
      }
      else if(getList[index]["_id"] == "Progress"){
        progressTask = getList[index]["sum"];
      }
      else if(getList[index]["_id"] == "New"){
        newTask = getList[index]["sum"];
      }

    }
    setState(() {});
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewTask();
    getTaskCont();
  }


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
                        Text(newTask.toString(),style: GoogleFonts.poppins(fontSize: 15,color: customBlack,fontWeight: FontWeight.bold),),
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
                        Text(completedTask.toString(),style: GoogleFonts.poppins(fontSize: 15,color: customBlack,fontWeight: FontWeight.bold),),
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
                        Text(cancelTask.toString(),style: GoogleFonts.poppins(fontSize: 15,color: customBlack,fontWeight: FontWeight.bold),),
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
                        Text(progressTask.toString(),style: GoogleFonts.poppins(fontSize: 15,color: customBlack,fontWeight: FontWeight.bold),),
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
              child: Visibility(
                visible: newTaskList.length != 0,
                replacement: customloadingPogressIndicatore(),
                child: ListView.builder(
                  itemCount: newTaskList.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context,index){
                    return ItemView(
                        context,
                        customBlue,
                        newTaskList[index]["title"],
                        newTaskList[index]["description"],
                        newTaskList[index]["createdDate"],
                        "New",
                        newTaskList[index]["_id"]
                    );
                  },
                ),
              )
          )


        ],
      ),
    );
  }
}
