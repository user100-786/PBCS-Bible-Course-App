import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Course_01_data extends StatefulWidget {
  final auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;
  Course_01_data({super.key});

  @override
  State<Course_01_data> createState() => _Course_01_dataState();
}

class _Course_01_dataState extends State<Course_01_data> {
  DatabaseReference ref = FirebaseDatabase.instance.ref('/Course_01');
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
                    'Course_01',
                    style: TextStyle(
                      color: appPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Calibri',
                      fontSize: 35,
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
                width: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                          // child: Text(
                          //   'تورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیا اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیا اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیا اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاء کی شہ اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیا اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیا اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیا اور صحیفۂ امبیاء کی شہادتتورات، زبور اور صحیفۂ امبیاادتتورات، زبور اور صحیفۂ امبیاء کی شہادت',
                          //   style: TextStyle(
                          //     // color: appPrimaryColor,
                          //     fontWeight: FontWeight.bold,
                          //     fontFamily: 'Jameel Noori Nastaleeq Kasheeda',
                          //     fontSize: 15,
                          //   ),
                          //   textAlign: TextAlign.center,
                          //   textDirection: TextDirection.rtl,
                          // ),

                          child: FirebaseAnimatedList(
                        query: ref,
                        itemBuilder: (context, snapshot, animation, index) {
                          return Text(
                            snapshot.child('/course_data').value.toString(),
                            style: const TextStyle(
                              // color: appPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Jameel Noori Nastaleeq Kasheeda',
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          );
                        },
                      )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
