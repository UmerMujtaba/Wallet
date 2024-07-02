import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OptionsSignup extends StatefulWidget {
  final Function(String) onEmailRetrieved;
  OptionsSignup({super.key, required this.onEmailRetrieved});

  @override
  State<OptionsSignup> createState() => _OptionsSignupState();
}

class _OptionsSignupState extends State<OptionsSignup> {
  Color _googleButtonColor = Colors.white;
  Color _facebookButtonColor = Colors.white;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  ValueNotifier<UserCredential?> userCredential = ValueNotifier(null);

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      userCredential.value = await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.value != null) {
        widget.onEmailRetrieved(userCredential.value!.user!.email ?? '');
      }
    } on Exception catch (e) {
      print('exception->$e');
    }
  }

  void _onGoogleButtonPressed() {
    setState(() {
      _googleButtonColor =
      _googleButtonColor == Colors.white ? Colors.blue : Colors.white;
      _facebookButtonColor = Colors.white; // Reset other button color
    });
  }

  void _onFacebookButtonPressed() {
    setState(() {
      _facebookButtonColor =
      _facebookButtonColor == Colors.white ? Colors.blue : Colors.white;
      _googleButtonColor = Colors.white; // Reset other button color
    });
  }

  @override
  void initState() {
    super.initState();

    // Listen to changes in userCredential and update the emailController
    userCredential.addListener(() {
      if (userCredential.value != null) {
        emailController.text = userCredential.value!.user!.email ?? '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _googleButtonColor,
                  elevation: 4,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () async {
                  _onGoogleButtonPressed();
                  await signInWithGoogle();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/gmail.png'),
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    Text('Google'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: _facebookButtonColor,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: _onFacebookButtonPressed,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/facebook.png'),
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    Text('Facebook'),
                  ],
                ),
              ),
            )
          ],
        ),
        ValueListenableBuilder<UserCredential?>(
          valueListenable: userCredential,
          builder: (context, user, child) {
            if (user != null) {
              emailController.text = user.user!.email ?? '';
            }
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 5),
                  child: TextField(
                    controller: nameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.blueAccent,
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
                      labelText: 'Username',
                      hintText: 'Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 5),
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.blueAccent,
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
                      labelText: 'Email',
                      hintText: 'email',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
