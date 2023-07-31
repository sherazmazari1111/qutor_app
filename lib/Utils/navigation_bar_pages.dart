import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qutur_tutur_app/Modules/Home/View/class_room_page.dart';

import '../Modules/Home/View/home_page.dart';
import '../Modules/Home/View/messages_page.dart';
import '../Modules/Home/View/tutors_page.dart';



class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

final List<Widget> _pages = [
  TutorsPage(),
  MessagesPage(),
  ClassRoomPage(),
  HomePage(userEmail: FirebaseAuth.instance.currentUser!.email!),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
 type:BottomNavigationBarType.fixed ,
selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;

          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tutors',
          ),
BottomNavigationBarItem(
  icon: Icon(Icons.chat),
  label: 'Messages',
),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv_sharp),
            label: 'Classroom',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        backgroundColor:Color.fromARGB(255, 24, 171, 136),

      ),
    );
  }
}






