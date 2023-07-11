import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../constants/colors.dart';
import 'model_bottom_sheet/c3_bottom_sheet.dart';

class Course_03_data extends StatefulWidget {
  final auth = FirebaseAuth.instance;
  final String pdfUrl =
      "https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/courses%2Fcourse_03%2FBlessings%20for%20Nation.pdf?alt=media&token=dde13f8b-31d3-4d55-abbf-825a600a26b5";

  Course_03_data({super.key});

  @override
  State<Course_03_data> createState() => _Course_03_dataState();
}

class _Course_03_dataState extends State<Course_03_data> {
  int _pages = 0;
  int _currentPage = 0;
  String? _pdfPath;
  String? _fieldValue;

  @override
  void initState() {
    super.initState();
    _downloadPdf();
    _fetchDocumentData();
  }

  Future<void> _downloadPdf() async {
    final pdfFile = await DefaultCacheManager().getSingleFile(widget.pdfUrl);
    setState(() {
      _pdfPath = pdfFile.path;
    });
  }

  Future<void> _fetchDocumentData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Courses')
          .doc('Course_01')
          .get();

      if (snapshot.exists) {
        final documentData = snapshot.data();
        setState(() {
          _fieldValue = documentData?['content'];
        });
      }
    } catch (error) {
      print('Error fetching document data: $error');
    }
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
                  Text(
                    'Course_03',
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
              // const SizedBox(height: 20),
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

                    const CourseThreeModelBottomSheet(),
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
