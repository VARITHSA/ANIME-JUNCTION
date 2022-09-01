import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static Future<void> signIn(
    String email,
    String password,
    Function? onSuccessCallback,
    Function? onExceptionCallback,
  ) async {
    try {
      UserCredential a = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (a.user != null) {
        onSuccessCallback?.call();
      }
    } on Exception {
      onExceptionCallback?.call();
    }
  }

  static Future<void> signOut(Function callback) async {
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
