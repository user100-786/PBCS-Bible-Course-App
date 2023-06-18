import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyPdfViewer extends StatefulWidget {
  const MyPdfViewer({Key? key}) : super(key: key);

  @override
  _MyPdfViewerState createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<MyPdfViewer> {
  String? _pdfUrl;
  final firestore = FirebaseFirestore.instance.collection("Course02");

  late int i;

  @override
  void initState() {
    super.initState();
    // for (i; i < 10; i++) {
    //   this.i = i;
    storeAudios();
    // }
  }

  storeAudios() {
    for (int i = 1; i <= 10; i++) {
      getPdf(i);
    }
  }

  // Future<void> getPdf() async {
  //   try {
  //     final ref = FirebaseStorage.instance
  //         .ref()
  //         .child('/courses/course_03/Blessings for Nation.pdf');
  //     final url = await ref.getDownloadURL();
  //     _pdfUrl = url;
  //     // Store the PDF link in Firestore
  //     await firestore.doc('Course_03').set({'Link': _pdfUrl});
  //     setState(() {});
  //   } catch (error) {
  //     Fluttertoast.showToast(
  //       msg: 'Error: $_pdfUrl',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 5,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0,
  //     );
  //   }
  // }

  Future<void> getPdf(int i) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('/audios/Course02/Part01/Taruf.mp3');
      final url = await ref.getDownloadURL();
      _pdfUrl = url;
      // Store the PDF link in Firestore
      await firestore.doc('Taruf').set({'Link': _pdfUrl});
      setState(() {});
    } catch (error) {
      Fluttertoast.showToast(
        msg: 'Error: $_pdfUrl',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: _pdfUrl != null
          ? PDFView(
              filePath: _pdfUrl,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageSnap: true,
              onPageChanged: (int? page, int? total) {
                print('page change: $page/$total');
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
