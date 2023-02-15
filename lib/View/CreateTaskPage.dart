import 'package:flutter/material.dart';
import 'package:task_manager/Styels/BackgroundStyles.dart';
import '../Styels/CustomColor.dart';

import '../Styels/InputDecoration.dart';
import '../Styels/Style.dart';
import 'CustomAppBar.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGroundStyles(),
          Column(
            children: [

              CustomAppBar(),

              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Add New Task",textAlign: TextAlign.start,style: customTitleTextStyle(),),
                        const SizedBox(height: 30.0,),

                        SizedBox(
                          height: 45.0,
                          child: TextFormField(
                            cursorWidth: 3,
                            cursorColor: customGreen,
                            decoration: customInputDecoration("Subject"),
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),

                        TextFormField(
                          cursorWidth: 3,
                          cursorColor: customGreen,
                          maxLines: 10,
                          decoration: customInputDecoration("Description"),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),



                        SizedBox(
                            width: double.infinity,
                            height: 40.0,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Icon(Icons.arrow_circle_right_outlined),
                              style: customButtonStyle,
                            )),


                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
