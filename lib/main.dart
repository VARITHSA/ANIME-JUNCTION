import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learnflutter/firebase_options.dart';
import 'package:learnflutter/onboarding/onboarding_screen.dart';
import 'package:learnflutter/pages/home_page.dart';
import 'package:learnflutter/pages/login_page.dart';
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
        Routes.loginPageRoute: (context) => const LoginPage(),
        Routes.homePageRoute: (context) => const HomePage(),
        Routes.signUpPageRoute: (context) => const SignUpPage()
      },
    );
  }
}

class MainBuild extends StatelessWidget {
  const MainBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          }),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: const Text('HI WELCOME'),
//       ),
//     );
//   }
// }
