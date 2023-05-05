import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
              builder: (context) => Course_01_data(),
            ),
          );
        },
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';

// import 'course_01_data.dart';

// class Course_01 extends StatefulWidget {
//   final auth = FirebaseAuth.instance;
//   FirebaseDatabase database = FirebaseDatabase.instance;

//   Course_01({super.key});

//   @override
//   State<Course_01> createState() => _Course_01State();
// }

// class _Course_01State extends State<Course_01> {
//   DatabaseReference ref = FirebaseDatabase.instance.ref('/Course_01');

//   late FirebaseFirestore _firestore;
//   late CollectionReference _collectionRef;

//   @override
//   void initState() {
//     super.initState();
//     _firestore = FirebaseFirestore.instance;
//     _collectionRef = _firestore.collection('myCollection');
//   }

//   Future<void> _addDocument() async {
//     try {
//       await _collectionRef.doc('myDocument').set({
//         'field1': 'value1',
//         'field2': 'value2',
//       });
//       print('Document added');
//     } catch (e) {
//       print('Error adding document: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GestureDetector(
//         child: SingleChildScrollView(
//           child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//             future: FirebaseFirestore.instance
//                 .collection('Courses')
//                 .doc('Course_01')
//                 .get(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData && snapshot.data != null) {
//                 final documentData = snapshot.data!.data();
//                 final fieldValue = documentData!['title'];
//                 return Text(fieldValue);
//               } else if (snapshot.hasError) {
//                 return Text('Error retrieving document: ${snapshot.error}');
//               } else {
//                 return const CircularProgressIndicator();
//               }
//             },
//           ),
//         ),
//         onTap: () {
//           _addDocument(); // call the function to add document to Firestore
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Course_01_data(),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
