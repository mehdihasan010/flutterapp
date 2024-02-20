import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseItemCradWidget extends StatelessWidget {
  const CourseItemCradWidget(
      {super.key,
      required this.cardColor,
      required this.cardTitle,
      required this.cardImagePath});

  final Color cardColor;
  final String cardTitle;
  final String cardImagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: cardColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image
            SvgPicture.asset(
              cardImagePath,
              width: 40,
              height: 40,
              // ignore: deprecated_member_use
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            //text
            Text(
              cardTitle,
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
