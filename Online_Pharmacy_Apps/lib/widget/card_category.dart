import 'package:flutter/material.dart';
import 'package:medhealths/theme.dart';

class CardCategory extends StatelessWidget {
  final String imageCategory;
  final String nameCategory;

  const CardCategory(
      {super.key, required this.imageCategory, required this.nameCategory});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageCategory,
          width: 65,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          nameCategory,
          style: mediumTextStyle.copyWith(fontSize: 10),
        )
      ],
    );
  }
}
