import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learnflutter/firebase_options.dart';
import 'package:learnflutter/onboarding/onboarding_screen.dart';
import 'package:learnflutter/pages/signup_page.dart';
import 'package:learnflutter/routes.dart';

//main runs whenver your app launches first time \\
//async
// https://stackoverflow.com/questions/63873338/what-does-widgetsflutterbinding-ensureinitialized-do
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
      routes: {
        Routes.signUpPageRoute: (context) => const SignupPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('HI WELCOME'),
      ),
    );
  }
}
