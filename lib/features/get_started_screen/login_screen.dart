import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbcs_bible_course/New%20Views/expansion_panel.dart';
import 'package:pbcs_bible_course/New%20Views/finalcourselistscreen.dart';
import 'package:pbcs_bible_course/utils/utils.dart';
import '../../constants/colors.dart';
import 'sign_up_screen.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: '${phoneNumberController.text}@example.com',
            password: passwordController.text.toString())
        .then((value) {
      Utils().toastMessage('Login Successful');
      Navigator.push(
        // Move to second screen
        context,
        MaterialPageRoute(
          builder: (context) => const ExpansionPanelListExample(),
        ),
      );
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage('Login UnSuccessful');
      setState(() {
        loading = false;
      });
    });
  }

  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String? _phone, _password;

  Widget _buildPhone() {
    return TextFormField(
      controller: phoneNumberController,
      decoration: InputDecoration(
        labelText: 'Phone',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: appPrimaryColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your phone number';
        }
        if (!RegExp(r'^(\+92|0)?3\d{2}(-|\s)?\d{7}$').hasMatch(value)) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
      onSaved: (value) {
        _phone = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: passwordController,
      obscureText: !_showPassword,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: appPrimaryColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 6) {
          return 'Password should be at least 6 characters long.';
        }
        return null;
      },
      onSaved: (value) {
        _password = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return WillPopScope(
      // exit from the loginScreen when user press the back button
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: appPrimaryColor,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
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
                    'توریت، زبور اور انجیل پر مبنی کورسز',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jameel Noori Nastaleeq Kasheeda',
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
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
                      color: tSecondaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: tSecondaryColor,
                          spreadRadius: 5,
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    // child: Image.asset(
                    //   'assets/sun_logo.png',
                    //   width: mediaQuery.size.width * 0.2,
                    // ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            'assets/sun_logo.png',
                            width: mediaQuery.size.width * 0.2,
                            height: mediaQuery.size.height * 0.2,
                          ),
                          const SizedBox(height: 10),
                          _buildPhone(),
                          const SizedBox(height: 20),
                          _buildPassword(),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: appPrimaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 2,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                login();
                                // AuthenticateUser(_phone, _password);
                              }
                            },
                            child: loading
                                ? const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  )
                                : const Text('Log In'),
                            // child: const Text(
                            //   'Log In',
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(height: 10),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        // textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        child: const Text(
                          ' Sign Up',
                          // textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.amberAccent,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
