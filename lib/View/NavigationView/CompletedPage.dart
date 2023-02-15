import 'package:flutter/material.dart';
import 'package:task_manager/Styels/CustomColor.dart';

import '../ItemView.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({Key? key}) : super(key: key);

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.only(top: 10.0),
        itemBuilder: (context,index){
      return ItemView(
          customGreen,
          "Lorem Ipsum is simply dummy",
          "It is a long established fact that a reader will be distracted by the readable content"
              "of a page when looking at its layout.",
          "Date: 12-12-2001",
          "Completed",
          index
      );
    },
      )
    );
  }
}
