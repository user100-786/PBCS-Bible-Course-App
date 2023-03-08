import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDB515).withOpacity(0.82),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: 400,
          height: 550,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                alignment: Alignment.centerRight,
                width: 100,
                height: 100,
              ),

              // ignore: prefer_const_constructors
              SizedBox(
                width: 20,
              ),
              const Text(
                'KHUDA KA KALAM',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
