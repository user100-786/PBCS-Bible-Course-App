import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ResultScreen extends StatefulWidget {
  final int correctAnswer;
  const ResultScreen({super.key, required this.correctAnswer});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
        backgroundColor: appPrimaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width * .5,
              image: AssetImage('assets/logo.png')
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .1,),
          Center(
              child: Text('آپ نے 10 سوالوں مین سے ' + widget.correctAnswer.toString() + ' سوالوں کے جواب سہی دئیے ہیں ',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.center,
              ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .3,),
        ],
      )
    );
  }
}
