import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnflutter/core/auth_services.dart';
import 'package:learnflutter/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text(user.email!)),
          ElevatedButton(
            onPressed: () => AuthServices.signOut(
              () {
                Navigator.pushNamed(context, Routes.loginPageRoute);
              },
            ),
            style: ElevatedButton.styleFrom(
              elevation: 5.0,
              primary: const Color(0xffFFB649),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              "LOGot",
              style: GoogleFonts.almendra(
                  fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
