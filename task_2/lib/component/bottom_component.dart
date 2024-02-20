import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_2/style/app_color.dart';
import 'package:task_2/style/assets_manager.dart';

class BottomComponent extends StatelessWidget {
  const BottomComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsManager.magnify), label: 'Explore'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsManager.heart), label: 'Wishlists'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsManager.sendvariant), label: 'Trips'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsManager.message), label: 'Inbox'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsManager.account), label: 'Profile')
      ],
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColor.pink,
    );
  }
}
