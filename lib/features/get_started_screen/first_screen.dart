import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFDB515).withOpacity(0.82),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              width: mediaQuery.size.width * 0.9,
              height: mediaQuery.size.height * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        alignment: Alignment.centerRight,
                        width: mediaQuery.size.width * 0.15,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'خدا کا کلام',
                        style: TextStyle(
                          color: const Color(0xFFFDB515).withOpacity(0.82),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jameel Noori Nastaleeq Kasheeda',
                          fontSize: 50,
                        ),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  const Text(
                    'توریت زبور اور انجیل پر مبنی کورسز',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Jameel Noori Nastaleeq Kasheeda',
                        fontSize: 30),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    width: mediaQuery.size.height * 0.5,
                    height: mediaQuery.size.height * 0.6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: const Color(0xffffdcbc),
                    ),
                    child: Image.asset(
                      'assets/sun_logo.png',
                      alignment: Alignment.centerRight,
                      width: mediaQuery.size.width * 0.15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
