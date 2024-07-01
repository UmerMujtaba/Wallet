import 'package:flutter/material.dart';
import 'package:wallet/components/options_SignUp.dart';
import 'package:wallet/components/text_Field_SignUp.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                const OptionsSignup(),
                const TextFieldSignup(),
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
                        // Slightly curved corners
                        borderSide: const BorderSide(
                          color: Colors
                              .transparent, // Makes the border transparent
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        // Slightly curved corners
                        borderSide: const BorderSide(
                          color: Colors
                              .transparent, // Makes the border transparent
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        // Slightly curved corners
                        borderSide: const BorderSide(
                          color: Colors
                              .transparent, // Makes the border transparent
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
                    Navigator.pushNamed(context, '/login');
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'You have account? ',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Login',
                            style: TextStyle(color: Colors.blue, fontSize: 12)),
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
