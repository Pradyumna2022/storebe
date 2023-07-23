import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storebobypradyumna/views/auth/reset_screen.dart';
import 'package:storebobypradyumna/views/auth/signin_screen.dart';

import '../../constant/constant.dart';
import '../homepage/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              Center(
                child: Container(
                    height: 100,
                    child: logSignImage),
              ),
              SizedBox(height:40),
              Text("Login",style: TextStyle(
                fontSize: titleFontSize,fontWeight: FontWeight.bold,fontFamily: 'Gilroy'
                  //fontFamily: mainFontFamily
              ),),
              SizedBox(height:10),
              Text("Enter your emails and password",style: TextStyle(
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
                    SizedBox(height:20),
                    Text("Password",style: TextStyle(
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
                          else{
                            return null;
                          }
                        },

                        obscureText: passwordIcon,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon( passwordIcon ? Icons.visibility_off : Icons.visibility,color: Colors.green,),
                              onPressed: (){
                                setState(() {
                                  passwordIcon = !passwordIcon;
                                });
                              },
                            ),
                            hintText: 'Enter Your Password',
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
              SizedBox(height:5),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: (){
                    Get.to(ResetScreen());
                  },
                  child: Text("Forgot Password ?",style: TextStyle(
                    fontSize: subtitleFontSize,color: Colors.green,fontFamily: subtitleFontFamily,
                  ),),
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
                }, child: Text("Login"),style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)
                )
                ),),
              ),
              SizedBox(height: 8,),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Don't Have Any Account ?   ",style: TextStyle(
                      fontFamily: subtitleFontFamily,fontSize: 14,color: Colors.grey
                  ),
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () => Get.to(SigninScreen()),
                        text: 'SignIn',
                        style: TextStyle(
                          fontFamily: subtitleFontFamily,fontSize: 16,color: Colors.green,fontWeight: FontWeight.bold
                        )
                      )
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
