import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app2/data/dummy/dummy_products.dart';
import 'package:food_app2/widgets/item_add_bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';
import '../style/app_color.dart';

class ItemDetailsPage extends StatefulWidget {
  const ItemDetailsPage({super.key, required this.id});

  final int id;

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPage();
}

class _ItemDetailsPage extends State<ItemDetailsPage> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => context.pop(),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Icon(Icons.arrow_back,
                                  color: AppColor.primaryColor),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.primaryColor),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(Icons.favorite,
                                color: food[widget.id - 1].isfavorite
                                    ? Colors.red
                                    : Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ClipPath(
                clipper: BottomClipper(),
                child: Container(
                  color: Colors.grey[200],
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Center(
                      child: Image.asset(
                    food[widget.id - 1].photo,
                    height: MediaQuery.of(context).size.height * 0.25,
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(food[widget.id - 1].name,
                      style: const TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColor.primaryColor,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('4.6 (567 reviews)',
                              style: TextStyle(fontSize: 16.0)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.timelapse_rounded,
                            color: AppColor.primaryColor),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child:
                              Text('10 min', style: TextStyle(fontSize: 16.0)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.flame,
                            color: AppColor.primaryColor),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child:
                              Text('32 kcal', style: TextStyle(fontSize: 16.0)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      count >= 2
                          ? IconButton(
                              padding: const EdgeInsets.all(4),
                              onPressed: () {
                                setState(() {
                                  count--;
                                });
                              },
                              icon: const Icon(Icons.remove),
                              color: Colors.white,
                            )
                          : const SizedBox(
                              width: 40,
                            ),
                      Text("$count kg",
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      IconButton(
                        padding: const EdgeInsets.all(4),
                        onPressed: () {
                          setState(() {
                            count++;
                          });
                        },
                        icon: const Icon(Icons.add),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Product Description',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(food[widget.id - 1].details,
                    style: const TextStyle(fontSize: 16.0, color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ItemAddBottomNavBar(
          id: widget.id - 1,
          price: food[widget.id - 1].price * count,
          count: count),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width - size.width / 4, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
