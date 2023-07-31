import 'package:firebase_auth/firebase_auth.dart';

class EmailPasswordService {
  onCreateUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    UserCredential userCredential = await auth
        .createUserWithEmailAndPassword(
        email: "numanshakir248@gmail.com", password: "123456")
        .catchError((error) {
      print("Exception creating user");
      print(error);
    });
    await userCredential.user!.sendEmailVerification();
    print(userCredential.user!.email);
    print(userCredential.user!.uid);
  }

  onSignInUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    UserCredential userCredential = await auth
        .signInWithEmailAndPassword(
        email: "numanshakir248@gmail.com", password: "123123")
        .catchError((error) {
      print("Exception creating user");
      print(error);
    });
    await userCredential.user!.sendEmailVerification();
    print(userCredential.user!.email);
    print(userCredential.user!.emailVerified);
    print(userCredential.user!.uid);
  }

  onForgotPassword() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.sendPasswordResetEmail(email: "numanshakir248@gmail.com");
  }
}