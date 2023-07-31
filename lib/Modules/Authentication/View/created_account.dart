// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qutur_tutur_app/Modules/Authentication/View/auth_page.dart';
// import 'package:qutur_tutur_app/home_page.dart';
//
// import '../../../Utils/custom_btn.dart';
// import '../../../Utils/custom_textfield.dart';
//
//
// class CreatedAccountSuccessfully extends StatefulWidget {
//   CreatedAccountSuccessfully({Key? key}) : super(key: key);
//
//   @override
//   State<CreatedAccountSuccessfully> createState() => _CreatedAccountSuccessfullyState();
// }
//
// class _CreatedAccountSuccessfullyState extends State<CreatedAccountSuccessfully> {
//   final _name = TextEditingController();
//   final _email = TextEditingController();
//   final _password = TextEditingController();
//   final _confirmPassword = TextEditingController();
//
//   final _gender = TextEditingController();
//   final _price = TextEditingController();
//   final _country = TextEditingController();
//   final _timezone = TextEditingController();
//
//
//
//   bool _isChecked = false;
//   bool _isChecked1 = false;
//   bool _isChecked2 = false;
//   bool _isChecked3 = false;
//   bool _isChecked4 = false;
//
//
//   String? _selectedGender;
//   String? _selectedprice;
//
//   String? _selectedCountry;
//   String? _selectedTimeZone;
//
//
//   List<String> selectgenders = ['Male', 'Female'];
//   List<String> selectedprice = ['Dollars 3-5', 'Dollars 5-10'];
//   List<String> countries = ['Pakistan', 'Arabs', 'India', 'Bangladesh'];
//   List<String> timeZones = [
//     'Timezone 1',
//     'Timezone 2',
//     'Timezone 3',
//     'Timezone 4',
//   ];
//
//   // Helper function to check if at least one of the four checkboxes is selected
//   bool isAtLeastOneCheckboxSelected() {
//     return _isChecked1 || _isChecked2 || _isChecked3 || _isChecked4;
//   }
//
//   // Helper function to check if all necessary checkboxes are checked
//   bool areAllCheckboxesSelected() {
//     return _isChecked && isAtLeastOneCheckboxSelected();
//   }
//
//
//   void performSignUp() async {
//     String gender = _selectedGender ?? '';
//         String price = _selectedprice ?? '';
//         String country = _selectedCountry ?? '';
//         String timeZone = _selectedTimeZone ?? '';
//
//         List<String> teachingSubjects = [];
//         if (_isChecked1) teachingSubjects.add('Recitation');
//         if (_isChecked2) teachingSubjects.add('Hifz');
//         if (_isChecked3) teachingSubjects.add('Arabic');
//         if (_isChecked4) teachingSubjects.add('Tajweed');
//     //
//         CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
//     try {
//       // Sign up the user with email and password
//       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _email.text,
//         password: _password.text, // Replace with the desired password
//       );
//
//       // Store additional user data in Firestore
//       CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
//       await usersCollection.doc(userCredential.user!.uid).set({
//         'email': _email.text,
//         'name': _name.text,
//         'gender': _gender.text,
//         'country': _country.text,
//         'recitation': _isChecked1,
//         'hifz': _isChecked2,
//         'arabic': _isChecked3,
//         'tajweed': _isChecked4,
//       });
//
//       // Navigate to the home page after successful sign-up
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
//     } catch (e) {
//       print('Error signing up: $e');
//       // Show an error dialog or snackbar
//     }
//   }
//
//
//   // Placeholder sign-up function (Replace this with your actual sign-up logic)
//
//
//   // void performSignUp() async {
//   //   if (areAllCheckboxesSelected()) {
//   //     // Add your sign-up code here
//   //
//   //     // Example: Saving user data to Firestore
//   //
//   //     String gender = _selectedGender ?? '';
//   //     String price = _selectedprice ?? '';
//   //     String country = _selectedCountry ?? '';
//   //     String timeZone = _selectedTimeZone ?? '';
//   //
//   //     List<String> teachingSubjects = [];
//   //     if (_isChecked1) teachingSubjects.add('Recitation');
//   //     if (_isChecked2) teachingSubjects.add('Hifz');
//   //     if (_isChecked3) teachingSubjects.add('Arabic');
//   //     if (_isChecked4) teachingSubjects.add('Tajweed');
//   //
//   //     CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
//   //
//   //     try {
//   //       await usersCollection.add({
//   //
//   //         'gender': gender,
//   //         'price': price,
//   //         'country': country,
//   //         'timeZone': timeZone,
//   //         'teachingSubjects': teachingSubjects, // Saving checkboxes as a list
//   //       });
//   //
//   //       // Show a success message using Get.snackbar:
//   //       Get.snackbar('Success', 'Sign up as a tutor successful!');
//   //
//   //       Get.to(Homepage());
//   //     } catch (e) {
//   //       print('Error saving data: $e');
//   //     }
//   //   }
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     // Sign Up button with GestureDetector to handle the tap
//     GestureDetector signUpButton = GestureDetector(
//       onTap: performSignUp, // Call the sign-up function when the button is tapped
//       child: ElevatedButton(
//
//         onPressed: areAllCheckboxesSelected() ? performSignUp : null,
//         style: ElevatedButton.styleFrom(
//           primary: areAllCheckboxesSelected()
//               ? Color.fromARGB(255, 15, 220, 170)
//               : Colors.grey,
//           padding: EdgeInsets.symmetric(vertical: size.height * 0.020,horizontal: size.width*.25),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           // Get.off(AuthPage())
//         ),
//         child: Text(
//           "Sign Up as Tutor",
//           style: TextStyle(color: Colors.white, fontSize: 16),
//         ),
//       ),
//     );
//
//     return Scaffold(
//
//       backgroundColor: Color.fromARGB(255, 24, 171, 136),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//
//               Center(
//                 child: Container(
//                   height: size.height*.085,
//                   width: size.width*.15,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(100),
//
//                   ),
//                   child: Icon(Icons.done,color: Colors.green,size: 45,),
//                 ),
//               ),
//              // Icon(Icons.done),
//               SizedBox(height: size.height * 0.030),
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
//               // Gender Selection Dropdown
//
//               SizedBox(height: size.height * 0.030),
//
//               // Gender Selection Dropdown
//               DropdownButtonFormField<String>(
//
//                 value: _selectedGender,
//                 items: ['Male', 'Female', 'Other'].map((String gender) {
//                   return DropdownMenuItem<String>(
//                     value: gender,
//                     child: Text(gender),
//                   );
//                 }).toList(),
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedGender = newValue;
//                   });
//                 },
//
//                 decoration: InputDecoration(
//                   labelText: 'Select gender',
//                   labelStyle: TextStyle(color: Colors.white),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.030),
//
//               // Gender Selection Dropdown
//               SizedBox(height: size.height * 0.030),
//
//               // Gender Selection Dropdown
//               DropdownButtonFormField<String>(
//
//                 value: _selectedprice,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedprice = newValue;
//                   });
//                 },
//                 items: selectedprice.map((rate) {
//                   return DropdownMenuItem<String>(
//                     value: rate,
//                     child: Text(rate),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   labelText: 'Select price',
//                   labelStyle: TextStyle(color: Colors.white),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//               ),
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
//                 child: Text("I can Teach", style: TextStyle(color: Colors.white)),
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
//                       title: Text("Recitation", style: TextStyle(color: Colors.white)),
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
//                           _isChecked3 = value!;
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
//               Center(child: signUpButton),
//               SizedBox(height: size.height * 0.060),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qutur_tutur_app/Utils/navigation_bar_pages.dart';
import '../../../Utils/custom_btn.dart';
import '../../Home/View/home_page.dart';
// import '../../../home_page.dart';


