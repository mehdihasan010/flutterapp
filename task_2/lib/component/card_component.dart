import 'package:flutter/material.dart';

class CardComponenet extends StatelessWidget {
  const CardComponenet(
      {super.key,
      required this.place,
      required this.address,
      required this.price,
      required this.star,
      required this.image});

  final String place;
  final String address;
  final String price;
  final String star;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.8))]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 400,
              height: 350.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(image)),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  place,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [const Icon(Icons.star), Text(star)],
                ),
              ],
            ),
            Text(address),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(price,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      side: const BorderSide(width: 1.5, color: Colors.grey)),
                  child: const Text("See details"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
