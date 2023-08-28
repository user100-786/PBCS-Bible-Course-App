import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayFormattedText extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formatted Text"),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: firestore.collection('urduText').doc('documentId').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          String formattedText = snapshot.data!['content'];

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Text(
              formattedText,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          );
        },
      ),
    );
  }
}
