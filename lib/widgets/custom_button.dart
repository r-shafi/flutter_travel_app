import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;

  const CustomButton({
    Key? key,
    this.text,
    this.icon,
    this.color = Colors.black,
    this.backgroundColor = Colors.black12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Center(
        child: text != null
            ? Text(
                text!,
                style: TextStyle(
                  fontSize: 20,
                  color: color,
                ),
              )
            : Icon(icon, color: color),
      ),
    );
  }
}
