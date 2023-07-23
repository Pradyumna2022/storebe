import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storebobypradyumna/views/auth/login_screen.dart';
import 'package:storebobypradyumna/views/auth/otp_verification.dart';

import '../../constant/constant.dart';
import '../homepage/home_page.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final formkey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();


  bool _isValidPhoneNumber(String value) {
    return RegExp(r'^\d{10}$').hasMatch(value);
  }

  bool _isValidEmail(String value) {
    // Use a regular expression for email validation based on the RFC 5322 specification
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value);
  }


  bool passwordIcon = true;
  bool npasswordIcon = true;

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
              Text("SignIn",style: TextStyle(
                  fontSize: titleFontSize,fontWeight: FontWeight.bold,fontFamily: 'Gilroy'
                //fontFamily: mainFontFamily
              ),),
              SizedBox(height:10),
              Text("Enter your credentials to continue",style: TextStyle(
                  fontSize: subtitleFontSize,fontWeight: FontWeight.bold,fontFamily: titleFontFamily,color: Colors.grey
              ),),
              SizedBox(height:40),
              Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Name",style: TextStyle(
                        fontSize: subtitleFontSize,fontFamily: 'Gilroy-s'
                      //fontFamily: mainFontFamily
                    ),),
                    SizedBox(height:10),
                    SizedBox(
                      height: 57,
                      child: TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Please Enter Name";
                          }
                          else if (value.contains(RegExp(r'\s'))) {
                            return "Password cannot contain spaces";
                          }
                          else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Your Name',
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


                    Text("Email",style: TextStyle(
                        fontSize: subtitleFontSize,fontFamily: 'Gilroy-s'
                      //fontFamily: mainFontFamily
                    ),),
                    SizedBox(height:10),
                    SizedBox(
                      height: 57,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Email";
                          } else if (!_isValidEmail(value)) {
                            return "Please Enter a Valid Email Address";
                          } else if (!value.contains(RegExp(r'[0-9]'))){
                            return "Please Enter a least One Number";
                          } else{
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

                    Text("Phone Number",style: TextStyle(
                        fontSize: subtitleFontSize,fontFamily: 'Gilroy-s'
                      //fontFamily: mainFontFamily
                    ),),
                    SizedBox(height:10),
                    SizedBox(
                      height: 57,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Phone Number";
                          } else if (!_isValidPhoneNumber(value)) {
                            return "Invalid phone number. Please use a valid phone number format.";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Your Phone Number',
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
                        controller: passwordController,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Please Enter Password";
                          } else if (value.length < 8) {
                            return "Password must be at least 8 characters long";
                          } else if (value.length > 32) {
                            return "Password cannot exceed 32 characters";
                          } else if (!value.contains(RegExp(r'[A-Z]'))) {
                            return "Password must contain at least one uppercase letter";
                          } else if (!value.contains(RegExp(r'[a-z]'))) {
                            return "Password must contain at least one lowercase letter";
                          } else if (!value.contains(RegExp(r'[0-9]'))) {
                            return "Password must contain at least one number";
                          } else if (!value.contains(RegExp(r'[!@#\$%^&*()_+=]'))) {
                            return "Password must contain at least one special character like !@#\$%^&*()_+=";
                          } else if (value.contains(RegExp(r'\s'))) {
                            return "Password cannot contain spaces";
                          } else if (value.contains("password")) {
                            return "Avoid using common words like 'password' in your password";
                          } else {
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

                    SizedBox(height:20),


                    Text("Confirm Password",style: TextStyle(
                        fontSize: subtitleFontSize,fontFamily: 'Gilroy-s'
                      //fontFamily: mainFontFamily
                    ),),
                    SizedBox(height:10),
                    SizedBox(
                      height: 57,
                      child: TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Please Enter Confirm Password";
                          }
                          else if(value != passwordController.text) {
                            return "Your Password Not Match";
                          }
                          else{
                            return null;
                          }
                        },

                        obscureText: npasswordIcon,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon( npasswordIcon ? Icons.visibility_off : Icons.visibility,color: Colors.green,),
                              onPressed: (){
                                setState(() {
                                  npasswordIcon = !npasswordIcon;
                                });
                              },
                            ),
                            hintText: 'Enter Your Confirm Password',
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
                    Get.to(OtpVerification());
                  }
                }, child: Text("Signin",style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: subtitleFontSize,
                ),),style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                )
                ),),
              ),
              SizedBox(height: 8,),
              Center(
                child: Text.rich(
                  TextSpan(
                      text: "Already Have Any Account ?   ",style: TextStyle(
                      fontFamily: subtitleFontFamily,fontSize: 14,color: Colors.grey
                  ),
                      children: [
                        TextSpan(
                            text: 'Login',
                            recognizer: TapGestureRecognizer()..onTap=()=>Get.to(LoginScreen()),
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
