import 'package:flutter/material.dart';

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Add Card',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/add-card2');
                },
                child: Container(
                  height: 400,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.indigo[800],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 45,
                        top: -25,
                        child: Container(
                          width: 40,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: -25,
                        child: Transform.translate(
                          offset: const Offset(15.0, 0.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blueAccent,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 30,
                        top: 40,
                        child: Image(
                          image: AssetImage('assets/imagesr.png'),
                          height: 50,
                          width: 60,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: -20,
                        child: Transform.translate(
                          offset: const Offset(15.0, 0.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blueAccent,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                          right: 25,
                          bottom: 20,
                          child: Text(
                            'Visa',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontStyle: FontStyle.italic),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              const Text(
                'Add a new card',
                style: TextStyle(color: Colors.black),
              ),
              const Text(
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
