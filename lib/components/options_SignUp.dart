import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../services/auth_Services.dart';

class OptionsSignup extends StatefulWidget {
  final Function(UserModel) onUserRetrieved;

  const OptionsSignup({
    super.key,
    required this.onUserRetrieved,
  });

  @override
  State<OptionsSignup> createState() => _OptionsSignupState();
}

class _OptionsSignupState extends State<OptionsSignup> {
  Color _googleButtonColor = Colors.white;
  Color _facebookButtonColor = Colors.white;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late final String profilePictureUrl;

  Future<void> signInWithGoogle() async {
    UserModel? user = await AuthService.signInWithGoogle();
    if (user != null) {
      setState(() {
        loading = true;
        nameController.text = user.name;
        emailController.text = user.email;
        profilePictureUrl=user.profilePictureUrl;
      });
      widget.onUserRetrieved(user);
    }
    // var title = 'Ok';
    // showDialog(
    //     context: context,
    //     builder: (context) =>
    //         AlertDialog(
    //           title: Text('Log in with Google'),
    //           //content: Text(title),
    //           actions: [
    //             TextButton(
    //                 onPressed: () {
    //                   Navigator.of(context).pop();
    //                 },
    //                 child: Text('Ok'))
    //           ],
    //         ));
  }

  var loading = false;

 /* void _logInWithFacebook() async {
    setState(() {
      loading = true;
    });

    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.tokenString);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      await FirebaseFirestore.instance.collection('users').add({
        'email': userData['email'],
        'imageUrl': userData['picture']['data']['url'],
        'name': userData['name'],
      });
    } on FirebaseAuthException catch (e) {
      var title = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          title = 'This account exists with a different sign in provider';
          break;
        case 'invalid-credential':
          title = 'Unknown error has occured';
          break;
        case 'operation-not-allowed':
          title = 'This operation is not allowed';
          break;
        case 'user-disabled':
          title = 'The user you tried to log into is disabled';
          break;
        case 'user-not-found':
          title = 'The user you tried to log into was not found';
          break;
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Log in with facebook Failed'),
          content: Text(title),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'))
          ],
        ),
      );
    } finally {
      setState(() {
        loading = false;
      });
    }
  }*/

  void _onGoogleButtonPressed() {
    setState(() {
      _googleButtonColor =
          _googleButtonColor == Colors.white ? Colors.blue : Colors.white;
      _facebookButtonColor = Colors.white; // Reset other button color
    });
    signInWithGoogle();
  }

  void _onFacebookButtonPressed() {
    setState(() {
      _facebookButtonColor =
          _facebookButtonColor == Colors.white ? Colors.blue : Colors.white;
      _googleButtonColor = Colors.white; // Reset other button color
    });
    //_logInWithFacebook();
  }


  @override void dispose() {
    // TODO: implement dispose
    signInWithGoogle();
    super.dispose();
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
