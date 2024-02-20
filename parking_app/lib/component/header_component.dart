// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:parking_app/style/app_assets.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 20, // Image radius
              backgroundImage: AssetImage(AppAssets.profile),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Stack(alignment: Alignment.topRight, children: [
                  Icon(Icons.notifications_outlined),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 5, // Image radius
                      backgroundColor: Colors.red,
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50.0,
            padding: EdgeInsets.all(8),
            //padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            //margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Center(
              child: IntrinsicWidth(
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Find parking',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
