import 'package:e_commerce/constance.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onpress});

  final String text;
  final Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      onPressed: onpress,
      fillColor: primaryColor,
      child: CustomText(
        text: text,
        alignment: Alignment.center,
        fontSize: 14,
        color: Colors.white,
      ),
    );
  }
}
