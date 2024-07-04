// login_screen.dart
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:wallet/components/options_SignUp.dart' as options;
import 'package:wallet/screens/home_screen/home_screen.dart';
import 'package:wallet/screens/signUp_Screen.dart';

import '../services/auth_Services.dart';

class LoginScreen extends StatefulWidget {
  final UserModel userModel;

  const LoginScreen({
    super.key,
    required this.userModel,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    String name;
    String userpic;
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  const Text(
                    'to Mabank Wallet',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Login with',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  options.OptionsSignup(
                    onUserRetrieved: (user) {
                      Future.delayed(
                        const Duration(milliseconds: 500),
                        () {
                          setState(
                            () {
                              name = user.name;
                              userpic = user.profilePictureUrl;
                              if (user.email.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                          username: name,
                                          userprofile: userpic)),
                                );
                              }
                            },
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LoginScreen(userModel: widget.userModel),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      backgroundColor: Colors.blue[800],
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SignupScreen(userModel: widget.userModel),
                        ),
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Dont\'t have an account? ',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Register',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12)),
                        ],
                      ),
                    ),
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
