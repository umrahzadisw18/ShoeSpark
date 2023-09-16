import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class BottomNavbar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        color: Colors.grey[400],
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade100,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBorderRadius: 16,
        gap: 8,
        onTabChange: (value) {
          onTabChange!(value);
        },
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Shop",
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: "Cart",
          ),
        ],
      ),
    );
  }
}