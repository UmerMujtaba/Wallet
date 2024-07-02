import 'package:flutter/material.dart';

class SetttingsScreen extends StatelessWidget {
  const SetttingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              title: Text('Profile'),
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
                            const ListTile(
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
            const Icon(
              Icons.logout,
              color: Colors.indigo,
              size: 30,
            ),
            const SizedBox(height: 20),
            const Text(
              'Log Out',
              style: TextStyle(color: Colors.indigo, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
