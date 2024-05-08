import 'package:flutter/material.dart';
import 'package:medhealths/main_page.dart';
import 'package:medhealths/widget/button_primary.dart';
import 'package:medhealths/widget/general_logo_space.dart';
import 'package:medhealths/widget/widget_ilustration.dart';

class SuccessCheckout extends StatelessWidget {
  const SuccessCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GeneralLogoSpace(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(
            height: 80,
          ),
          const WidgetIlustration(
            image: "assets/order_success_ilustration.png",
            title: "Yeay, your order was successfully",
            subtitle1: "Consult with a doctor,",
            subtitle2: "Wherever and whenever you are",
            child: SizedBox(),
          ),
          const SizedBox(
            height: 30,
          ),
          ButtonPrimary(
            text: "BACK TO HOME",
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainPages()),
                  (route) => false);
            },
          )
        ],
      ),
    ));
  }
}
