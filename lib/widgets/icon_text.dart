import 'package:ecommerce_app/app_colors.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class IconText extends StatelessWidget {

  String text;
  IconData icon;
  Color textColor;
  Color iconColor;
  double size;

  IconText({Key? key,
    required this.text,
    required this.icon,
    required this.iconColor,
    this.size = 15,
    this.textColor = const Color(0xFF332d2b)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,
        color: iconColor,
        size: size,),
        Gap(5),
        SmallText(text: text,
        color: textColor,)
      ],
    );
  }
}
