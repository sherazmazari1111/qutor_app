import 'package:flutter/material.dart';
import 'package:qutur_tutur_app/Modules/Authentication/View/created_account.dart';
import 'package:qutur_tutur_app/Modules/Authentication/View/sign_up_as_student.dart';
import 'package:qutur_tutur_app/Modules/Authentication/View/sign_up_as_tutor.dart';
import 'package:qutur_tutur_app/Modules/Authentication/View/signin_page.dart';
import 'package:qutur_tutur_app/Utils/custom_btn.dart';
import 'package:get/get.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 24, 171, 136),
      body:Padding(
        padding: const EdgeInsets.only(left: 50,right: 50,top: 30,bottom: 30),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [

        Text("قutor",style: TextStyle(color:Colors.white,fontSize: 100,fontWeight: FontWeight.bold ),),
      // SizedBox(height: size.height*.050,),
      Text("Qutur is where online Quran Tutors \n    and Students find each others",style: TextStyle(color: Colors.white,fontSize: 15),),
      SizedBox(height: size.height*.030,),
      InkWell(

          onTap: (){
            Get.to(SignUpAsStudent());
          },
          child: Btn(color1:Colors.yellowAccent,hgt: size.height*.050,txt: "Sign Up as Student",wdgt: size.width,color2: Colors.yellowAccent, )),
      SizedBox(height: size.height*.030,),

      InkWell(
        onTap: (){
          Get.to(SignInPage());
        },
        child: Container(
          height: size.height*.050,
          width: size.width,
decoration: BoxDecoration(
  color:Color.fromARGB(255, 24, 171, 136),
  borderRadius: BorderRadius.circular(30),
    border: Border.all(
                color: Colors.white, // Replace with the desired border color
                width: 1.0, // Replace with the desired border width
              ),
),
child: Center(child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 15))),
        ),
      ),
      SizedBox(height: size.height*.030,),
Text("Or",style: TextStyle(color: Colors.white,fontSize: 15)),
      SizedBox(height: size.height*.010,),
TextButton(onPressed: (){
  Get.to(SignUpAsTutor());
}, child: Text("Sign Up as Tutor",style: TextStyle(color: const Color.fromARGB(255, 231, 210, 14))),
),
        ],),
      ) ,
    );
  }
}