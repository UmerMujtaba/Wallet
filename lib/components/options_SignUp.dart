// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OptionsSignup extends StatefulWidget {
  const OptionsSignup({super.key});

  @override
  State<OptionsSignup> createState() => _OptionsSignupState();
}

class _OptionsSignupState extends State<OptionsSignup> {
  Color _googleButtonColor = Colors.white;
  Color _facebookButtonColor = Colors.white;

  void _onGoogleButtonPressed() {
    setState(() {
      _googleButtonColor = _googleButtonColor == Colors.white ? Colors.blue : Colors.white;
      _facebookButtonColor = Colors.white; // Reset other button color
    });
  }

  void _onFacebookButtonPressed() {
    setState(() {
      _facebookButtonColor = _facebookButtonColor == Colors.white ? Colors.blue : Colors.white;
      _googleButtonColor = Colors.white; // Reset other button color
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          width: 120,
          child: ElevatedButton(

            style: ElevatedButton.styleFrom(
              backgroundColor: _googleButtonColor,
              elevation: 10,
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
    );
  }
}
