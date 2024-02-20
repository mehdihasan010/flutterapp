import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_color.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomComponent extends StatelessWidget {
  const BottomComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
        gap: 8,
        activeColor: Colors.black,
        iconSize: 24,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: const Duration(milliseconds: 500),
        tabBackgroundColor: AppColor.appBarGreen.withOpacity(0.5),
        color: Colors.black,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.group,
            text: 'Group',
          ),
          GButton(
            icon: Icons.person,
            text: 'Person',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
          )
        ]);
  }
}
