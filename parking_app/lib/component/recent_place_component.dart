import 'package:flutter/material.dart';
import 'package:parking_app/style/app_assets.dart';
import 'package:parking_app/style/app_colors.dart';

class RecentPlace extends StatelessWidget {
  const RecentPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent place',
              style: TextStyle(
                  color: AppColors.blackdarkColor,
                  fontFamily: 'Gilroy',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'See all',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontFamily: 'Gilroy',
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                height: 200,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Stack(children: [
                        SizedBox(
                          width: 170,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              AppAssets.parking_1,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 28,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.redAccent.withOpacity(0.5)),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text("Closed"),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
