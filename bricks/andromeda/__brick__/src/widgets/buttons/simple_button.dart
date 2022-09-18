import 'package:flutter/material.dart';

import '../../tools/tools.dart';
import '../texts/custom_text.dart';

class SimpleButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  const SimpleButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              backgroundColor ?? colors.textColor),
        ),
        onPressed: () => onTap(),
        child: CustomText(
          title,
          textColor: textColor ?? colors.primaryColor,
          fontWeight: FontWeight.w500,
        ));
  }
}
