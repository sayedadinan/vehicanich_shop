import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight width;
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: color, fontWeight: width),
    );
  }
}
