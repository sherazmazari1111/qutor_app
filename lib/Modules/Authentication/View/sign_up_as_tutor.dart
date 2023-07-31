// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../Utils/custom_btn.dart';
// import '../../../Utils/custom_textfield.dart';
// import 'auth_page.dart';
//
// class SignUpAsTutor extends StatefulWidget {
//   SignUpAsTutor({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpAsTutor> createState() => _SignUpAsTutorState();
// }
//
// class _SignUpAsTutorState extends State<SignUpAsTutor> {
//   final _name = TextEditingController();
//   final _email = TextEditingController();
//   final _password = TextEditingController();
//   final _confirmPassword = TextEditingController();
//
//   bool _isChecked = false;
//   bool _isChecked1 = false;
//   bool _isChecked2 = false;
//   bool _isChecked3 = false;
//   bool _isChecked4 = false;
//
//   String? _selectedGender;
//   String? _selectedCountry;
//   String? _selectedTimeZone;
//
//   List<String> genders = ['Male', 'Female'];
//   List<String> countries = ['Country A', 'Country B', 'Country C', 'Country D'];
//   List<String> timeZones = [
//     'Timezone 1',
//     'Timezone 2',
//     'Timezone 3',
//     'Timezone 4',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
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
//         padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 50),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
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
//               // Gender Selection Dropdown
//               DropdownButtonFormField<String>(
//                 value: _selectedGender,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedGender = newValue;
//                   });
//                 },
//                 items: genders.map((gender) {
//                   return DropdownMenuItem<String>(
//                     value: gender,
//                     child: Text(gender),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   labelText: 'Select Gender',
//                   labelStyle: TextStyle(color: Colors.white),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.030),
//
//               // Country Selection Dropdown
//               DropdownButtonFormField<String>(
//                 value: _selectedCountry,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedCountry = newValue;
//                   });
//                 },
//                 items: countries.map((country) {
//                   return DropdownMenuItem<String>(
//                     value: country,
//                     child: Text(country),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   labelText: 'Select Country',
//                   labelStyle: TextStyle(color: Colors.white),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.030),
//
//               // Timezone Selection Dropdown
//               DropdownButtonFormField<String>(
//                 value: _selectedTimeZone,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedTimeZone = newValue;
//                   });
//                 },
//                 items: timeZones.map((zone) {
//                   return DropdownMenuItem<String>(
//                     value: zone,
//                     child: Text(zone),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   labelText: 'Select Timezone',
//                   labelStyle: TextStyle(color: Colors.white),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.030),
//
//               // Checkboxes to agree to terms of use
//               Padding(
//                 padding: const EdgeInsets.only(left: 25),
//                 child: Text("I can Tech", style: TextStyle(color: Colors.white)),
//               ),
//
//               Row(
//                 children: [
//                   Expanded(
//                     child: CheckboxListTile(
//                       activeColor: Colors.white,
//                       checkColor: Colors.green,
//                       value: _isChecked1,
//                       onChanged: (value) {
//                         setState(() {
//                           _isChecked1 = value!;
//                         });
//                       },
//                       title: Text("Recitaion", style: TextStyle(color: Colors.white)),
//                       controlAffinity: ListTileControlAffinity.leading,
//                     ),
//                   ),
//                   Expanded(
//                     child: CheckboxListTile(
//                       activeColor: Colors.white,
//                       checkColor: Colors.green,
//                       value: _isChecked2,
//                       onChanged: (value) {
//                         setState(() {
//                           _isChecked2 = value!;
//                         });
//                       },
//                       title: Text("Hifz", style: TextStyle(color: Colors.white)),
//                       controlAffinity: ListTileControlAffinity.leading,
//                     ),
//                   ),
//                 ],
//               ),
//               // SizedBox(height: size.height * 0.010),
//
//               Row(
//                 children: [
//                   Expanded(
//                     child: CheckboxListTile(
//                       activeColor: Colors.white,
//                       checkColor: Colors.green,
//                       value: _isChecked3,
//                       onChanged: (value) {
//                         setState(() {
//                           _isChecked3= value!;
//                         });
//                       },
//                       title: Text("Arabic", style: TextStyle(color: Colors.white)),
//                       controlAffinity: ListTileControlAffinity.leading,
//                     ),
//                   ),
//                   Expanded(
//                     child: CheckboxListTile(
//                       activeColor: Colors.white,
//                       checkColor: Colors.green,
//                       value: _isChecked4,
//                       onChanged: (value) {
//                         setState(() {
//                           _isChecked4 = value!;
//                         });
//                       },
//                       title: Text("Tajweed", style: TextStyle(color: Colors.white)),
//                       controlAffinity: ListTileControlAffinity.leading,
//                     ),
//                   ),
//                 ],
//               ),
//
//               SizedBox(height: size.height * 0.020),
//
//               CheckboxListTile(
//                 activeColor: Colors.white,
//                 checkColor: Colors.green,
//                 value: _isChecked,
//                 onChanged: (value) {
//                   setState(() {
//                     _isChecked = value!;
//                   });
//                 },
//                 title: Text("I have read and agree to the terms of use", style: TextStyle(color: Colors.white)),
//                 controlAffinity: ListTileControlAffinity.leading,
//               ),
//               SizedBox(height: size.height * 0.060),
//
//               // Sign Up button with GestureDetector to handle the tap
//               GestureDetector(
//                 onTap: _isChecked
//                     ? () {
//                   // Perform SignUp logic here
//                 }
//                     : null,
//                 child: Btn1(
//                   color1: Color.fromARGB(255, 15, 220, 170),
//                   hgt: size.height * 0.060,
//                   txt: "Sign Up as Tutor",
//                   wdgt: size.width,
//                   color2: Color.fromARGB(255, 15, 220, 170),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qutur_tutur_app/Modules/Authentication/View/auth_page.dart';

