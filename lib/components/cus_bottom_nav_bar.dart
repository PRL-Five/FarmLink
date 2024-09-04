import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class CusBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  CusBottomNavBar({super.key, required this.onTabChange});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        gap: 10,

        // colors combination 1
        color: Colors.black,
        // backgroundColor: Colors.green,
        activeColor: Colors.grey[600],
        tabActiveBorder: Border.all(color: Colors.green.shade100),
        tabBackgroundColor: Colors.white,

        // // colors combination 2
        // color: Colors.green[300],
        // activeColor: Colors.green,
        // tabActiveBorder: Border.all(color: Colors.green.shade50),
        // tabBackgroundColor: Colors.green.shade50,

        // other

        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop     ',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search   ',
          ),
          GButton(
            icon: Icons.favorite,
            text: 'Favorites',
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Cart     ',
          ),
        ],
      ),
    );
  }
}
