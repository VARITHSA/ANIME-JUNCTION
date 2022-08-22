import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static Future<void> signIn(
    Future<dynamic> a,
    String email,
    String password,
    Function callback,
  ) async {
    try {
      UserCredential a = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (a.user != null) {
        callback.call();
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static Future signOut(Function callback) async {
    try {
      await FirebaseAuth.instance.signOut();
      callback.call();
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static Future<void> signUP(
    Future<dynamic> b,
    String email,
    String password,
    Function callback,
  ) async {
    try {
      UserCredential a = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (a.user != null) {
        callback.call();
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
