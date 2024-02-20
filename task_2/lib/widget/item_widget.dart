import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          //image
          SvgPicture.asset(image),
          const SizedBox(
            height: 8.0,
          ),
          //text
          Text(text)
        ],
      ),
    );
  }
}
