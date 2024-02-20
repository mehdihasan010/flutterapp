import 'package:flutter/material.dart';
import 'package:parking_app/component/header_component.dart';
import 'package:parking_app/component/recent_place_component.dart';
import 'package:parking_app/style/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            HeaderComponent(),
            SizedBox(
              height: 20,
            ),
            RecentPlace()
          ],
        ),
      )),
    );
  }
}
