import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbcs_bible_course/features/get_started_screen/dashboard.dart';
import 'package:pbcs_bible_course/features/show_courses_screen.dart';
import 'features/get_started_screen/first_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  // lock the landscape mode...
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]).then(
  //   (_) {
  //     // Firebase.initializeApp();

  //   },
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExpansionPanelDemo(),
      // home: const SignUpScreen(),
      // home: LoginScreen(),
    );
  }
}
