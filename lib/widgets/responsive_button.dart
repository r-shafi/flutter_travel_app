import 'package:flutter/material.dart';
import 'package:travel_app/configs/colors.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double width;

  const ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColor.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/images/button-one.png')],
      ),
    );
  }
}
