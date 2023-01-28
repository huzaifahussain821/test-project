import 'package:flutter/material.dart';


import '../Utils/app_colors.dart';
import 'custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final double containerWidth;
  final double? containerheight;
  final double? fontSize, borderRadius;
  final double? paddingTop, paddingBottom;
  final String buttonText;
  final VoidCallback? onTap;
  final bool? isGradientShow;
  final Color? textColor, buttonColor;

  CustomButtonWidget(
      {required this.containerWidth,
      this.containerheight,
      this.paddingTop,
      this.paddingBottom,
      this.textColor,
      this.fontSize,
      this.borderRadius,
      this.buttonColor,
      required this.buttonText,
      this.isGradientShow,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerheight ?? 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 50.0),
          color: buttonColor ?? AppColors.WHITE_COLOR,
          gradient: isGradientShow == true
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0XFF5E9CD3),
                    Color(0XFF3773A9),
                  ],
                )
              : null),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 50.0),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(
              top: paddingTop ?? 14.0,
            ),
            child: CustomTextWidget(
              text: buttonText,
              textColor: textColor ?? AppColors.WHITE_COLOR,
              textSize: fontSize ?? 1.38,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
