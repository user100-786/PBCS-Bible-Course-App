import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

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
                  const SizedBox(width: 40),
                  // Expanded(
                    Text(
                      'خدا کا کلام',
                      style: TextStyle(
                        color: appPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Jameel Noori Nastaleeq Kasheeda',
                        fontSize: 50,
                      ),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                    ),
                  // ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'توریت زبور اور انجیل پر مبنی کورسز',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Jameel Noori Nastaleeq Kasheeda',
                  fontSize: 30,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: mediaQuery.size.height * 0.5,
                height: mediaQuery.size.height * 0.6,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color(0xffffdcbc),
                  boxShadow: [
                    BoxShadow(
                      color: tSecondaryColor,
                      spreadRadius: 5,
                      blurRadius: 15
                    ),
                  ]
                ),
                child: Image.asset(
                  'assets/sun_logo.png',
                  width: mediaQuery.size.width * 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
