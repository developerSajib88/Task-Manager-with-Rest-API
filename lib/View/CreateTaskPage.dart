import 'package:flutter/material.dart';
import 'package:task_manager/Controller/API_Calling.dart';
import 'package:task_manager/Styels/BackgroundStyles.dart';
import '../Styels/CustomColor.dart';

import '../Styels/InputDecoration.dart';
import '../Styels/Style.dart';
import 'AccountPage/CustomAppBar.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {

  bool Loading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


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
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Add New Task",textAlign: TextAlign.start,style: customTitleTextStyle(),),
                            const SizedBox(height: 30.0,),

                            SizedBox(
                              height: 45.0,
                              child: TextFormField(
                                controller: subjectController,
                                cursorWidth: 3,
                                cursorColor: customGreen,
                                decoration: customInputDecoration("Subject"),
                                validator: (value){
                                  if(value!.isEmpty)return"Enter your subject";
                                },
                              ),
                            ),

                            const SizedBox(
                              height: 20.0,
                            ),

                            TextFormField(
                              controller: descriptionController,
                              cursorWidth: 3,
                              cursorColor: customGreen,
                              maxLines: 10,
                              decoration: customInputDecoration("Description"),
                              validator: (value){
                                if(value!.isEmpty)return"Enter your Description";
                              },
                            ),

                            const SizedBox(
                              height: 20.0,
                            ),



                            SizedBox(
                                width: double.infinity,
                                height: 40.0,
                                child: ElevatedButton(
                                  onPressed: ()async{
                                    if(formKey.currentState!.validate()){
                                      Loading = true;
                                      setState(() {});
                                      bool getResponse = await createTask(context, subjectController.text, descriptionController.text);
                                      if(getResponse == true){
                                        subjectController.clear();
                                        descriptionController.clear();
                                        Loading = false;
                                        setState(() {});
                                      }else if(getResponse == false){
                                        Loading = false;
                                        setState(() {});
                                      }

                                    }
                                  },
                                  child: Loading == false? const Icon(Icons.arrow_circle_right_outlined)
                                  :customCirculerPogressIndicatore(),
                                  style: customButtonStyle,
                                )),


                          ],
                        ),
                      ),
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
