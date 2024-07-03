import 'package:flutter/material.dart';

class CardStackAddCardScreen extends StatelessWidget {
  const CardStackAddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
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
                image: AssetImage('assets/image.png'),
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
    );
  }
}
