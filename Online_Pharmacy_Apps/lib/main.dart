import 'package:flutter/material.dart';
import 'package:medhealths/pages/splash_screen.dart';
import 'package:medhealths/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: greenColor),
      home: const SplashScreen(),
    );
  }
}
