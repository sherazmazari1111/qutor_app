
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qutur_tutur_app/Modules/Authentication/View/auth_page.dart';
import 'package:qutur_tutur_app/Modules/Authentication/View/signin_page.dart';


Future<User?> createAccountForStudnet(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {

    UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    print("Account created Succesfull");
    User? user = userCrendetial.user;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }

    userCrendetial.user!.updateDisplayName(name);

    await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      "name": name,
      "email": email,
      "status": "Unavalible",
      "uid": _auth.currentUser!.uid,


    });

    return userCrendetial.user;
  } catch (e) {
    print(e);
    return null;
  }
}





Future<User?> createAccountForTutor(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {

    UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    print("Account created Succesfull");
    User? user = userCrendetial.user;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }

    userCrendetial.user!.updateDisplayName(name);

    await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      "name": name,
      "email": email,
      "status": "Unavalible",
      "uid": _auth.currentUser!.uid,
    });

    return userCrendetial.user;
  } catch (e) {
    print(e);
    return null;
  }
}







Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    print("Login Sucessfull");
    _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) => userCredential.user!.updateDisplayName(value['name']));

    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SignInPage()));
    });
  } catch (e) {
    print("error");
  }
}




Future logOut1(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => AuthPage()));
    });
  } catch (e) {
    print("error");
  }
}
Future order({ordername, ordernumber}) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  await FirebaseFirestore.instance.collection('orders')
  //.doc(FirebaseAuth.instance.currentUser!.email)
      .add({
    "email": FirebaseAuth.instance.currentUser!.email,
    "name": ordername.text,
    "order number": ordernumber.text,
  });
}