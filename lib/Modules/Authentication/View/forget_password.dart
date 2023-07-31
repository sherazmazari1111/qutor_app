import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Utils/custom_btn.dart';
import '../../../Utils/custom_textfield.dart';
import 'auth_page.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  final _email = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 24, 171, 136),
        title: Text(
          "Forget Password",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Get.back(result: AuthPage());
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 24, 171, 136),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [

              CustomTextField1(
                controller: _email,
                obs: false,
                txt: "Email",
              ),

              SizedBox(height: size.height * 0.060),

              // Sign Up button with GestureDetector to handle the tap
              GestureDetector(

                onTap:(){

                },

                child: Btn1(
                  color1: Color.fromARGB(255, 15, 220, 170),
                  hgt: size.height * 0.060,
                  txt: "Send",
                  wdgt: size.width,
                  color2: Color.fromARGB(255, 15, 220, 170),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
