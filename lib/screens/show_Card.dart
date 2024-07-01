import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowCardScreen extends StatefulWidget {
  const ShowCardScreen({Key? key}) : super(key: key);

  @override
  State<ShowCardScreen> createState() => _ShowCardScreenState();
}

class _ShowCardScreenState extends State<ShowCardScreen> {
  bool isFront = true;

  void flipCard() {
    setState(() {
      isFront = !isFront;
    });
  }

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
            children: <Widget>[
              const Text(
                'Card Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: flipCard,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 600),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    final rotate =
                        Tween(begin: pi, end: 0.0).animate(animation);
                    return AnimatedBuilder(
                      animation: rotate,
                      child: child,
                      builder: (BuildContext context, Widget? child) {
                        final isUnder = ValueKey(isFront) != child!.key;
                        var tilt = (animation.value - 0.5).abs() - 0.5;
                        tilt *= isUnder ? -0.003 : 0.003;
                        final value =
                            isUnder ? min(rotate.value, pi / 2) : rotate.value;
                        return Transform(
                          transform: (Matrix4.rotationY(value)
                            ..setEntry(3, 0, tilt)),
                          child: child,
                        );
                      },
                    );
                  },
                  switchInCurve: Curves.easeInBack.flipped,
                  switchOutCurve: Curves.easeOutBack.flipped,
                  child: isFront ? buildFront() : buildRear(),
                ),
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Name',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Jaka Mambang'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Bank',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Mabank'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Account',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('**** **** **** 2581'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Status',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Active'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Delete Card',
                style: TextStyle(color: Colors.indigo, fontSize: 22),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFront() {
    return Container(
      key: ValueKey(true),
      height: 200,
      width: 300,
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
            left: 20,
            top: 15,
            child: Transform.rotate(
              angle: 90 * pi / 180,
              child: const Image(
                image: AssetImage('assets/imagesr.png'),
                height: 50,
                width: 60,
              ),
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
            bottom: 30,
            child: Text(
              'Visa',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const Positioned(
            left: 25,
            bottom: 90,
            child: Text(
              '1234 5678 9581 2546',
              style: TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
                fontSize: 22,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          const Positioned(
            left: 25,
            bottom: 15,
            child: Text(
              'AHMAD ALI',
              style: TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          const Positioned(
            left: 25,
            bottom: 50,
            child: Row(
              children: <Widget>[
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Valid',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          'From',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 5),
                    Text(
                      '07/19',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Valid',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          'Till',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(width: 5),
                    Text(
                      '07/19',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRear() {
    return Container(
      key: ValueKey(false),
      height: 200,
      width: 300,
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
          Positioned.fill(
            top: 45, // Adjust this value to place it near the bottom
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 40,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 95, // Adjust this value to place it near the bottom
            left: 10, // Adjust this value to center horizontally
            right: 10,
            child: Center(
              child: Container(
                height: 30,
                //width: 280,
                color: Colors.white,
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      '258',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
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
            left: 25,
            bottom: 30,
            child: Text(
              'Visa',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
