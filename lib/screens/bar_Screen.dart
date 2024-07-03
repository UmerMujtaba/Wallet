import 'package:flutter/material.dart';
import 'package:wallet/components/chart_Bar_Screen.dart';

import 'home_screen/transaction_Home_Screen.dart';

class BarScreen extends StatefulWidget {
  const BarScreen({super.key});

  @override
  State<BarScreen> createState() => _BarScreenState();
}

class _BarScreenState extends State<BarScreen> {
  TextEditingController bankController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 65, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Total Balance',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '\$ 13.248',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    // Aligns the text to the left
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'Income Stats',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Adds spacing between Text and Dropdown
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 120,
                        height: 45,
                        child: DropdownButtonFormField<String>(
                          value: bankController.text.isEmpty
                              ? null
                              : bankController.text,
                          onChanged: (String? newValue) {
                            setState(() {
                              bankController.text = newValue!;
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0),
                              borderRadius:
                                  BorderRadius.circular(20.0), // Circular border
                            ),
                            hintText: ''
                          ),
                          items: <String>[
                            'Jan - June',
                            'July - Dec',
                            'Feb - July',
                            'Aug - Jan',
                            'March - Aug'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 10),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(height: 200, child: LineGraphChart()),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      'Transaction History',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const TransactionHomeScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
