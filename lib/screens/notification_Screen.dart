import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
   NotificationScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> notificationsNew =  [
    {
      'date': '29 June, 2021, 2:02 am',
      'title': 'You spent Rp 32,000 for Coffee Cetar',
      'description': 'Buy Drink',
      'icon': Icons.arrow_drop_up,
      'iconColor': Colors.green
    },
    {
      'date': '29 June, 2021, 7:14 pm',
      'title': 'You received Rp 100,000 from Alexendar',
      'description': 'Pay Debt',
      'icon': Icons.arrow_drop_down,
      'iconColor': Colors.red
    },
  ];
  final List<Map<String, dynamic>> notificationsRecent = [
    {
      'date': '26 June, 2021, 4:14 pm',
      'title': 'You spent Rp 320,000 from Alexendar',
      'description': 'Pay Debt',
      'icon': Icons.arrow_drop_down,
      'iconColor': Colors.red
    },
    {
      'date': '29 June, 2021, 7:14 pm',
      'title': 'You spent Rp 210,000 for pay Tokosbla',
      'description': 'Buy Items',
      'icon': Icons.arrow_drop_up,
      'iconColor': Colors.green
    },
    {
      'date': '29 June, 2021, 7:14 pm',
      'title': 'You spent Rp 210,000 for pay Tokosbla',
      'description': 'Buy Items',
      'icon': Icons.arrow_drop_down,
      'iconColor': Colors.red
    },
    {
      'date': '26 June, 2021, 4:14 pm',
      'title': 'You spent Rp 320,000 from Alexendar',
      'description': 'Pay Debt',
      'icon': Icons.arrow_drop_down,
      'iconColor': Colors.red
    },
    {
      'date': '29 June, 2021, 7:14 pm',
      'title': 'You received Rp 100,000 from Alexendar',
      'description': 'Pay Debt',
      'icon': Icons.arrow_drop_up,
      'iconColor': Colors.green
    },
  ];

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
                'Notifications',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'New',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: notificationsNew.length,
                      itemBuilder: (context, index) {
                        final notification = notificationsNew[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Material(
                            elevation: 5,
                            // Adjust elevation as needed
                            borderRadius: BorderRadius.circular(10),
                            // Match the container's border radius
                            child: Container(
                              height: 86,
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                border: Border.all(color: Colors.white70),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              notification['date']!,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              notification['title']!,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              notification['description']!,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                   Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      notification['icon'],
                                      color: notification['iconColor'],
                                      size: 25,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Recent',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: notificationsRecent.length,
                      itemBuilder: (context, index) {
                        final notification = notificationsRecent[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Material(
                            elevation: 5,
                            // Adjust elevation as needed
                            borderRadius: BorderRadius.circular(10),
                            // Match the container's border radius
                            child: Container(
                              height: 86,
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                border: Border.all(color: Colors.white70),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              notification['date']!,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              notification['title']!,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              notification['description']!,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      notification['icon'],
                                      color: notification['iconColor'],
                                      size: 25,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
