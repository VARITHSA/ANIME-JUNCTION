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
      appBar: AppBar(
        backgroundColor: const Color(0xffFFB649),
        title: Text(
          "HEY Weeb",
          style: GoogleFonts.almendra(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => AuthServices.signOut(() => Navigator.of(context)
                .pushReplacementNamed(Routes.loginPageRoute)),
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      backgroundColor: const Color(0xffFFF5E6),
      body: Column(
        children: [
          const SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Today's Grossing for you",
              style: GoogleFonts.almendra(
                fontSize: 35,
              ),
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
    );
  }
}
