// options_SignUp.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_Services.dart';

class OptionsSignup extends StatefulWidget {
  final Function(UserModel) onUserRetrieved;

  OptionsSignup({
    super.key, required this.onUserRetrieved,

  });

  @override
  State<OptionsSignup> createState() => _OptionsSignupState();
}

class _OptionsSignupState extends State<OptionsSignup> {
  Color _googleButtonColor = Colors.white;
  Color _facebookButtonColor = Colors.white;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> signInWithGoogle() async {
    UserModel? user = await AuthService.signInWithGoogle();
    if (user != null) {
      setState(() {
        nameController.text = user.name;
        emailController.text = user.email;
      });
      widget.onUserRetrieved(user);
    }
  }

  void _onGoogleButtonPressed() {
    setState(() {
      _googleButtonColor = _googleButtonColor == Colors.white ? Colors.blue : Colors.white;
      _facebookButtonColor = Colors.white; // Reset other button color
    });
    signInWithGoogle();
  }

  void _onFacebookButtonPressed() {
    setState(() {
      _facebookButtonColor = _facebookButtonColor == Colors.white ? Colors.blue : Colors.white;
      _googleButtonColor = Colors.white; // Reset other button color
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
                onPressed: _onGoogleButtonPressed,
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
              hintText: 'Email',
            ),
          ),
        ),
      ],
    );
  }
}
