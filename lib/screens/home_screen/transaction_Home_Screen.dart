import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionHomeScreen extends StatelessWidget {
  const TransactionHomeScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> transactions = const [
    {
      'image': 'assets/logos/netflixm.png',
      'name': 'Netflix',
      'description': 'Monthly Subscription',
      'price': '\$12',
    }, //netflix
    {
      'image': 'assets/logos/bank1m.png',
      'name': 'Bank al Habib',
      'description': 'Fund Transfer',
      'price': '\$120',
    }, //bankalhabib
    {
      'image': 'assets/logos/paypal.png',
      'name': 'Paypal',
      'description': 'tax',
      'price': '\$8',
    }, //paypal
    {
      'image': 'assets/logos/payment.png',
      'name': 'Paylater',
      'description': 'Item Bill',
      'price': '\$4',
    }, //paylater

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: 86,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          transaction['image']!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 10),
                          Text(
                            transaction['name']!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            transaction['description']!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()), // This pushes the buttons to the end
                Row(
                  children: <Widget>[
                    Text(
                      transaction['price']!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
