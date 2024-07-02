import 'package:flutter/material.dart';

class OptionsHomeScreen extends StatelessWidget {
  const OptionsHomeScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> options = const [
    {'image': 'assets/icons/transfer.png', 'name': 'Transfer'},
    {'image': 'assets/icons/card.png', 'name': 'Payment'},
    {'image': 'assets/icons/moneysend.png', 'name': 'Payouts'},
    {'image': 'assets/icons/ads.png', 'name': 'Top up'},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: options.map((option) {
        return Column(
          children: <Widget>[
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset(
                  option['image']!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              option['name']!,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        );
      }).toList(),
    );
  }
}
