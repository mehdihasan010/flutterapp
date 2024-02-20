import 'package:flutter/material.dart';

import '../style/app_color.dart';
import '../style/assets_manager.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome!",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            Text(
              "Aminur tahmid",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            )
          ],
        ),
        Ink(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: InkWell(
              onTap: () {}, child: Image.asset(AssetsManager.notification)),
        )
      ],
    );
  }
}
