import 'package:flutter/material.dart';
import 'package:food_app2/data/dummy/dummy_products.dart';
import 'package:go_router/go_router.dart';

import '../routes/route_pages.dart';
import '../src/homepage_controller.dart';
import '../style/app_color.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final controller = HomePageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: food.length,
            itemBuilder: (context, index) {
              return food[index].isfavorite
                  ? InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => GoRouter.of(context).pushNamed(
                          Routes.itemetails,
                          pathParameters: {'id': food[index].id.toString()}),
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (context) => const ItemDetailsPage()));
                      // },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: const [],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  food[index].photo,
                                  width: 80,
                                  height: 80,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(food[index].name,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      Text(food[index].price.toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.primaryColor)),
                                      const Text(" /kg",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54))
                                    ]),
                                  ],
                                ),
                                Align(
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
                                              controller.addfavorite(index);
                                              //_isFavorate = !_isFavorate;
                                              //print(_isFavorate);
                                            });
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: food[index].isfavorite
                                                ? Colors.redAccent[200]
                                                : Colors.white,
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          )),
    );
  }
}
