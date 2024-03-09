import 'package:flutter/material.dart';
import 'package:food_app2/src/mycart_controller.dart';
import '../style/app_color.dart';

class ItemAddBottomNavBar extends StatefulWidget {
  const ItemAddBottomNavBar(
      {super.key, required this.price, required this.id, required this.count});
  final double price;
  final int id;
  final int count;

  @override
  State<ItemAddBottomNavBar> createState() => _ItemAddBottomNavBarState();
}

class _ItemAddBottomNavBarState extends State<ItemAddBottomNavBar> {
  final controller = MyCartController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        //height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '\$ ${widget.price.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.white.withOpacity(0.2)),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.black),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)))),
                onPressed: () {
                  // Add to cart functionality
                  setState(() {
                    controller.addCart(widget.id, widget.count);
                    //print(controller.cartList);
                  });

                  //GoRouter.of(context).pushNamed(Routes.mycart);
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_card_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add to cart',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
