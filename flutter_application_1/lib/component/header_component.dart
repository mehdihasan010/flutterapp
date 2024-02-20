import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter_application_1/style/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderComponent extends StatefulWidget {
  const HeaderComponent({super.key});

  @override
  State<HeaderComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<HeaderComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Liana!",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.normal)),
              ),
              Text("You've got",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Text("4 task today",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColor.appGreen),
                  ))
            ],
          ),
          const badge.Badge(
            badgeContent: Text('2'),
            child: Image(image: AssetImage('assets/images/Rectangle.png')),
          )
        ],
      ),
    );
  }
}
