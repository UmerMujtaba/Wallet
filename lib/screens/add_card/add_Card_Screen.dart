import 'package:flutter/material.dart';

import 'card_Stack_Add_Card_Screen.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
            size: 25,
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Add Card',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              SizedBox(height: 40),
             CardStackAddCardScreen(),
              SizedBox(height: 30),
              Text(
                'Add a new card',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'on your wallet for easy life',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
