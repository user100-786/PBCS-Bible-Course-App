import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Course_02 extends StatefulWidget {
  final auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;

  Course_02({super.key});

  @override
  State<Course_02> createState() => _Course_02State();
}

class _Course_02State extends State<Course_02> {
  DatabaseReference ref = FirebaseDatabase.instance.ref('/Course_02');
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
          // return Text("hello world");
        },
        //),
        // child: FirebaseAnimatedList(
        //   query: ref,
        //   itemBuilder: (context, snapshot, animation, index) {
        //     // final key = snapshot.key;
        //     final value = snapshot.value;
        //     return ListTile(

        //       // subtitle: Text(value['description']),
        //     );
        //   },
      ),
      // child: Row(children: []),
    );
  }
}
