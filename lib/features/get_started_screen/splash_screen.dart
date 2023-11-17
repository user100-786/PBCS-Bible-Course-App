import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/features/get_started_screen/login_screen.dart';
import 'first_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Navigator.pushNamed(context, '/first_screen.dart');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:(context) => const LoginScreen(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 200),
            // Text('Splash Screen'),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/first_screen');
            //   },
            //   child: const Text('Go to First Screen'),
            // ),
          ],
        ),
      ),
    );
  }
}