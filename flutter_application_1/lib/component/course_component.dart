import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_color.dart';
import 'package:flutter_application_1/style/assets_manager.dart';
import 'package:flutter_application_1/widget/course_item_card_widget.dart';
import 'package:flutter_application_1/widget/text_widget.dart';

class CourseComponent extends StatefulWidget {
  const CourseComponent({super.key});

  @override
  State<CourseComponent> createState() => _CourseComponentState();
}

class _CourseComponentState extends State<CourseComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
            text: 'Courses',
            size: 24,
            weight: FontWeight.bold,
            color: Colors.black),
        TextWidget(
            text: 'Your running subjects',
            size: 15,
            weight: FontWeight.w500,
            color: Colors.black.withOpacity(0.5)),
        const SizedBox(
          height: 20,
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CourseItemCradWidget(
                  cardColor: AppColor.appRedLight,
                  cardTitle: 'Mathematics',
                  cardImagePath: AssetsManager.mathematics),
              SizedBox(
                width: 10,
              ),
              CourseItemCradWidget(
                  cardColor: AppColor.appGreen,
                  cardTitle: 'Chemistry',
                  cardImagePath: AssetsManager.chemistry),
              SizedBox(
                width: 10,
              ),
              CourseItemCradWidget(
                  cardColor: AppColor.pinkLight,
                  cardTitle: 'Physics',
                  cardImagePath: AssetsManager.physics),
              SizedBox(
                width: 10,
              ),
              CourseItemCradWidget(
                  cardColor: AppColor.yellowLight,
                  cardTitle: 'Biology',
                  cardImagePath: AssetsManager.biology),
              SizedBox(
                width: 10,
              ),
              CourseItemCradWidget(
                  cardColor: AppColor.blue,
                  cardTitle: 'Literature',
                  cardImagePath: AssetsManager.literature),
            ],
          ),
        )
      ],
    );
  }
}
