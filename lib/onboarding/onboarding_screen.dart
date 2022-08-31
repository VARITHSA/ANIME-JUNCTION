// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnflutter/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPage = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPage; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 10.0,
      width: isActive ? 25.0 : 13.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xff000000),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xffFFF5E6),
              Color(0xffFFECD0),
              Color(0xffFFD28F),
              Color(0xffFFB23E),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.loginPageRoute);
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: const Offset(2, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "SKIP",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 550.0,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: Stack(
                                children: [
                                  Center(
                                      child: Container(
                                    height: 300,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xffFFB649),
                                          Color(0xffFFF5E6),
                                        ],
                                        stops: [0.4, 0.9],
                                      ),
                                    ),
                                  )),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset(
                                      'assets/images/tr3.png',
                                      height: 380,
                                      width: 340,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                  "Hey! weebs we got everything you desire.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.almendra(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: Stack(
                                children: [
                                  Center(
                                      child: Container(
                                    height: 300,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xffFFB649),
                                          Color(0xffFFF5E6),
                                        ],
                                        stops: [0.4, 0.9],
                                      ),
                                    ),
                                  )),
                                  Align(
                                    alignment: Alignment(0.5, 1.5),
                                    // alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/tr9.png',
                                      // fit: BoxFit.fitWidth,
                                      height: 380,
                                      width: 500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              "We Recognize what you want Senpai We got Everything here!",
                              style: GoogleFonts.almendra(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: Stack(
                                children: [
                                  Center(
                                      child: Container(
                                    height: 300,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xffFFB649),
                                          Color(0xffFFF5E6),
                                        ],
                                        stops: [0.4, 0.9],
                                      ),
                                    ),
                                  )),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset(
                                      'assets/images/tr5.png',
                                      height: 370,
                                      width: 400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              "Let’s get started Senpai , Sign Up or Login and stay tuned for more",
                              style: GoogleFonts.almendra(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                // SizedBox(height: 20,),
                _currentPage != _numPage - 1
                    ? Padding(
                        padding: const EdgeInsets.only(top: 48.0),
                        child: Expanded(
                          child: Align(
                            alignment: FractionalOffset.centerRight,
                            child: FloatingActionButton(
                              backgroundColor: const Color(0xffffffff),
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xffFFB649),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                          top: 45.0,
                        ),
                        child: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.loginPageRoute);
                              },
                              style: ElevatedButton.styleFrom(
                                  alignment: Alignment.center,
                                  primary: Color(0xffffffff),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                      color: Color(0xffFFB649), fontSize: 16),
                                ),
                              )),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
