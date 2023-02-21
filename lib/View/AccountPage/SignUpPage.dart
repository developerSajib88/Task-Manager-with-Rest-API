import 'package:flutter/material.dart';
import 'package:task_manager/Controller/AccountAuthentication.dart';
import 'package:task_manager/Styels/BackgroundStyles.dart';
import 'package:task_manager/Styels/Style.dart';
import 'package:task_manager/View/AccountPage/signInView.dart';

import '../../Styels/CustomColor.dart';
import '../../Styels/InputDecoration.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _firstNameController = TextEditingController();
 final TextEditingController _lastNameController = TextEditingController();
 final TextEditingController _mobileController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();

 bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGroundStyles(),
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: double.infinity,
                          child: Text("Join With Us",
                              style: customTitleTextStyle())),


                      const SizedBox(
                        height: 30.0,
                      ),


                      SizedBox(
                        height: 45.0,
                        child: TextFormField(
                          controller: _emailController,
                          cursorWidth: 3,
                          cursorColor: customGreen,
                          decoration: customInputDecoration("Email"),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter valid Email!";
                            }
                          },
                        ),
                      ),


                      const SizedBox(
                        height: 20.0,
                      ),


                      SizedBox(
                        height: 45.0,
                        child: TextFormField(
                          controller: _firstNameController,
                          cursorWidth: 3,
                          cursorColor: customGreen,
                          decoration: customInputDecoration("First Name"),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter your First Name";
                            }
                          },
                        ),
                      ),

                      const SizedBox(height: 20.0,),


                      SizedBox(
                        height: 45.0,
                        child: TextFormField(
                          controller: _lastNameController,
                          cursorWidth: 3,
                          cursorColor: customGreen,
                          decoration: customInputDecoration("Last Name"),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter your Last Name";
                            }
                          },
                        ),
                      ),

                      const SizedBox(height: 20.0,),



                      SizedBox(
                        height: 45.0,
                        child: TextFormField(
                          controller: _mobileController,
                          cursorWidth: 3,
                          cursorColor: customGreen,
                          keyboardType: TextInputType.number,
                          decoration: customInputDecoration("Mobile"),
                          validator: (value){
                            if(value!.length < 11){
                              return "Enter your Valid Mobile!";
                            }
                          },
                        ),
                      ),

                      const SizedBox(height: 20.0,),


                      SizedBox(
                        height: 45.0,
                        child: TextFormField(
                          controller: _passwordController,
                          cursorWidth: 3,
                          cursorColor: customGreen,
                          decoration: customInputDecoration("Password"),
                          validator: (value){
                            if(value!.length < 6){
                              return "Enter Minimum 6 digit Password";
                            }
                          },
                        ),
                      ),

                      const SizedBox(height: 20.0,),


                      SizedBox(
                          width: double.infinity,
                          height: 40.0,
                          child: ElevatedButton(
                            onPressed: ()async{
                              if(_formKey.currentState!.validate()){
                                loading = true;
                                setState(() {});
                                bool response = await createAccount(context,
                                    _emailController.text,
                                    _firstNameController.text,
                                    _lastNameController.text,
                                    _mobileController.text,
                                    _passwordController.text
                                );

                                if(response == true){
                                  loading = false;
                                  setState(() {});
                                }

                              }
                            },
                            child: loading == false? Icon(Icons.arrow_circle_right_outlined)
                                :SizedBox(width: 15,height: 15,child: CircularProgressIndicator(color: Colors.white,strokeWidth: 3,)),
                            style: customButtonStyle,
                          )),

                      const SizedBox(
                        height: 20.0,
                      ),
                      signInView(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
