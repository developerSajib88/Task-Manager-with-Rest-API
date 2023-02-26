import 'package:flutter/material.dart';
import 'package:task_manager/Styels/CustomColor.dart';
import 'package:task_manager/Styels/Style.dart';

import '../../Controller/API_Calling.dart';
import '../ItemView.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({Key? key}) : super(key: key);

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {

  List completedTask = [];

  getCompletedTask()async{
    completedTask = await getTaskList("Completed");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCompletedTask();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: ()async{
          getCompletedTask();
        },
        child: Visibility(
          visible: completedTask.length != 0,
          replacement: customloadingPogressIndicatore(),
          child: ListView.builder(
            itemCount: completedTask.length,
            padding: const EdgeInsets.only(top: 10.0),
            itemBuilder: (context,index){
          return ItemView(
              context,
              customGreen,
              completedTask[index]["title"],
              completedTask[index]["description"],
              completedTask[index]["createdDate"],
              "Completed",
              completedTask[index]["_id"]
          );
    },
          ),
        ),
      )
    );
  }
}
