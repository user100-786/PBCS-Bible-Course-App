import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/features/get_started_screen/login_screen.dart';
import '../../constants/colors.dart';
import '../../course_modules/courses_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: mediaQuery.size.width * 0.9,
          height: mediaQuery.size.height * 0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: mediaQuery.size.width * 0.15,
                  ),
                  const SizedBox(width: 20),
                  // Expanded(
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      color: appPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Calibri',
                      fontSize: 35,
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                  // ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  width: mediaQuery.size.width * 0.9,
                  height: mediaQuery.size.height * 0.15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: tSecondaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: tSecondaryColor,
                        spreadRadius: 5,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/courses.png',
                        width: mediaQuery.size.width * 0.2,
                      ),
                      const Text(
                        'Courses',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Calibri',
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoursesScreen(),
                    ),
                  );
                },
              ),
              
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: mediaQuery.size.width * 0.9,
                height: mediaQuery.size.height * 0.15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: tSecondaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: tSecondaryColor,
                      spreadRadius: 5,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/quiz.png',
                      width: mediaQuery.size.width * 0.2,
                    ),
                    const Text(
                      'Quizes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Calibri',
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: mediaQuery.size.width * 0.9,
                height: mediaQuery.size.height * 0.15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: tSecondaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: tSecondaryColor,
                      spreadRadius: 5,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/analytics.png',
                      width: mediaQuery.size.width * 0.2,
                    ),
                    const Text(
                      'Analytics',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Analytics',
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
