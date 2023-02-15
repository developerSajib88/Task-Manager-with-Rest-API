import 'package:flutter/material.dart';
import 'package:task_manager/Styels/CustomColor.dart';

import '../ItemView.dart';

class CancelPage extends StatefulWidget {
  const CancelPage({Key? key}) : super(key: key);

  @override
  State<CancelPage> createState() => _CancelPageState();
}

class _CancelPageState extends State<CancelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: 10,
          padding: const EdgeInsets.only(top: 10.0),
          itemBuilder: (context,index){
            return ItemView(
                customRed,
                "Lorem Ipsum is simply dummy",
                "It is a long established fact that a reader will be distracted by the readable content"
                    "of a page when looking at its layout.",
                "Date: 12-12-2001",
                "Cancel",
                index
            );
          },
        )
    );
  }
}
