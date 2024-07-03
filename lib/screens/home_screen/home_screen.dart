import 'package:flutter/material.dart';
import 'package:wallet/components/bottom_Bar.dart';
import 'package:wallet/screens/bar_Screen.dart';
import 'package:wallet/screens/home_screen/stack_Home_Screen.dart';
import 'package:wallet/screens/home_screen/transaction_Home_Screen.dart';
import 'package:wallet/screens/notification_Screen.dart';

import '../settings_Screen.dart';
import 'options_Home_Screen.dart';

class HomeScreen extends StatefulWidget {
 final String username;

  const HomeScreen({super.key, required this.username, });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late List<Widget> _screens; // Declare _screens as a late variable

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreenContent(username: widget.username),
      // Pass userModel to HomeScreenContent
      BarScreen(),
      NotificationScreen(),
      SettingScreen(username: widget.username),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: _screens[_currentIndex],
        bottomNavigationBar: CustomBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
 final String username;
  const HomeScreenContent({super.key, required this.username,});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  void initState() {
    super.initState();
    // print('User Name: ${widget.username}');

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Wallet',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Hello! ${widget.username}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: const AssetImage('assets/user1.jpg'),
                      child: ClipOval(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/user1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const StackHomeScreen(),
              const SizedBox(height: 20),
              const OptionsHomeScreen(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Last Transaction',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/transaction');
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const TransactionHomeScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