import '../../../Utils/custom_btn.dart';


class SignUpAsTutor extends StatefulWidget {
  SignUpAsTutor({Key? key}) : super(key: key);

  @override
  State<SignUpAsTutor> createState() => _SignUpAsTutorState();
}

class _SignUpAsTutorState extends State<SignUpAsTutor> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  bool _isChecked = false;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;

  String? _selectedGender;
  String? _selectedCountry;
  String? _selectedTimeZone;

  List<String> genders = ['Male', 'Female'];
  List<String> countries = ['Country A', 'Country B', 'Country C', 'Country D'];
  List<String> timeZones = [
    'Timezone 1',
    'Timezone 2',
    'Timezone 3',
    'Timezone 4',
  ];

  // Helper function to check if at least one of the four checkboxes is selected
  bool isAtLeastOneCheckboxSelected() {
    return _isChecked1 || _isChecked2 || _isChecked3 || _isChecked4;
  }

  // Helper function to check if all necessary checkboxes are checked
  bool areAllCheckboxesSelected() {
    return _isChecked && isAtLeastOneCheckboxSelected();
  }

  // Placeholder sign-up function (Replace this with your actual sign-up logic)
  void performSignUp() {
    if (areAllCheckboxesSelected()) {
      // Add your sign-up code here
      // For example, you can show a success message using Get.snackbar:
      Get.snackbar('Success', 'Sign up as a tutor successful!');

      Get.to(AuthPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Sign Up button with GestureDetector to handle the tap
    GestureDetector signUpButton = GestureDetector(
      onTap: performSignUp, // Call the sign-up function when the button is tapped
      child: ElevatedButton(

        onPressed: areAllCheckboxesSelected() ? performSignUp : null,
        style: ElevatedButton.styleFrom(
          primary: areAllCheckboxesSelected()
              ? Color.fromARGB(255, 15, 220, 170)
              : Colors.grey,
          padding: EdgeInsets.symmetric(vertical: size.height * 0.020,horizontal: size.width*.25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          // Get.off(AuthPage())
        ),
        child: Text(
          "Sign Up as Tutor",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 24, 171, 136),
        title: Text(
          "Create Account",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 24, 171, 136),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _name,
                decoration: InputDecoration(labelText: "Name"),
              ),
              SizedBox(height: size.height * 0.030),
              TextField(
                controller: _email,
                decoration: InputDecoration(labelText: "Email"),
              ),
              SizedBox(height: size.height * 0.030),
              TextField(
                controller: _password,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              SizedBox(height: size.height * 0.030),
              TextField(
                controller: _confirmPassword,
                decoration: InputDecoration(labelText: "Re-Password"),
                obscureText: true,
              ),
              SizedBox(height: size.height * 0.030),

              // Gender Selection Dropdown
              DropdownButtonFormField<String>(

                value: _selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                },
                items: genders.map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Select Gender',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.030),

              // Country Selection Dropdown
              DropdownButtonFormField<String>(
                value: _selectedCountry,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCountry = newValue;
                  });
                },
                items: countries.map((country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Select Country',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.030),

              // Timezone Selection Dropdown
              DropdownButtonFormField<String>(
                value: _selectedTimeZone,
                onChanged: (newValue) {
                  setState(() {
                    _selectedTimeZone = newValue;
                  });
                },
                items: timeZones.map((zone) {
                  return DropdownMenuItem<String>(
                    value: zone,
                    child: Text(zone),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Select Timezone',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.030),

              // Checkboxes to agree to terms of use
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text("I can Teach", style: TextStyle(color: Colors.white)),
              ),

              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      activeColor: Colors.white,
                      checkColor: Colors.green,
                      value: _isChecked1,
                      onChanged: (value) {
                        setState(() {
                          _isChecked1 = value!;
                        });
                      },
                      title: Text("Recitation", style: TextStyle(color: Colors.white)),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      activeColor: Colors.white,
                      checkColor: Colors.green,
                      value: _isChecked2,
                      onChanged: (value) {
                        setState(() {
                          _isChecked2 = value!;
                        });
                      },
                      title: Text("Hifz", style: TextStyle(color: Colors.white)),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      activeColor: Colors.white,
                      checkColor: Colors.green,
                      value: _isChecked3,
                      onChanged: (value) {
                        setState(() {
                          _isChecked3 = value!;
                        });
                      },
                      title: Text("Arabic", style: TextStyle(color: Colors.white)),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      activeColor: Colors.white,
                      checkColor: Colors.green,
                      value: _isChecked4,
                      onChanged: (value) {
                        setState(() {
                          _isChecked4 = value!;
                        });
                      },
                      title: Text("Tajweed", style: TextStyle(color: Colors.white)),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.020),

              CheckboxListTile(
                activeColor: Colors.white,
                checkColor: Colors.green,
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
                title: Text("I have read and agree to the terms of use", style: TextStyle(color: Colors.white)),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: size.height * 0.060),

              // Sign Up button with GestureDetector to handle the tap
              Center(child: signUpButton),
              SizedBox(height: size.height * 0.060),

            ],
          ),
        ),
      ),
    );
  }
}
