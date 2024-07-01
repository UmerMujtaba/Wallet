import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomBar({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: SalomonBottomBar(
          backgroundColor: Colors.indigo[800],
          currentIndex: widget.currentIndex,
          onTap: widget.onTap,
          unselectedItemColor: Colors.white, // Color for unselected items
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.wallet_outlined), // Outlined icon for unselected state
              title: const Text(""),
              selectedColor: Colors.blueAccent, // Color for selected item
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.bar_chart_outlined), // Outlined icon for unselected state
              title: const Text(""),
              selectedColor: Colors.blueAccent, // Color for selected item
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.notifications_outlined), // Outlined icon for unselected state
              title: const Text(""),
              selectedColor: Colors.blueAccent, // Color for selected item
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.settings_outlined), // Outlined icon for unselected state
              title: const Text(""),
              selectedColor: Colors.blueAccent, // Color for selected item
            ),
          ],
        ),
      ),
    );
  }
}
