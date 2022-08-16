import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnflutter/routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffFFF5E6),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/tr6.png',
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 20.0),
            Text(
              "WELCOME SENPAI!",
              style: GoogleFonts.almendra(
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelStyle: GoogleFonts.almendra(fontSize: 24),
                            hintText: "Enter the username",
                            hintStyle: GoogleFonts.almendra(fontSize: 22),
                            labelText: "Username",
                            fillColor: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelStyle: GoogleFonts.almendra(fontSize: 24),
                            hintText: "Enter the Password",
                            hintStyle: GoogleFonts.almendra(fontSize: 22),
                            labelText: "Password",
                            fillColor: Colors.white),
                        obscureText: true,
                        // obscuringCharacter: "*",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    primary: const Color(0xffFFB649),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "LOGIN",
                    style: GoogleFonts.almendra(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
