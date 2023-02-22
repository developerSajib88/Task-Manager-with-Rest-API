import 'package:flutter/material.dart';
import 'package:task_manager/Styels/CustomColor.dart';
import 'package:task_manager/Styels/Style.dart';

import '../../Controller/API_Calling.dart';
import '../ItemView.dart';

class CancelPage extends StatefulWidget {
  const CancelPage({Key? key}) : super(key: key);

  @override
  State<CancelPage> createState() => _CancelPageState();
}

class _CancelPageState extends State<CancelPage> {

  List cancelTask = [];

  Future getCancelTask()async{
    cancelTask =await getTaskList("Canceled");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCancelTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Visibility(
          visible: cancelTask.length != 0,
          replacement: customloadingPogressIndicatore(),
          child: ListView.builder(
            itemCount: cancelTask.length,
            padding: const EdgeInsets.only(top: 10.0),
            itemBuilder: (context,index){
              return ItemView(
                  customRed,
                  cancelTask[index]["title"],
                  cancelTask[index]["description"],
                  cancelTask[index]["createdDate"],
                  "Canceled",
                  index
              );
            },
          ),
        )
    );
  }
}
