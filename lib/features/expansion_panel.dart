// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:pbcs_bible_course/constants/colors.dart';
// import 'package:pdf_text/pdf_text.dart';

// class ExpansionPanelDemo extends StatefulWidget {
//   final auth = FirebaseAuth.instance;
//   final String pdfUrl =
//       "https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/courses%2Fcourse_01%2FTLPP%20Text%20only%20Unicode%20complete.pdf?alt=media&token=34b78844-4a7b-4d37-9330-7691be96a41d";

//   ExpansionPanelDemo({Key? key}) : super(key: key);

//   @override
//   _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
// }

// class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
//   List<Item> _books = generateItems(1);
//   int _pages = 0;
//   int _currentPage = 0;
//   String? _pdfPath;
//   String? _fieldValue;

//   String docText = "";

//   @override
//   void initState() {
//     super.initState();
//     _downloadPdf();
//     // _fetchDocumentData();
//   }

//   Future<void> _downloadPdf() async {
//     final pdfFile = await DefaultCacheManager().getSingleFile(widget.pdfUrl);
//     setState(() {
//       _pdfPath = pdfFile.path;
//     });

//     PDFDoc doc = await PDFDoc.fromURL(_pdfPath!);
//     docText = await doc.text;
//   }

//   // Future<void> _fetchDocumentData() async {
//   //   try {
//   //     final snapshot = await FirebaseFirestore.instance
//   //         .collection('Courses')
//   //         .doc('Course_01')
//   //         .get();

//   //     if (snapshot.exists) {
//   //       final documentData = snapshot.data();
//   //       setState(() {
//   //         _fieldValue = documentData?['content'];
//   //       });
//   //     }
//   //   } catch (error) {
//   //     // print('Error fetching document data: $error');
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Courses'),
//         backgroundColor: appPrimaryColor,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.only(top: 80),
//           child: _buildPanel(),
//         ),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _books[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _books.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return const ListTile(
//               title: Text(
//                 "Course 01",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Gulzar-Regular',
//                   fontSize: 16,
//                 ),
//               ),
//             );
//           },
//           body: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
//             child: FutureBuilder<void>(
//               future: _downloadPdf(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return Text(
//                     docText,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Gulzar-Regular',
//                       fontSize: 16,
//                     ),
//                     textAlign: TextAlign.right,
//                     textDirection: TextDirection.ltr,
//                   );
//                 } else {
//                   // Show a loading indicator while waiting for the PDF to be downloaded and parsed
//                   return CircularProgressIndicator();
//                 }
//               },
//             ),
//           ),
//           isExpanded: item.isExpanded,
//         );
//       }).toList(),
//     );
//   }
// }

// // stores ExpansionPanel state information
// class Item {
//   Item({
//     required this.expandedValue,
//     required this.headerValue,
//     this.isExpanded = false,
//   });

//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
// }

// List<Item> generateItems(int numberOfItems) {
//   return List.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: 'Book $index',
//       expandedValue: 'Details for Book $index goes here',
//     );
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pdf_text/pdf_text.dart';

class ExpansionPanelDemo extends StatefulWidget {
  final String pdfUrl =
      "https://firebasestorage.googleapis.com/v0/b/pbcs-bible-course-81b4b.appspot.com/o/courses%2Fcourse_01%2FTLPP%20Text%20only%20Unicode%20complete.pdf?alt=media&token=34b78844-4a7b-4d37-9330-7691be96a41d";

  ExpansionPanelDemo({Key? key}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<Item> _books = generateItems(1);
  String _docText = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _downloadPdf();
  }

  Future<void> _downloadPdf() async {
    try {
      final pdfFile = await DefaultCacheManager().getSingleFile(widget.pdfUrl);
      setState(() {
        _isLoading = false;
      });

      print("PDF downloaded successfully!");
      PDFDoc doc = await PDFDoc.fromPath(pdfFile.path);
      _docText = await doc.text;
      print("PDF text extracted successfully!");

      setState(() {});
      print("PDF text length: ${_docText.length}");
    } catch (error) {
      print("Error downloading or extracting PDF: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        // backgroundColor: appPrimaryColor, // Add your custom color here
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 80),
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _books[index].isExpanded = !isExpanded;
        });
      },
      children: _books.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Text(
                "Course 01",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gulzar-Regular',
                  fontSize: 16,
                ),
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
            child: _isLoading
                ? CircularProgressIndicator()
                : Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: SingleChildScrollView(
                        child: Text(
                          _docText,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gulzar-Regular',
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    ),
                  ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Book $index',
      expandedValue: 'Details for Book $index goes here',
    );
  });
}
