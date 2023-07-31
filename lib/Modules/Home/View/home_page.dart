






import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../Utils/custom_btn.dart';
import '../../Authentication/View/auth_page.dart';

class HomePage extends StatefulWidget {
  final String userEmail;

  HomePage({required this.userEmail});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late File _imageFile;
  final ImagePicker _picker = ImagePicker();
  String? _imageUrl; // Add a variable to store the image URL

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    // Initialize the image file with a default value (an empty file).
    _imageFile = File('');
    _fetchImageUrl(); // Fetch the image URL when the page loads
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile.path.isEmpty) return;

    // Upload the image to Firebase Storage
    final String uid = FirebaseAuth.instance.currentUser?.uid ?? "";
    final Reference ref = FirebaseStorage.instance.ref().child('users/${widget.userEmail}/$uid.jpg');
    final uploadTask = ref.putFile(_imageFile);

    // Get the download URL of the uploaded image
    final imageUrl = await (await uploadTask).ref.getDownloadURL();

    setState(() {
      _imageUrl = imageUrl;
    });

    // Show a success message or perform any other actions after upload
  }

  Future<void> _fetchImageUrl() async {
    try {
      final String uid = FirebaseAuth.instance.currentUser?.uid ?? "";
      final Reference ref = FirebaseStorage.instance.ref().child('users/${widget.userEmail}/$uid.jpg');
      final imageUrl = await ref.getDownloadURL();

      setState(() {
        _imageUrl = imageUrl;
      });
    } catch (e) {
      // Handle the error, e.g., if the image doesn't exist in Firebase Storage
      setState(() {
        _imageUrl = null;
      });
    }
  }
  Map<String, dynamic>? userData;



  void _fetchUserData() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(widget.userEmail).get();
      if (snapshot.exists) {
        setState(() {
          userData = snapshot.data() as Map<String, dynamic>;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Widget _buildCircularImage() {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => _showOptions(context),
      child: SizedBox(
        height: size.height*.30,
        width: size.width*.30,
        child: Container(
          width: size.width * 0.3,
          height: size.width * 0.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color:Color.fromARGB(255, 24, 171, 136),
              width: 2,
            ),
          ),
          child: _imageUrl != null && _imageUrl!.isNotEmpty
              ? CircleAvatar(
            backgroundImage: NetworkImage(_imageUrl!),
            radius: size.width * 0.15,
          )
              : Icon(
            Icons.person,color: Colors.black54,
            size: size.width * 0.27,
          ),
        ),
      ),
    );
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Pick from Gallery'),
              onTap: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text('Take a Photo'),
              onTap: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final name = userData?['name'] ?? '';
    // final email = userData?['email'] ?? '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 24, 171, 136),

        title: Text('Profile'),
        actions: [
          Center(child: Text("Upload Proflie Picture")),
          IconButton(
            onPressed: _uploadImage,
            icon: Icon(Icons.cloud_upload),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30,right: 30),
        height: size.height,
        width: size.width,

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCircularImage(),

              Text('$name',style: TextStyle(fontSize: 18),),
              // Text('$email'),
              SizedBox(height:size.height*.070 ,),

              Row(children: [
                Icon(Icons.price_change_outlined,color:Color.fromARGB(255, 24, 171, 136) ,),
                SizedBox(width:size.width*.030 ,),
                Text("Plans and pricing",),
              ],),
              SizedBox(height:size.height*.030 ,),
              Row(children: [
                Icon(Icons.person,color:Color.fromARGB(255, 24, 171, 136) ,),
                SizedBox(width:size.width*.030 ,),
                Text("Personal Info",),
              ],),
              SizedBox(height:size.height*.030 ,),
              Row(children: [
                Icon(Icons.location_on,color:Color.fromARGB(255, 24, 171, 136) ,),
                SizedBox(width:size.width*.030 ,),
                Text("Location",),
              ],),
              SizedBox(height:size.height*.030 ,),
              Row(children: [
                Icon(Icons.lock_sharp,color:Color.fromARGB(255, 24, 171, 136) ,),
                SizedBox(width:size.width*.030 ,),
                Text("Change Password",),
              ],),
              SizedBox(height:size.height*.030 ,),
              Row(children: [
                Icon(Icons.access_time_rounded,color:Color.fromARGB(255, 24, 171, 136) ,),
                SizedBox(width:size.width*.030 ,),
                Text("Time Logs",),
              ],),
              SizedBox(height:size.height*.030 ,),
              Row(children: [
                Icon(Icons.price_change_outlined,color:Color.fromARGB(255, 24, 171, 136) ,),
                SizedBox(width:size.width*.030 ,),
                Text("Invite Friends",),
              ],),
              SizedBox(height:size.height*.030 ,),
              Row(children: [
                Icon(Icons.menu_book_sharp,color:Color.fromARGB(255, 24, 171, 136) ,),
                SizedBox(width:size.width*.030 ,),
                Text("Quran Pak For Revision",),
              ],),
              SizedBox(height:size.height*.050 ,),
              InkWell(
                onTap: _logoutUser,
                child: Btn1(
                  color1: Color.fromARGB(255, 15, 220, 170),
                  hgt: size.height * 0.060,
                  txt: "Logout",
                  wdgt: size.width,
                  color2: Color.fromARGB(255, 15, 220, 170),
                ),
              ),
              SizedBox(height:size.height*.080 ,),


            ],
          ),
        ),
      ),
    );
  }
  void _logoutUser() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthPage()),
    );
  }
}








//
//
//
//
//
//
//
//
//
// // Text('Name: ${userData!['name']}'),
// // Text('Email: ${userData!['email']}'),
// // Text('Country: ${userData!['country']}'),
// // Text('Gender: ${userData!['gender']}'),
// // Text('Timezone: ${userData!['timezone']}'),
// // Text('Recitation: ${userData!['term1']}'),
// // Text('Hifz: ${userData!['term2']}'),
// // Text('Arabic: ${userData!['term3']}'),
// // Text('Tajweed: ${userData!['term4']}'),
// // Text('Agree to Terms: ${userData!['agreeToTerms']}'),
//
