import 'package:flutter/material.dart';
import 'package:food_app2/style/assets_manager.dart';

class CatagoriesComponent extends StatelessWidget {
  const CatagoriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Catagories",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ItemWidget(
                    itemName: "Fruite",
                    itemImage: AssetsManager.fruits,
                    itemColor: Colors.amber[100]!,
                  ),
                  ItemWidget(
                    itemName: "Dairy",
                    itemImage: AssetsManager.dairy,
                    itemColor: Colors.teal[100]!,
                  ),
                  ItemWidget(
                    itemName: "Vegeta",
                    itemImage: AssetsManager.freshFood,
                    itemColor: Colors.lightGreen[100]!,
                  ),
                  ItemWidget(
                    itemName: "Meat",
                    itemImage: AssetsManager.meat,
                    itemColor: Colors.deepOrange[100]!,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.itemName,
    required this.itemImage,
    required this.itemColor,
  });

  final String itemName;
  final String itemImage;
  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Ink(
        height: 100,
        width: 100,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ], color: itemColor, borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                itemImage,
                width: 40,
                height: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                itemName,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
