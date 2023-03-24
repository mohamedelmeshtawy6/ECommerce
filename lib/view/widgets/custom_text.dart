import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.fontSize = 16,
      this.maxline,
      this.height = 0,
      this.alignment = Alignment.topLeft});

  final String text;
  final Color color;
  final double fontSize;
  final Alignment alignment;
  final int? maxline;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: fontSize, height: height),
        maxLines: maxline,
      ),
    );
  }
}
