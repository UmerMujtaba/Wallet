import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);
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
    {
      'image': 'assets/logos/sadapay.png',
      'name': 'SadaPay',
      'description': 'Bill Payment',
      'price': '\$40',
    }, //sadapay
    {
      'image': 'assets/logos/bank2m.png',
      'name': 'MCB Online Transfer',
      'description': '1Link Transfer',
      'price': '\$60',
    }, //mcb
    {
      'image': 'assets/logos/googlem.png',
      'name': 'Google Play',
      'description': 'Subscription Charges',
      'price': '\$8',
    }, //googleplay
    {
      'image': 'assets/logos/bank3m.png',
      'name': 'Naya-pay Transfer',
      'description': 'Easy load',
      'price': '\$10',
    }, //naypay
    {
      'image': 'assets/logos/spotify.png',
      'name': 'Spotify',
      'description': 'Subscription Charges',
      'price': '\$5',
    }, // spotify
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  const Text('Transaction Details',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
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
                          Expanded(child: Container()),
                          // This pushes the buttons to the end
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
