import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qutur_tutur_app/Modules/Authentication/View/auth_page.dart';
import 'package:qutur_tutur_app/Modules/Authentication/View/signin_page.dart';
import 'package:qutur_tutur_app/Utils/navigation_bar_pages.dart';
// import '../../../home_page.dart';
import '../../Home/View/home_page.dart';


class AuthenticationHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasData) {
            return NavigationPage();
          } else {
            return AuthPage();
          }
        }
      },
    );
  }
}
// HomePage(userEmail: snapshot.data!.email!);