import 'package:flutter/material.dart';
import 'package:food_app2/widgets/app_bar_component.dart';
import 'package:food_app2/widgets/catagories_component.dart';
import 'package:food_app2/widgets/offer_card_component.dart';
import 'package:food_app2/widgets/popular_fruits.dart';
import 'package:food_app2/widgets/search_component.dart';
import 'package:food_app2/style/assets_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                const AppBarComponent(),
                const SizedBox(height: 20),
                const SearchComponent(),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      OfferCardComponent(
                          offText: '35% OFF',
                          image: AssetsManager.freshFoods,
                          cardColor: Colors.lightGreen),
                      const SizedBox(width: 10),
                      OfferCardComponent(
                          offText: '45% OFF',
                          image: AssetsManager.freshFood,
                          cardColor: Colors.lime),
                      const SizedBox(
                        width: 10,
                      ),
                      OfferCardComponent(
                          offText: '20% OFF',
                          image: AssetsManager.dairy,
                          cardColor: Colors.orangeAccent)
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const CatagoriesComponent(),
                const SizedBox(height: 20),
                const PopularFruits()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
