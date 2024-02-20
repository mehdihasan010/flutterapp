import 'package:flutter/material.dart';
import 'package:task_2/component/bottom_component.dart';
import 'package:task_2/component/card_component.dart';
import 'package:task_2/component/header_component.dart';
import 'package:task_2/style/assets_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: const [
              HeaderComponent(),
              CardComponenet(
                  place: 'Apapa, Asia',
                  address: '1,669 kilometers\nJUl 2 - 7',
                  price: '\$360 / Night',
                  star: '4.55',
                  image: AssetsManager.cover_1),
              SizedBox(
                height: 10,
              ),
              CardComponenet(
                  place: 'Abiansemal, Indonesia',
                  address: '1,669 kilometers\nJUl 2 - 7',
                  price: '\$330 / Night',
                  star: '4.87',
                  image: AssetsManager.cover_2),
              SizedBox(
                height: 10,
              ),
              CardComponenet(
                  place: 'Dhaka, Asia',
                  address: '1,669 kilometers\nJUl 2 - 7',
                  price: '\$460 / Night',
                  star: '4.90',
                  image: AssetsManager.cover_3),
              SizedBox(
                height: 10,
              ),
              CardComponenet(
                  place: 'Kolkata, Asia',
                  address: '1,669 kilometers\nJUl 2 - 7',
                  price: '\$510 / Night',
                  star: '4.50',
                  image: AssetsManager.cover_4),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomComponent(),
    );
  }
}
