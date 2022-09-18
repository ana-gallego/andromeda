import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText(this.text,
      {Key? key,
      this.textColor,
      this.fontWeight,
      this.textDecoration,
      this.maxLines,
      this.textAlign,
      this.fontSize = 16,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '');
  }
}
