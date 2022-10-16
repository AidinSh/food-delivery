import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  String text;
  Color color;
  TextOverflow overflow;

  SmallText({Key? key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}
