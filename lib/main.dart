import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbcs_bible_course/features/get_started_screen/sign_up_screen.dart';
import 'audio_module/audio_file_page.dart';
import 'course_modules/Course_01/showPdfOnScreen/pdf.dart';
import 'features/get_started_screen/first_screen.dart';
import 'features/get_started_screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'features/get_started_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // lock the landscape mode...
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    Firebase.initializeApp();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
      // home: const SignUpScreen(),
      // home: LoginScreen(),
    );
  }
}
