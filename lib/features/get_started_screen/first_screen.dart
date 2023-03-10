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
                        width: mediaQuery.size.width * 0.25,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'KHUDA KA KALAM',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    width: mediaQuery.size.height*0.5,
                    height: mediaQuery.size.height*0.6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color:
                          const Color(0xffffdcbc),
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
