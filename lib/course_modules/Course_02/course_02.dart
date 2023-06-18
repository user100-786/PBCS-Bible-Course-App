import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/course_modules/Course_02/course_part1_and_part2_screen.dart';

import 'part01/course_02_part01_data.dart';

class Course_02 extends StatefulWidget {
  final auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;

  Course_02({super.key});

  @override
  State<Course_02> createState() => _Course_02State();
}

class _Course_02State extends State<Course_02> {
  DatabaseReference ref = FirebaseDatabase.instance.ref('/Course_01');
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: const Text(
          'خُدا تعالیٰ کی وفاداری',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Jameel Noori Nastaleeq Kasheeda',
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),

        // ****** Firestore code to reteive title from the DB
        // child: SingleChildScrollView(
        //   child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        //     future: FirebaseFirestore.instance
        //         .collection('Courses')
        //         .doc('Course_01')
        //         .get(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData && snapshot.data != null) {
        //         final documentData = snapshot.data!.data();
        //         final fieldValue = documentData!['title'];
        //         return Text(fieldValue);
        //       } else if (snapshot.hasError) {
        //         return Text('Error retrieving document: ${snapshot.error}');
        //       } else {
        //         return const CircularProgressIndicator();
        //       }
        //     },
        //   ),
        // ),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseTwoPartsPage(),
            ),
          );
        },
      ),
    );
  }
}
