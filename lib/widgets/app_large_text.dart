import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double letterSpacing;

  const AppLargeText({
    Key? key,
    this.size = 30,
    required this.text,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
