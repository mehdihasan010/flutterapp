import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FullWidthButton extends StatelessWidget {
  const FullWidthButton(
      {super.key, this.onTap, required this.buttonName, this.buttonChild});

  final void Function()? onTap;
  final String buttonName;
  final Widget? buttonChild;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        color: const Color(0xff9775FA),
        child: Center(
          child: buttonChild ??
              Text(
                buttonName,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white),
              ),
        ),
      ),
    );
  }
}
