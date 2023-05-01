import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'course_01_data.dart';

class Course_01 extends StatefulWidget {
  final auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;

  Course_01({super.key});

  @override
  State<Course_01> createState() => _Course_01State();
}

class _Course_01State extends State<Course_01> {
  DatabaseReference ref = FirebaseDatabase.instance.ref('/Course_01');
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: SingleChildScrollView(
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('Courses')
                .doc('Course_01')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                final documentData = snapshot.data!.data();
                final fieldValue = documentData!['title'];
                return Text(fieldValue);
              } else if (snapshot.hasError) {
                return Text('Error retrieving document: ${snapshot.error}');
              } else {
                return const Text('Loading...');
              }
            },
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Course_01_data(),
            ),
          );
        },
      ),
    );
  }
}
