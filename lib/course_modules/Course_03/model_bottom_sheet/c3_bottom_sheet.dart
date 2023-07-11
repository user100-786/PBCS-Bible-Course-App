import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../lessons_audios/course_03__lesson1_audio.dart';
import '../lessons_audios/course_03__lesson2_audio.dart';
import '../lessons_audios/course_03__lesson3_audio.dart';
import '../lessons_audios/course_03__lesson4_audio.dart';
import '../lessons_audios/course_03__lesson5_audio.dart';
import '../lessons_audios/course_03_sabaq_ka_khulasa.dart';
import '../lessons_audios/course_03_taurf.dart';

class CourseThreeModelBottomSheet extends StatefulWidget {
  const CourseThreeModelBottomSheet({super.key});

  @override
  State<CourseThreeModelBottomSheet> createState() =>
      _CourseThreeModelBottomSheetState();
}

class _CourseThreeModelBottomSheetState
    extends State<CourseThreeModelBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
            useSafeArea: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            builder: (context) => Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: const Course03Taurf(),
                              // child: const Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [Text('Audio Files here...')],
                              // ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Course Taurf"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: const Course03Lesson01Audios(),
                              // child: const Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [Text('Audio Files here...')],
                              // ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Lesson 01"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: const Course03Lesson02Audios(),
                              // child: const Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [Text('Audio Files here...')],
                              // ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Lesson 02"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: const Course03Lesson03Audios(),
                              // child: const Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [Text('Audio Files here...')],
                              // ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Lesson 03"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: const Course03Lesson04Audios(),
                              // child: const Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [Text('Audio Files here...')],
                              // ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Lesson 04"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: const Course03Lesson05Audios(),
                              // child: const Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [Text('Audio Files here...')],
                              // ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Lesson 05"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            builder: (context) => Container(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: const Course03SabakKaKhulasa(),
                              // child: const Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [Text('Audio Files here...')],
                              // ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 2),
                        child: const Text("Sabaq ka khulasa"),
                      ),
                    ],
                  ),
                ));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: appPrimaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: const Text('Listen in Audio'),
    );
  }
}
