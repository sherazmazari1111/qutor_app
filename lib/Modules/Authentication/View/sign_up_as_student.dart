// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:qutur_tutur_app/Modules/Authentication/View/created_account.dart';
// import 'package:qutur_tutur_app/Modules/Authentication/View/signin_page.dart';
// import 'package:qutur_tutur_app/home_page.dart';
//
// import '../../../Utils/custom_btn.dart';
// import '../../../Utils/custom_textfield.dart';
// import '../Services/method.dart';
// import 'auth_page.dart';
//
// class SignUpAsStudent extends StatefulWidget {
//   SignUpAsStudent({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpAsStudent> createState() => _SignUpAsStudentState();
// }
//
// class _SignUpAsStudentState extends State<SignUpAsStudent> {
//   final _name = TextEditingController();
//   final _email = TextEditingController();
//   final _password = TextEditingController();
//   final _confirmPassword = TextEditingController();
//   bool isLoading=false;
//
//   bool _isChecked = false;
//   // bool _isChecked = false;
//
//   bool areAllFieldsFilled() {
//     return _name.text.isNotEmpty &&
//         _email.text.isNotEmpty &&
//         _password.text.isNotEmpty &&
//         _confirmPassword.text.isNotEmpty &&
//         _isChecked;
//   }
//
//   void _performSignUp() {
//     print('Sign-up successful!');
//     Get.snackbar('Success', 'Sign up as a tutor successful!');
//     Get.to(AuthPage());
//     // Perform other sign-up logic if needed
//     if (_name.text.isNotEmpty &&
//         _email.text.isNotEmpty &&
//         _password.text.isNotEmpty) {
//       setState(() {
//         isLoading = true;
//       });
//
//       createAccountForStudnet(_name.text, _email.text, _password.text).then((user) {
//         if (user != null) {
//           setState(() {
//             isLoading = false;
//           });
//           Get.offAll(SignIn());
//
//           print("Account Created Sucessfull");
//         } else {
//           print("Login Failed");
//           setState(() {
//             isLoading = false;
//           });
//         }
//       });
//     } else {
//       print("Please enter Fields");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 24, 171, 136),
//         title: Text(
//           "Create Account",
//           style: TextStyle(color: Colors.white, fontSize: 18),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () {
//             Get.back(result: AuthPage());
//           },
//         ),
//       ),
//       backgroundColor: Color.fromARGB(255, 24, 171, 136),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               CustomTextField1(
//                 controller: _name,
//                 obs: false,
//                 txt: "Name",
//               ),
//               SizedBox(height: size.height * 0.030),
//               CustomTextField1(
//                 controller: _email,
//                 obs: false,
//                 txt: "Email",
//               ),
//               SizedBox(height: size.height * 0.030),
//               CustomTextField1(
//                 controller: _password,
//                 obs: true,
//                 txt: "Password",
//               ),
//               SizedBox(height: size.height * 0.030),
//               CustomTextField1(
//                 controller: _confirmPassword,
//                 obs: true,
//                 txt: "Re-Password",
//               ),
//               SizedBox(height: size.height * 0.030),
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
//                   Expanded(child: Text("I have read and agree to the terms of use",style: TextStyle(color: Colors.white),)),
//                 ],
//               ),
//
//               SizedBox(height: size.height * 0.060),
//
//
//                   InkWell(
//                     onTap: (){
//
//                       if (_name.text.isNotEmpty &&
//                           _email.text.isNotEmpty &&
//                           _password.text.isNotEmpty) {
//                         setState(() {
//                           isLoading = true;
//                         });
//
//                         createAccountForStudnet(_name.text, _email.text, _password.text).then((user) {
//                           if (user != null) {
//                             setState(() {
//                               isLoading = false;
//                             });
//                             // Get.offAll(CreatedAccountSuccessfully());
//                             Get.snackbar('Success', 'Sign up as a tutor successful!');
//
//                             print("Account Created Sucessfull");
//                           } else {
//                             print("Login Failed");
//                             Get.snackbar('Faild', 'Sign Up Faild!');
//
//                             setState(() {
//                               isLoading = false;
//                             });
//                           }
//                         });
//                       } else {
//                         Get.snackbar('faild', 'Please enter Fields!');
//
//                         print("Please enter Fields");
//                       }
//                     },
//                     child: Btn1(
//                       color1: Color.fromARGB(255, 15, 220, 170),
//                       hgt: size.height * 0.060,
//                       txt: "Sign Up as Student",
//                       wdgt: size.width,
//                       color2: Color.fromARGB(255, 15, 220, 170),
//                     ),
//                   ),
//                 // ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qutur_tutur_app/Modules/Authentication/View/created_account.dart';

import '../../../Utils/custom_btn.dart';


class SignUpAsStudent extends StatefulWidget {
  @override
  _SignUpAsStudentState createState() => _SignUpAsStudentState();
}

class _SignUpAsStudentState extends State<SignUpAsStudent> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor:Color.fromARGB(255, 24, 171, 136),

      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 24, 171, 136),

        title: Text('Create account'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white), //
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Change focused border color
                    ),                    labelText: 'Confirm Password'),
                obscureText: true,
              ),
              SizedBox(height: size.height * 0.040),
          InkWell(
            onTap:  _signUpUser,
            child: Btn1(
                        color1: Color.fromARGB(255, 15, 220, 170),
                        hgt: size.height * 0.060,
                        txt: "Sign Up as Student",
                        wdgt: size.width,
                        color2: Color.fromARGB(255, 15, 220, 170),
                      ),
          ),
              // ElevatedButton(
              //   onPressed: _signUpUser,
              //   child: Text('Sign Up'),
              // ),
              SizedBox(height: size.height * 0.030),

            ],
          ),
        ),
      ),
    );
  }

  void _signUpUser() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match. Please try again.')),
      );
      return;
    }

    _createUserWithEmailPassword(email, password);
  }

  void _createUserWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User created with email: ${userCredential.user?.email}');
      Get.snackbar("Sign Up", "Successfully");

      Get.off(AdditionalDataPage(userEmail:FirebaseAuth.instance.currentUser!.email!) );
      // Navigate to the additional data page or any other page you want to show after successful sign-up.
    } catch (e) {
      print('Error signing up: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again later.')),
      );
    }
  }
}

