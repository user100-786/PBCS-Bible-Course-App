import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/features/get_started_screen/sign_up_screen.dart';
import 'features/get_started_screen/first_screen.dart';
import 'features/get_started_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpScreen(),
      // home: LoginScreen(),
    );
  }
}
