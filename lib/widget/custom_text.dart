import 'package:flutter/material.dart';

class CustomTextColorWithSize extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight? fontWeight;

  const CustomTextColorWithSize({
    super.key,
    required this.text,
    required this.color,
    required this.size,
    this.fontWeight,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
