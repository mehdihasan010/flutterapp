// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  // Add user profile picture here
                  // backgroundImage: NetworkImage('URL_TO_PROFILE_PICTURE'),
                ),
              ),
              SizedBox(height: 20),
              const Center(
                child: Text(
                  'Aminur tahmid', // Replace with user's name
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'aminur.tahmid@example.com', // Replace with user's email
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 40),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Shopping'),
                trailing: Icon(Icons.chevron_right),
                tileColor: Colors.white,
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                trailing: Icon(Icons.chevron_right),
                tileColor: Colors.white,
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                trailing: Icon(Icons.chevron_right),
                tileColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
