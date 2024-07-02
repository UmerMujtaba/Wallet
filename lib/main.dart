import 'package:flutter/material.dart';
import 'package:wallet/screens/add_card/add_Card_Screen.dart';
import 'package:wallet/screens/add_card/add_Card_Screen2.dart';
import 'package:wallet/screens/home_screen/home_screen.dart';
import 'package:wallet/screens/login_Screen.dart';
import 'package:wallet/screens/show_Card.dart';
import 'package:wallet/screens/signUp_Screen.dart';
import 'package:wallet/screens/transactions_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/signup', routes: {
      '/signup': (context) => const SignupScreen(),
      '/login': (context) => const LoginScreen(),
      '/home': (context) => const HomeScreen(),
      '/transaction': (context) => const TransactionsScreen(),
      '/add-card': (context) => const AddCardScreen(),
      '/add-card2': (context) => const AddCardScreen2(),


    });
  }
}