class AdditionalDataPage extends StatefulWidget {
  final String userEmail;

  AdditionalDataPage({required this.userEmail});

  @override
  _AdditionalDataPageState createState() => _AdditionalDataPageState();
}

class _AdditionalDataPageState extends State<AdditionalDataPage> {
  TextEditingController _nameController = TextEditingController();
  String? _selectedGender;
  String? _selectedCountry;
  String? _selectedTimezone;

  List<String> _genders = ['Male', 'Female', 'Other'];
  List<String> _countries = ['USA', 'Canada', 'UK', 'India', 'Australia'];

  bool _term1Checked = false;
  bool _term2Checked = false;
  bool _term3Checked = false;
  bool _term4Checked = false;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor:Color.fromARGB(255, 24, 171, 136),


      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Center(
                child: Container(
                  height: size.height*.085,
                  width: size.width*.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),

                  ),
                  child: Icon(Icons.done,color: Colors.green,size: 45,),
                ),
              ),
              SizedBox(height: size.height * 0.015),

              Center(
                child: Text("Congratulations !",
                style: TextStyle(color: Colors.white,fontSize: 20),
                ),
              ),
              Center(
                child: Text(" You have successfully",
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),
              ),
              Center(
                child: Text(" created your Qutor account",
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),
              ),
              SizedBox(height: size.height * 0.030),


              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white), //
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Change focused border color
                    ),
                    labelText: 'Name'),
              ),
              SizedBox(height: size.height * 0.030),

              DropdownButtonFormField<String>(
                value: _selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                },
                items: _genders.map((gender) {
                  return DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
               decoration: InputDecoration(
                  // labelText: 'Select ',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                hint: Text('Select Gender',style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: size.height * 0.030),

              DropdownButtonFormField<String>(
                value: _selectedCountry,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCountry = newValue;
                  });
                },
                items: _countries.map((country) {
                  return DropdownMenuItem(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                decoration: InputDecoration(
                  // labelText: 'Select Timezone',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                hint: Text('Select Country',style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: size.height * 0.030),

              DropdownButtonFormField<String>(
                value: _selectedTimezone,
                onChanged: (newValue) {
                  setState(() {
                    _selectedTimezone = newValue;
                  });
                },
                items: [
                  'UTC-12:00',
                  'UTC-11:00',
                  'UTC-10:00',
                  'UTC-09:00',
                  'UTC-08:00',
                  // Add more timezones...
                ].map((timezone) {
                  return DropdownMenuItem(

                    value: timezone,
                    child: Text(timezone),
                  );
                }).toList(),
                decoration: InputDecoration(
                  // labelText: 'Select Timezone',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                hint: Text('Select Timezone',style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: size.height * 0.030),

              Text('I want to learn',style: TextStyle(color: Colors.grey.shade300),),
              Row(
                children: [
                  // Spacer(),
                  Checkbox(

                    activeColor: Colors.white,
                    checkColor: Colors.green,
                    value: _term1Checked,
                    onChanged: (value) {
                      setState(() {
                        _term1Checked = value!;

                      });
                    },

                  ),

                  Text('Recitation'),
                  // SizedBox(width: size.width * 0.080),
                  Spacer(),
                  // Spacer(),

                  Checkbox(
                    activeColor: Colors.white,
                    checkColor: Colors.green,
                    value: _term2Checked,
                    onChanged: (value) {
                      setState(() {
                        _term2Checked = value!;
                      });
                    },
                  ),
                  Text('Hifz'),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),

                ],
              ),
              Row(
                children: [
                  Checkbox(

                    activeColor: Colors.white,
                    checkColor: Colors.green,
                    value: _term3Checked,
                    onChanged: (value) {
                      setState(() {
                        _term3Checked = value!;
                      });
                    },
                  ),
                  Text('Arabic'),
                  // SizedBox(width: size.width * 0.080),
                  Spacer(),
                  Spacer(),
                  Spacer(),


                  Checkbox(
                    activeColor: Colors.white,
                    checkColor: Colors.green,
                    value: _term4Checked,
                    onChanged: (value) {
                      setState(() {
                        _term4Checked = value!;
                      });
                    },
                  ),
                  Text('Tajweed'),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),

                ],
              ),
              SizedBox(height: size.height * 0.030),

              CheckboxListTile(
                activeColor: Colors.white,
                checkColor: Colors.green,
                title: Text('I read and agree to the terms of use'),

                value: _agreeToTerms,
                onChanged: (value) {
                  setState(() {
                    _agreeToTerms = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: size.height * 0.030),
              InkWell(
                onTap:  _saveUserDataToFirestore,
                child: Btn1(
                  color1: Color.fromARGB(255, 15, 220, 170),
                  hgt: size.height * 0.060,
                  txt: "Sign Up as Student",
                  wdgt: size.width,
                  color2: Color.fromARGB(255, 15, 220, 170),
                ),
              ),
              SizedBox(height: size.height * 0.030),

              // ElevatedButton(
              //   onPressed: _signUpUser,
              //   child: Text('Sign Up'),
              // ),

            ],
          ),
        ),
      ),
    );
  }

  void _saveUserDataToFirestore() async {
    // Check if at least one checkbox is selected and user agrees to terms
    if (!_term1Checked && !_term2Checked && !_term3Checked && !_term4Checked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select at least one preferred option.')),
      );
      return;
    }

    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please agree to the terms of use.')),
      );
      return;
    }

    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      await users.doc(widget.userEmail).set({
        'name': _nameController.text.trim(),
        'email': widget.userEmail,
        'country': _selectedCountry,
        'gender': _selectedGender,
        'timezone': _selectedTimezone,
        'term1': _term1Checked,
        'term2': _term2Checked,
        'term3': _term3Checked,
        'term4': _term4Checked,
        'agreeToTerms': _agreeToTerms,
      });
      Get.snackbar("Data Save", "Successfully");


      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavigationPage()),
      );
    } catch (e) {
      print('Error saving data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again later.')),
      );
    }
  }
}
// HomePage(userEmail: widget.userEmail)