import 'package:flutter/material.dart';
import 'package:food_app2/screens/add_card.dart';
import 'package:food_app2/screens/favorites_screen.dart';
import 'package:food_app2/screens/home_screen.dart';
import 'package:food_app2/screens/profile_screen.dart';
import 'package:food_app2/style/app_color.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int _selectedIndex = 0;
  List<Widget> screen = [
    const HomePage(),
    const FavoritesPage(),
    const AddCrad(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Shop Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.grey,
      ),
      body: screen[_selectedIndex],
    );
  }
}
