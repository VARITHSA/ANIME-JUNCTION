import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnflutter/core/auth_services.dart';
import 'package:learnflutter/routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
            const SizedBox(
              height: 15,
            ),
            Text(
              "REGISTER SENPAI",
              style: GoogleFonts.almendra(
                fontSize: 40,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelStyle: GoogleFonts.almendra(fontSize: 20),
                        hintText: "Enter the username",
                        hintStyle: GoogleFonts.almendra(fontSize: 15),
                        labelText: "Username",
                        fillColor: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        labelStyle: GoogleFonts.almendra(fontSize: 20),
                        hintText: "Enter the Password",
                        hintStyle: GoogleFonts.almendra(fontSize: 15),
                        labelText: "Password",
                        fillColor: Colors.white),
                    obscureText: true,
                    // obscuringCharacter: "*",
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        labelStyle: GoogleFonts.almendra(fontSize: 20),
                        hintText: " Password",
                        hintStyle: GoogleFonts.almendra(fontSize: 15),
                        labelText: "Confirm the Password",
                        fillColor: Colors.white),
                    obscureText: true,
                    // obscuringCharacter: "*",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => AuthServices.signUP(
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xffFFB649),
                    ),
                  ),
                ),
                emailController.text.trim(),
                passwordController.text.trim(),
                () {
                  Navigator.pushNamed(context, Routes.homePageRoute);
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
                "SIGNUP",
                style: GoogleFonts.almendra(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
