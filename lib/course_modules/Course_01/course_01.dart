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
        child: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (context, snapshot, animation, index) {
            return ListTile(
              title: Text(
                snapshot.child('title').value.toString(),
                style: const TextStyle(
                  // color: appPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Jameel Noori Nastaleeq Kasheeda',
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            );
          },
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
