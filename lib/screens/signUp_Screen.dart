import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:wallet/components/options_SignUp.dart';
import 'package:wallet/screens/home_screen/home_screen.dart';
import 'package:wallet/screens/login_Screen.dart';

import '../services/auth_Services.dart';

class SignupScreen extends StatefulWidget {
  final UserModel userModel;

  const SignupScreen({
    super.key,
    required this.userModel,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    String name;
    String userpic;
    late final message=ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    'Immediately Feel',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                const Text(
                  'The Ease of Transacting Just by Registering',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                const Text(
                  'Sign up with',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                OptionsSignup(onUserRetrieved: (user) {
                  Future.delayed(
                    const Duration(milliseconds: 1000),
                    () {
                      setState(() {
                        emailController.text = user.email;
                        name=user.name;
                        userpic=user.profilePictureUrl;
                        // passwordController.text = user.name;
                        // print(passwordController.text);
                        // print(user.email);

                        if (user.email.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(username: name, userprofile: userpic,),
                            ),
                          );
                        }
                      });
                      SnackBar(content: Text(message.notification!.title.toString()),);
                    },
                  );
                }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 5),
                  child: TextField(
                    controller: passwordController,
                    obscureText: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.blueAccent,
                      ),
                      suffixIcon: const Icon(
                        Icons.visibility,
                        color: Colors.black54,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      labelText: 'Password',
                      hintText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    backgroundColor: Colors.blue[800],
                  ),
                  child: const Text(
                    'Register',
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
                            LoginScreen(userModel: widget.userModel),
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'You have an account? ',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
