import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/bottom_component.dart';
import 'package:flutter_application_1/component/schedule_component.dart';
import 'package:flutter_application_1/component/course_component.dart';
import 'package:flutter_application_1/component/header_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderComponent(),
              SizedBox(
                height: 40,
              ),
              CourseComponent(),
              SizedBox(
                height: 35,
              ),
              ScheduleComponent()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomComponent(),
    );
  }
}
