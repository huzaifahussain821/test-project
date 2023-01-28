import 'package:flutter/material.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_strings.dart';


class CustomTextWidget extends StatelessWidget {
  final String? text, fontFamily;
  final Color? textColor;
  final double? textSize, textHeight, decorationThickness;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  CustomTextWidget(
      {this.text,
      this.textColor,
      this.textSize,
      this.fontFamily,
      this.fontWeight,
      this.maxLines,
      this.textOverflow,
      this.textAlign,
      this.textHeight,
      this.textDecoration,
      this.decorationThickness});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
        color: textColor ?? AppColors.WHITE_COLOR,
        fontFamily: fontFamily ?? AppStrings.POPPINS_FONT_FAMILY,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: textHeight,
        decoration: textDecoration ?? TextDecoration.none,
        decorationThickness: decorationThickness ?? 0.0,
      ),
      textScaleFactor: textSize ?? 1.0,
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
