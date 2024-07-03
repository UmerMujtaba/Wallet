import 'package:flutter/material.dart';

class StackHomeScreen extends StatelessWidget {
  const StackHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/add-card');
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.indigo[800],
          borderRadius: BorderRadius.circular(20),
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
          ],
        ),
      ),
    );
  }
}
