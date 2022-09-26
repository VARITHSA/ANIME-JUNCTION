import 'package:carousel_slider/carousel_slider.dart';
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
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu_rounded),
              );
            },
          ),
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
        body: ListView(
          children: [
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/slide 1.jpg"),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/slide 5.jpg"),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/slide 3.jpg"),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/slide 4.jpg"),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/slide 5.jpg"),
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              ),
            ),
          ],
        ));
  }
}
