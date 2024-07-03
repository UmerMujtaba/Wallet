import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class ProfileScreen extends StatefulWidget {
  final String username;
final String userprofilepicture;
  const ProfileScreen({
    super.key,
    required this.username, required this.userprofilepicture,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> deleteUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
      }
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut(); // Sign out from Google
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
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 30,

                child: ClipOval(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(
                      widget.userprofilepicture,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.username,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.mode_edit_outline_outlined,
                    color: Colors.indigo,
                    size: 20,
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: double.maxFinite,
                          child: ListView(
                            children:
                                ListTile.divideTiles(context: context, tiles: [
                              const ListTile(
                                leading: Icon(
                                  Icons.person_outline,
                                  color: Colors.indigo,
                                  size: 22,
                                ),
                                title: Text('Connected Account'),
                                trailing: Icon(
                                  Icons.arrow_right_sharp,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              ),
                              const ListTile(
                                leading: Icon(
                                  Icons.notifications_none,
                                  color: Colors.indigo,
                                  size: 22,
                                ),
                                title: Text('Privacy and Security'),
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
                                title: Text('Login Settings'),
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
                                title: Text('Service Center'),
                                trailing: Icon(
                                  Icons.arrow_right_sharp,
                                  color: Colors.black,
                                  size: 22,
                                ),
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
                onPressed: () async {
                  await deleteUser();
                  Navigator.pushReplacementNamed(context, '/signup');
                },
                icon: const Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.indigo,
                  size: 30,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () async {
                  await deleteUser();
                  Navigator.pushReplacementNamed(context, '/signup');
                },
                child: const Text(
                  'Delete Account',
                  style: TextStyle(color: Colors.indigo, fontSize: 22),
                ),
              )

            ],
          ),
        ),
        //bottomNavigationBar: CustomBottomBar(currentIndex: 1, onTap: (int value) {  },),
      ),
    );
  }
}
