import 'package:delivery/utils/demensions.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  Color? color = const Color(0xFF332d2b);
  double size;
  TextOverflow overflow;

  BigText(
      {super.key,
      required this.text,
      this.color,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontWeight: FontWeight.w400),
    );
  }
}
