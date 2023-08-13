// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pbcs_bible_course/features/display_formated_text.dart';
// import 'package:pbcs_bible_course/features/get_started_screen/dashboard.dart';
// import 'package:pbcs_bible_course/features/expansion_panel.dart';
// // import 'package:pbcs_bible_course/features/display_formated_text.dart';
// import 'package:pbcs_bible_course/features/upload_data.dart';
// import 'features/get_started_screen/first_screen.dart';
// import 'package:firebase_core/firebase_core.dart';

// // void main() {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   Firebase.initializeApp();
// //   runApp(const MyApp());
// //   // WidgetsFlutterBinding.ensureInitialized();
// //   // Firebase.initializeApp();
// //   // lock the landscape mode...
// //   // SystemChrome.setPreferredOrientations([
// //   //   DeviceOrientation.portraitUp,
// //   //   DeviceOrientation.portraitDown,
// //   // ]).then(
// //   //   (_) {
// //   //     // Firebase.initializeApp();

// //   //   },
// //   // );
// // }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]).then((_) {
//     Firebase.initializeApp();
//     runApp(const MyApp());
//   });
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return OrientationBuilder(
//       builder: (context, orientation) {
//         SystemChrome.setPreferredOrientations([
//           DeviceOrientation.portraitUp,
//           DeviceOrientation.portraitDown,
//         ]);

//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//           ),
//           home: ExpansionPanelDemo(),
//           // home: const SignUpScreen(),
//           // home: LoginScreen(),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pbcs_bible_course/provider/font_size_provider.dart';

import 'features/display_formated_text.dart';
import 'features/get_started_screen/dashboard.dart';
import 'features/expansion_panel.dart';
import 'features/upload_data.dart';
import 'features/get_started_screen/first_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    await Firebase.initializeApp();

    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FontSizeProvider()),
        // Add other providers if needed
      ],
      child: const MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ExpansionPanelDemo(),
          // Add other routes as needed
        );
      },
    );
  }
}


// Add other widgets and classes as needed
