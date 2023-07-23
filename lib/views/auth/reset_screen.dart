import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storebobypradyumna/views/auth/signin_screen.dart';

import '../../constant/constant.dart';
import '../homepage/home_page.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final formkey = GlobalKey<FormState>();
  bool passwordIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60,),
              IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios)),
              SizedBox(height:40),
              Text("Reset Password",style: TextStyle(
                  fontSize: titleFontSize,fontWeight: FontWeight.bold,fontFamily: 'Gilroy'
                //fontFamily: mainFontFamily
              ),),
              SizedBox(height:10),
              Text("Please enter your email address to request \na password reset",style: TextStyle(
                  fontSize: subtitleFontSize,fontWeight: FontWeight.bold,fontFamily: titleFontFamily,color: Colors.grey
              ),),
              SizedBox(height:40),
              Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email",style: TextStyle(
                        fontSize: subtitleFontSize,fontFamily: 'Gilroy-s'
                      //fontFamily: mainFontFamily
                    ),),
                    SizedBox(height:10),
                    SizedBox(
                      height: 57,
                      child: TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Please Enter Email";
                          }
                          else if(!value.endsWith("@gmail.com")){
                            return "Please Enter Valid Gmail";
                          }
                          else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Your Email',
                            hintStyle: TextStyle(
                                fontFamily: subtitleFontFamily,fontSize: 14
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.grey,width: 1
                                )
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.grey,width: 1
                                )
                            )
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 35,),
              SizedBox(
                height: 54,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  if(formkey.currentState!.validate()){
                    Get.to(HomePage());
                  }
                }, child: Text("Send"),style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                )
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
