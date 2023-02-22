import 'package:flutter/material.dart';
import 'package:task_manager/Styels/CustomColor.dart';
import 'package:task_manager/Styels/Style.dart';

import '../../Controller/API_Calling.dart';
import '../ItemView.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {

  List progressTaskList = [];

  Future getProgressTask()async{
    progressTaskList = await getTaskList("Progress");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Visibility(
          visible: progressTaskList.length != 0,
          replacement: customloadingPogressIndicatore(),
          child: ListView.builder(
            itemCount: progressTaskList.length,
            padding: const EdgeInsets.only(top: 10.0),
            itemBuilder: (context,index){
              return ItemView(
                  customPurple,
                  progressTaskList[index]["title"],
                  progressTaskList[index]["description"],
                  progressTaskList[index]["createdDate"],
                  "Progress",
                  index
              );
            },
          ),
        )
    );
  }
}
