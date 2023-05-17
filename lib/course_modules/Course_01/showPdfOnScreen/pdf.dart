// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';

// class MyPdfViewer extends StatefulWidget {
//   final String pdfUrl;

//   const MyPdfViewer({Key? key, required this.pdfUrl}) : super(key: key);

//   @override
//   _MyPdfViewerState createState() => _MyPdfViewerState();
// }

// class _MyPdfViewerState extends State<MyPdfViewer> {
//   int _pages = 0;
//   int _currentPage = 0;
//   String? _pdfPath;

//   @override
//   void initState() {
//     super.initState();
//     _downloadPdf();
//   }

//   Future<void> _downloadPdf() async {
//     final pdfFile = await DefaultCacheManager().getSingleFile(widget.pdfUrl);
//     setState(() {
//       _pdfPath = pdfFile.path;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PDF Viewer'),
//       ),
//       body: _pdfPath != null
//           ? PDFView(
//               filePath: _pdfPath!,
//               onPageChanged: (int? page, int? total) {
//                 setState(() {
//                   _currentPage = page!;
//                   _pages = total!;
//                 });
//               },
//               onRender: (_pages) {},
//               onError: (error) {
//                 print(error);
//                 // Handle error while loading PDF
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: const Text('Error'),
//                     content: Text('Failed to load PDF: $error'),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text('OK'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             )
//           : const Center(child: CircularProgressIndicator()),
//     );
//   }
// }

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
  final firestore = FirebaseFirestore.instance.collection("Courses");

  @override
  void initState() {
    super.initState();
    getPdf();
  }

  Future<void> getPdf() async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('/courses/course_02/Faithfulness of God Part-2.pdf');
      final url = await ref.getDownloadURL();
      _pdfUrl = url;
      // Store the PDF link in Firestore
      await firestore.doc('Course_01').set({'pdf_02': _pdfUrl});
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
        title: Text('PDF Viewer'),
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












// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_pdfview/flutter_pdfview.dart';
// // // import 'package:firebase_storage/firebase_storage.dart';
// // // import 'package:fluttertoast/fluttertoast.dart';

// // // class MyPdfViewer extends StatefulWidget {
// // //   const MyPdfViewer({super.key});

// // //   @override
// // //   _MyPdfViewerState createState() => _MyPdfViewerState();
// // // }

// // // class _MyPdfViewerState extends State<MyPdfViewer> {
// // //   String? _pdfUrl;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     getPdf();
// // //   }

// // //   Future<void> getPdf() async {
// // //     try {
// // //       final ref = FirebaseStorage.instance
// // //           .ref()
// // //           .child('Faithfulness of God Part-1.pdf');
// // //       final url = await ref.getDownloadURL();
// // //       _pdfUrl = url;
// // //       setState(() {});
// // //     } catch (error) {
// // //       Fluttertoast.showToast(
// // //         msg: 'Error: $_pdfUrl',
// // //         toastLength: Toast.LENGTH_SHORT,
// // //         gravity: ToastGravity.CENTER,
// // //         timeInSecForIosWeb: 5,
// // //         backgroundColor: Colors.red,
// // //         textColor: Colors.white,
// // //         fontSize: 16.0,
// // //       );
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('PDF Viewer'),
// // //       ),
// // //       body: _pdfUrl != null
// // //           ? PDFView(
// // //               filePath: _pdfUrl,
// // //               enableSwipe: true,
// // //               swipeHorizontal: true,
// // //               autoSpacing: false,
// // //               pageSnap: true,
// // //               onPageChanged: (int? page, int? total) {
// // //                 print('page change: $page/$total');
// // //               },
// // //             )
// // //           : const Center(child: CircularProgressIndicator()),
// // //     );
// // //   }
// // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'package:firebase_storage/firebase_storage.dart';
// // // // import 'package:flutter_pdfview/flutter_pdfview.dart';

// // // // class PdfViewer extends StatefulWidget {
// // // //   @override
// // // //   _PdfViewerState createState() => _PdfViewerState();
// // // // }

// // // // class _PdfViewerState extends State<PdfViewer> {
// // // //   String? _pdfUrl;

// // // //   // Future<void> _fetchPdfUrl() async {
// // // //   //   final ref = FirebaseStorage.instance.ref().child('/courses/Faithfulness of God Part-1.pdf');
// // // //   //   final url = await ref.getDownloadURL();
// // // //   //   setState(() {
// // // //   //     _pdfUrl = url;
// // // //   //   });
// // // //   // }

// // // //   Future<void> _fetchPdfUrl() async {
// // // //     final ref = FirebaseStorage.instance
// // // //         .ref()
// // // //         .child('/courses/Faithfulness of God Part-1.pdf');
// // // //     final url = await ref.getDownloadURL();
// // // //     setState(() {
// // // //       _pdfUrl = url;
// // // //     });
// // // //     print('Download URL: $_pdfUrl');
// // // //     ScaffoldMessenger.of(context).showSnackBar(
// // // //       SnackBar(
// // // //         content: Text('Download URL: $_pdfUrl'),
// // // //       ),
// // // //     );
// // // //   }

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _fetchPdfUrl();
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text('PDF Viewer Demo'),
// // // //       ),
// // // //       body: Center(
// // // //         child: _pdfUrl == null
// // // //             ? const CircularProgressIndicator()
// // // //             : PDFView(
// // // //                 filePath: _pdfUrl!,
// // // //               ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
