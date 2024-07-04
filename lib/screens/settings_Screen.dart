import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wallet/screens/profile_Screen.dart';

import 'chat_bot_main_screen.dart';

class SettingScreen  extends StatefulWidget {
  final String username;
  final String userpic;
  const SettingScreen ({super.key, required this.username, required this.userpic, });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  Future<void> signOut() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      final GoogleSignIn googleSignIn = GoogleSignIn();
      if (user != null) {

      }
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Error signing out or deleting user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: double.maxFinite,
                          child: ListView(
                            children:
                                ListTile.divideTiles(context: context, tiles: [
                               ListTile(
                                leading:  const Icon(
                                  Icons.person_outline,
                                  color: Colors.indigo,
                                  size: 22,
                                ),
                                title: const Text('Profile'),
                                trailing:  const Icon(
                                  Icons.arrow_right_sharp,
                                  color: Colors.black,
                                  size: 22,
                                ),
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  ProfileScreen(username: widget.username, userprofilepicture: widget.userpic,)),
                                  );
                                },
                              ),
                              const ListTile(
                                leading: Icon(
                                  Icons.notifications_none,
                                  color: Colors.indigo,
                                  size: 22,
                                ),
                                title: Text('Notifications'),
                                trailing: Icon(
                                  Icons.arrow_right_sharp,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              ),
                              const ListTile(
                                leading: Icon(
                                  Icons.wallet_outlined,
                                  color: Colors.indigo,
                                  size: 22,
                                ),
                                title: Text('Your Wallet'),
                                trailing: Icon(
                                  Icons.arrow_right_sharp,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              ),
                              const ListTile(
                                leading: Icon(
                                  Icons.key_outlined,
                                  color: Colors.indigo,
                                  size: 22,
                                ),
                                title: Text('Login Settings'),
                                trailing: Icon(
                                  Icons.arrow_right_sharp,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              ),
                                  ListTile(
                                leading: Icon(
                                  Icons.phone_callback_outlined,
                                  color: Colors.indigo,
                                  size: 22,
                                ),
                                title: Text('Service Center'),
                                trailing: Icon(
                                  Icons.arrow_right_sharp,
                                  color: Colors.black,
                                  size: 22,
                                ),
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  ChatbotMain()),
                                  );
                                },
                              ),
                            ]).toList(),
                          ),
                        ),
                        //SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () async{
                  await signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                icon: const Icon(
                  Icons.login_outlined,
                  color: Colors.indigo,
                  size: 30,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  await signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.indigo, fontSize: 22),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
