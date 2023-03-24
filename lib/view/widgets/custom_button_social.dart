import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial(
      {super.key, required this.text, required this.imageName, this.onpress});

  final String text;
  final String imageName;
  final Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade100),
      child: RawMaterialButton(
        onPressed: onpress,
        child: Row(
          children: [
            Image.asset(
              imageName,
              height: 35,
              width: 35,
            ),
            const SizedBox(
              width: 90,
            ),
            CustomText(
              text: text,
            )
          ],
        ),
      ),
    );
  }
}
