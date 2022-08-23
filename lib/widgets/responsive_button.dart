import 'package:flutter/material.dart';
import 'package:travel_app/configs/colors.dart';

class ResponsiveButton extends StatelessWidget {
  final double width;
  final String? text;

  const ResponsiveButton({
    Key? key,
    required this.width,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColor.primary),
      child: Row(
        mainAxisAlignment: text != null
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.center,
        children: [
          Text(
            text != null ? text! : '',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Image.asset('assets/images/button-one.png'),
        ],
      ),
    );
  }
}
