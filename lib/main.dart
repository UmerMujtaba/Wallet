import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wallet/screens/add_card/add_Card_Screen.dart';
import 'package:wallet/screens/add_card/add_Card_Screen2.dart';
import 'package:wallet/screens/home_screen/home_screen.dart';
import 'package:wallet/screens/login_Screen.dart';
import 'package:wallet/screens/profile_Screen.dart';
import 'package:wallet/screens/signUp_Screen.dart';
import 'package:wallet/screens/transactions_Screen.dart';
import 'package:wallet/services/auth_Services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC2Ab1DWV_otcFpiEhKFFUqFu-vLG1UziU",
          appId: "1:823884719936:android:9cdcae7390b86375db3ca5",
          messagingSenderId: "823884719936",
          projectId: "wallet-b138e"))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/signup', routes: {
      '/signup': (context) => SignupScreen(userModel: UserModel( email: '', name: '')), // Pass a valid UserModel instance here
      '/login': (context) => LoginScreen(userModel: UserModel(email: '', name: '')), // Pass a valid UserModel instance here

      '/transaction': (context) => const TransactionsScreen(),
      '/add-card': (context) => const AddCardScreen(),
      '/add-card2': (context) => const AddCardScreen2(),



    });
  }
}
