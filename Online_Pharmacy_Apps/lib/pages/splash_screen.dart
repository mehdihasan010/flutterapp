import 'package:flutter/material.dart';
import 'package:medhealths/pages/login_page.dart';
import 'package:medhealths/widget/button_primary.dart';
import 'package:medhealths/widget/general_logo_space.dart';
import 'package:medhealths/widget/widget_ilustration.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralLogoSpace(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            WidgetIlustration(
              image: "assets/splash_ilustration.png",
              title: "Find your medical\nsolution",
              subtitle1: "Consult with a doctor",
              subtitle2: "whereever and whenever you want",
              child: ButtonPrimary(
                text: "GET STARTED",
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPages()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
