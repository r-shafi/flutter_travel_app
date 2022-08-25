import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final TextAlign textAlign;

  const CustomText({
    Key? key,
    this.size = 14,
    required this.text,
    this.color = Colors.black87,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
