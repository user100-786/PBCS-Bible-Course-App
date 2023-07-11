import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../../constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'c2_part2_bottom_sheet.dart';

class Course_02_part02_data extends StatefulWidget {
  final auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;
  Course_02_part02_data({super.key});
  final String pdfUrl =
      // Course 2 part one url
      //"https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/courses%2Fcourse_01%2FFaithfulness%20of%20God%20Part-1.pdf?alt=media&token=ec7af450-9bc7-4539-b375-1a5e087437c1";

      // Course 2 part two url
      "https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/courses%2Fcourse_02%2FFaithfulness%20of%20God%20Part-2.pdf?alt=media&token=1c42c788-23fe-4e81-be56-560c111d67a7";

  @override
  State<Course_02_part02_data> createState() => _Course_02_part02_dataState();
}

class _Course_02_part02_dataState extends State<Course_02_part02_data> {
  // Start of loading pdf file.......

  int _pages = 0;
  int _currentPage = 0;
  String? _pdfPath;

  @override
  void initState() {
    super.initState();
    _downloadPdf();
    // _loadFromFirebase();
  }

// load pdf file into firebase storage and than store the link into firebase firestore
  // Future<void> _loadFromFirebase() async {
  //   final storage = FirebaseStorage.instance;
  //   final ref = storage
  //       .ref()
  //       .child('/courses/course_02/Faithfulness of God Part-2.pdf');
  //   final url = await ref.getDownloadURL();

  //   setState(() {
  //     _pdfUrl = url;
  //     _isLoading = false;
  //   });
  //   storePdfUrlInFirestore(url);
  // }

  // Future<void> storePdfUrlInFirestore(String pdfUrl) async {
  //   try {
  //     final firestore = FirebaseFirestore.instance;
  //     final documentReference =
  //         firestore.collection('Courses').doc('Course_02');

  //     await documentReference.set({'pdf_02': pdfUrl});
  //     print('PDF URL stored in Firestore successfully.');
  //   } catch (error) {
  //     print('Error storing PDF URL in Firestore: $error');
  //   }
  // }

  // Ending of loading pdf file.......

  // final firestore =
  //     FirebaseFirestore.instance.collection("Courses").snapshots();
  // DatabaseReference ref = FirebaseDatabase.instance.ref('/Course_01');

  Future<void> _downloadPdf() async {
    final pdfFile = await DefaultCacheManager().getSingleFile(widget.pdfUrl);
    setState(() {
      _pdfPath = pdfFile.path;
    });
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    'Course_02',
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.80,
                child: Column(
                  children: [
                    // Use the get() method to retrieve the document data
                    Expanded(
                      child: _pdfPath != null
                          ? PDFView(
                              filePath: _pdfPath!,
                              autoSpacing: false,
                              onPageChanged: (int? page, int? total) {
                                setState(() {
                                  _currentPage = page!;
                                  _pages = total!;
                                });
                              },
                              onRender: (pages) {},
                              onError: (error) {
                                // print(error);
                                // Handle error while loading PDF
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Error'),
                                    content: Text('Failed to load PDF: $error'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : const Center(child: CircularProgressIndicator()),
                    ),

                    const Course02Part02ModelBottomSheet(),
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
