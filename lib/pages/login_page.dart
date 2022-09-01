import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnflutter/core/auth_services.dart';
import 'package:learnflutter/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter the email address";
                            }
                            log(value);
                            return null;
                          },
                          controller: emailcontroller,
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
                          Radius.circular(18),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter the password";
                            }
                            log(value);
                            return null;
                          },
                          textInputAction: TextInputAction.done,
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
                    height: 40.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      bool res = formKey.currentState?.validate() ?? false;
                      if (res) {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xffFFB649),
                            ),
                          ),
                        );
                        await AuthServices.signIn(emailcontroller.text.trim(),
                            passwordController.text.trim(), () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.homePageRoute);
                        }, () {
                          Navigator.of(context).pop();
                          const SnackBar(
                            content: Text("ENTER THE VALID EMAIL"),
                          );
                        });
                      }
                    },
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
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have an account",
                        style: GoogleFonts.almendra(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: (() {
                          Navigator.pushNamed(context, Routes.signUpPageRoute);
                        }),
                        child: Text(
                          "SIGN UP",
                          style: GoogleFonts.almendra(
                              fontSize: 18, color: const Color(0xffFFB649)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
