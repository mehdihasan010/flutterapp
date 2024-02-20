import 'package:flutter/material.dart';
import 'package:food_app2/routes/route_pages.dart';
import 'package:food_app2/src/homepage_controller.dart';
import 'package:food_app2/style/app_color.dart';
import 'package:go_router/go_router.dart';

import '../data/dummy/dummy_products.dart';

class PopularFruits extends StatefulWidget {
  const PopularFruits({super.key});

  @override
  State<PopularFruits> createState() => _PopularFruitsState();
}

class _PopularFruitsState extends State<PopularFruits> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Popular Fruits",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),
            Text("See All",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColor.boxColor)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of food in each row
              mainAxisSpacing: 8.0, // spacing between rows
              crossAxisSpacing: 8.0, // spacing between columns
              childAspectRatio: (1 / 1.1),
            ),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return CrossAxisItem(
                indexNumber: index,
                fruitsName: food[index].name,
                fruitsPrice: "\$${food[index].price}",
                fruitsPhoto: food[index].photo,
              );
            }),
      ],
    );
  }
}

class CrossAxisItem extends StatefulWidget {
  const CrossAxisItem({
    super.key,
    required this.fruitsName,
    required this.fruitsPrice,
    required this.fruitsPhoto,
    required this.indexNumber,
  });

  final int indexNumber;
  final String fruitsName;
  final String fruitsPrice;
  final String fruitsPhoto;

  @override
  State<CrossAxisItem> createState() => _CrossAxisfoodtate();
}

class _CrossAxisfoodtate extends State<CrossAxisItem> {
  final controller = HomePageController();
  // bool _isFavorate = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => GoRouter.of(context).pushNamed(Routes.itemetails,
          pathParameters: {'id': food[widget.indexNumber].id.toString()}),
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => const ItemDetailsPage()));
      // },
      child: Container(
        decoration: BoxDecoration(
            boxShadow: const [],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            controller.addfavorite(widget.indexNumber);
                            //_isFavorate = !_isFavorate;
                            //print(_isFavorate);
                          });
                        },
                        child: Icon(
                          Icons.favorite,
                          color: food[widget.indexNumber].isfavorite
                              ? Colors.redAccent[200]
                              : Colors.white,
                        ),
                      ),
                    )),
              ),
            ),
            Image.asset(
              widget.fruitsPhoto,
              width: 80,
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.fruitsName,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                  Row(children: [
                    Text(widget.fruitsPrice,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor)),
                    const Text(" /kg",
                        style: TextStyle(fontSize: 12, color: Colors.black54))
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
