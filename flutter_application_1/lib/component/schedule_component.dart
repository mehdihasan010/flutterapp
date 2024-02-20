import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_color.dart';
import 'package:flutter_application_1/style/assets_manager.dart';
import 'package:flutter_application_1/widget/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScheduleComponent extends StatelessWidget {
  const ScheduleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const TextWidget(
          text: 'Your schedule',
          size: 24,
          weight: FontWeight.bold,
          color: Colors.black),
      TextWidget(
          text: 'Upcoming classes and tasks',
          size: 15,
          weight: FontWeight.w500,
          color: Colors.black.withOpacity(0.5)),
      const SizedBox(
        height: 20,
      ),
      Container(
        width: 400,
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColor.blueAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                      text: 'Physics',
                      size: 17,
                      weight: FontWeight.bold,
                      color: Colors.white),
                  const SizedBox(
                    height: 8,
                  ),
                  const TextWidget(
                      text: 'Chapter 3: Force',
                      size: 13,
                      weight: FontWeight.w500,
                      color: Colors.white),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      //image
                      SvgPicture.asset(AssetsManager.clock),
                      const SizedBox(
                        width: 5,
                      ),
                      //text
                      const TextWidget(
                          text: '09:30',
                          size: 13,
                          weight: FontWeight.w500,
                          color: Colors.white)
                    ],
                  ),
                  const Row(
                    children: [
                      //image
                      Image(image: AssetImage(AssetsManager.alex)),
                      SizedBox(
                        width: 5,
                      ),
                      //text
                      TextWidget(
                          text: 'Alex Jesus',
                          size: 13,
                          weight: FontWeight.w500,
                          color: Colors.white)
                    ],
                  ),
                  Row(
                    children: [
                      //image
                      SvgPicture.asset(AssetsManager.meet),
                      const SizedBox(
                        width: 5,
                      ),
                      //text
                      const TextWidget(
                          text: 'Google Meet',
                          size: 13,
                          weight: FontWeight.w500,
                          color: Colors.white)
                    ],
                  )
                ],
              ),
              SvgPicture.asset(
                AssetsManager.physics,
                color: AppColor.blue.withOpacity(0.75),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
