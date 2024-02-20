import 'package:flutter/material.dart';
import 'package:food_app2/screens/home_screen.dart';
import 'package:food_app2/style/app_color.dart';
import 'package:food_app2/style/assets_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    AssetsManager.splashImage,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Text(
                    "Fresh & Tasty\nGrocery Foods",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "When placing an order, select the option\nyour order at the door.",
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColor.textColor.withOpacity(0.5)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 169, 221, 159),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          top: 15.0, bottom: 15, left: 30, right: 30),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
