import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final double balance;
  final int cardNumber;
  final int expiryMonth;
  final int expiryYear;
  final color;

  const MyCard(
      {Key? key,
      required this.balance,
      required this.cardNumber,
      required this.expiryMonth,
      required this.expiryYear,
      required this.color})
      : super(key: key);

  String formatCardNumber(String cardNumber) {
    // Remove any non-digit characters from the card number
    String cleanedCardNumber = cardNumber.replaceAll(RegExp(r'\D+'), '');

    // Insert spaces after every 4 digits
    List<String> parts = [];
    for (int i = 0; i < cleanedCardNumber.length; i += 4) {
      parts.add(cleanedCardNumber.substring(i, i + 4));
    }

    // Join parts with spaces
    return parts.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/add-card');
        },
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/icons/visa.png',
                    height: 50,
                  )
                ],
              ),
              const Text(
                'Balance',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 5),
              Text(
                '\$' + balance.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatCardNumber(cardNumber.toString()),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    expiryMonth.toString() + '/' + expiryYear.toString(),
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
