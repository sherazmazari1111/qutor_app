// import 'dart:ui';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:qutur_tutur_app/Modules/Authentication/Services/authenticate.dart';
// import 'package:qutur_tutur_app/Modules/Authentication/Services/method.dart';
// import 'package:qutur_tutur_app/Modules/Authentication/View/forget_password.dart';
// import 'package:qutur_tutur_app/home_page.dart';
//
// import '../../../Utils/custom_btn.dart';
// import '../../../Utils/custom_textfield.dart';
// import 'auth_page.dart';
//
// class SignIn extends StatefulWidget {
//   SignIn({Key? key}) : super(key: key);
//
//   @override
//   State<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   final _confirmPassword = TextEditingController();
//   final _email = TextEditingController();
//   final _password = TextEditingController();
//   bool _isChecked = false;
//   final _name = TextEditingController();
//   bool areAllFieldsFilled() {
//     return _name.text.isNotEmpty &&
//         _email.text.isNotEmpty &&
//         _password.text.isNotEmpty &&
//         _confirmPassword.text.isNotEmpty &&
//         _isChecked;
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     bool isLoading = false;
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 24, 171, 136),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Text("قutor",style: TextStyle(color:Colors.white,fontSize: 100,fontWeight: FontWeight.bold ),),
//
//               SizedBox(height: size.height * 0.030),
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: 'Email',
//                   labelStyle: TextStyle(color: Colors.white),
//                   hintStyle: TextStyle(color: Colors.white),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide:  BorderSide(color: Colors.white),
//                   ),
//
//                 ),
//
//               ),
//               SizedBox(height: size.height * 0.030),
//               TextField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(labelText: 'Password',
//                   labelStyle: TextStyle(color: Colors.white),
//                   hintStyle: TextStyle(color: Colors.white),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(height: size.height * 0.030),
//
//
//               // Checkbox to agree to terms of use
//               Row(
//                 children: [
//                   Checkbox(
//                     value: _isChecked,
//
//                     activeColor: Colors.white,
//                     checkColor: Color.fromARGB(255, 24, 171, 136),
//                     onChanged: (value) {
//                       setState(() {
//                         _isChecked = value!;
//                       });
//                     },
//                   ),
//                   Text("Remember me",style: TextStyle(color: Colors.white),),
//                   SizedBox(width: size.width * 0.030),
//
//                   InkWell(
//                       onTap: (){
//                         Get.to(ForgetPassword());
//                       },
//                       child: Expanded(child: Text("Forget Password?",style: TextStyle(color: Colors.white),))),
//                 ],
//               ),
//
//               SizedBox(height: size.height * 0.060),
//
//               // Sign Up button with GestureDetector to handle the tap
//               GestureDetector(
//                 onTap: _loginUser,
//                 // onTap: _isChecked
//                 //     ? () {
//                 //   // Perform SignUp logic here
//                 //   if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
//                 //     setState(() {
//                 //       isLoading = true;
//                 //     });
//                 //
//                 //     logIn(_email.text, _password.text).then((user) {
//                 //       if (user != null) {
//                 //         print("Login Sucessfull");
//                 //         Get.snackbar('Login', 'Login Successfully!');
//                 //
//                 //         setState(() {
//                 //           isLoading = false;
//                 //         });
//                 //         // Get.offAll(Homepage());
//                 //       } else {
//                 //         print("Login Failed");
//                 //         setState(() {
//                 //           isLoading = false;
//                 //         });
//                 //       }
//                 //     });
//                 //   } else {
//                 //     Get.snackbar('Please', 'fill form correctly!');
//                 //
//                 //     print("Please fill form correctly");
//                 //   }
//                 // }
//                 //     : null,
//                 child: Btn1(
//                   color1: Color.fromARGB(255, 15, 220, 170),
//                   hgt: size.height * 0.060,
//                   txt: "Sign In",
//                   wdgt: size.width,
//                   color2: Color.fromARGB(255, 15, 220, 170),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.030),
//
//               TextButton(onPressed: (){
//                 Get.to(AuthPage());
//               }, child: Text("Don't have an account?",style: TextStyle(color:  Colors.white)),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   void _loginUser() {
//     _signInWithEmailPassword(_emailController.text.trim(), _passwordController.text.trim());
//   }
//
//   void _signUpUser() {
//     _createUserWithEmailPassword(_emailController.text.trim(), _passwordController.text.trim());
//
//   }
//
//   void _signInWithEmailPassword(String email, String password) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       print('User logged in with email: ${userCredential.user?.email}');
//       Get.snackbar("login", "Successfully");
//     } catch (e) {
//       print('Error logging in: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Invalid email or password. Please try again.')),
//       );
//     }
//   }
//
//   void _createUserWithEmailPassword(String email, String password) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       print('User created with email: ${userCredential.user?.email}');
//       Get.snackbar("SignUp", "Successfully");
//     } catch (e) {
//       print('Error signing up: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred. Please try again later.')),
//       );
//     }
//   }
// }




import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qutur_tutur_app/Modules/Authentication/View/sign_up_as_student.dart';
import 'package:qutur_tutur_app/Utils/navigation_bar_pages.dart';
// import 'package:qutur_tutur_app/home_page.dart';

import '../../../Utils/custom_btn.dart';
import '../../Home/View/home_page.dart';
import 'created_account.dart';
import 'forget_password.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor:Color.fromARGB(255, 24, 171, 136),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 30,top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(child: Text("قutor",style: TextStyle(color:Colors.white,fontSize: 100,fontWeight: FontWeight.bold ),)),
              SizedBox(height: size.height * 0.030),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white), //
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Change focused border color
                    ),
                    labelText: 'Email'),
              ),
              SizedBox(height: size.height * 0.030),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white), //
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Change focused border color
                    ),
                    labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: size.height * 0.030),
              InkWell(
                  onTap: (){
                    Get.to(ForgetPassword());
                  },
                  child: Expanded(child: Text("Forget Password?",style: TextStyle(color: Colors.white),))),
              SizedBox(height: size.height * 0.030),

              InkWell(
                onTap:  _loginUser,
                child: Btn1(
                  color1: Color.fromARGB(255, 15, 220, 170),
                  hgt: size.height * 0.060,
                  txt: "Sign In",
                  wdgt: size.width,
                  color2: Color.fromARGB(255, 15, 220, 170),
                ),
              ),
              SizedBox(height: size.height * 0.030),

              InkWell(
                  onTap: (){
                    Get.off(SignUpAsStudent());
                  },

                  child: Center(child: Text("Don't have an account",style: TextStyle(color: Colors.white),))),

              SizedBox(height: size.height * 0.030),
            ],
          ),
        ),
      ),
    );
  }

  void _loginUser() {
    _signInWithEmailPassword(_emailController.text.trim(), _passwordController.text.trim());
  }

  void _signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User logged in with email: ${userCredential.user?.email}');

      Get.off(NavigationPage());
      Get.snackbar("Login", "Successfully");
      // Navigate to the home page or any other page you want to show after successful login.
    } catch (e) {
      print('Error logging in: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email or password. Please try again.')),
      );
    }
  }
}
// Get.off((HomePage(userEmail: FirebaseAuth.instance.currentUser!.email!)));


