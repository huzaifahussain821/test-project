import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/Utils/app_colors.dart';

import '../Utils/app_size.dart';
import '../Utils/app_strings.dart';


class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final double containerWidth;
  final double? containerHeight;
  final double? textSize,
      elevation,
      labelSize,
      borderRadius,
      errorBorderRadius,
      iconSize,
      prefixIconSize;
  final String? labelText, hintText;
  final String? suffixImagePath, prefixImagePath;
  final int? maxLines, errorLines;
  final bool? obscureText, readOnly;
  final VoidCallback? onSuffixTap, onTap;
  final TextInputType? textKeyboardType;
  final List<TextInputFormatter>? textInputFormatter;
  final Color? borderColor, textColor, iconColor;
  final String? Function(String?)? onValidate;
  final bool changeObsure, hintEnable;

  CustomTextFormFieldWidget(
      {required this.controller,
      required this.containerWidth,
      this.elevation,
      this.labelText,
      this.textSize,
      this.labelSize,
      this.maxLines,
      this.containerHeight,
      this.errorLines,
      this.obscureText,
      this.textKeyboardType,
      this.textInputFormatter,
      this.borderColor,
      this.textColor,
      this.readOnly,
      this.borderRadius,
      this.errorBorderRadius,
      this.iconSize,
      this.prefixIconSize,
      this.changeObsure = false,
      this.hintText,
      this.hintEnable = false,
      this.iconColor,
      this.onSuffixTap,
      this.onValidate,
      this.onTap,
      this.suffixImagePath,
      this.prefixImagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: containerWidth,
        height: AppSize.heightSize * 0.08,
        decoration: BoxDecoration(
          color: AppColors.GREY_COLOR.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: TextFormField(
              controller: controller,
              validator: onValidate,
              readOnly: readOnly ?? false,
              onTap: onTap,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: borderColor ?? AppColors.WHITE_COLOR,
                        width: borderRadius ?? 1.7)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: borderColor ?? AppColors.FONT_THEME_COLOR,
                        width: borderRadius ?? 1.8)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.RED_COLOR,
                        width: errorBorderRadius ?? 1.65)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.RED_COLOR,
                        width: errorBorderRadius ?? 1.65)),
                border: InputBorder.none,
                hintStyle: hintEnable
                    ? TextStyle(
                        // sets the distance between label and input
                        color: AppColors.GREY_COLOR.withOpacity(0.7),
                        fontSize: 16.5,
                        fontFamily: AppStrings.POPPINS_FONT_FAMILY)
                    : const TextStyle(
                        height: 1,
                      ),
                hintText: hintEnable ? hintText ?? "" : '',
                alignLabelWithHint: (maxLines ?? 1) > 1 ? true : false,
                labelText: !hintEnable ? labelText ?? "" : null,
                labelStyle: TextStyle(
                  fontSize: labelSize ?? 15.5,
                  fontWeight: FontWeight.w500,
                  color: AppColors.GREY_COLOR,
                  fontFamily: AppStrings.POPPINS_FONT_FAMILY,
                ),
                errorStyle: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.RED_COLOR,
                  fontFamily: AppStrings.POPPINS_FONT_FAMILY,
                ),
                errorMaxLines: errorLines ?? 1,
                suffixIcon: suffixImagePath != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                            right: 20.0, top: 1.0, left: 5.0),
                        child: GestureDetector(
                            onTap: onSuffixTap,
                            child: Image.asset(
                              suffixImagePath!,
                              width: iconSize ?? 25.0,
                              color: iconColor,
                            )))
                    : null,
                suffixIconConstraints: const BoxConstraints(),
                prefixIcon: prefixImagePath != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                            right: 20.0, top: 1.0, left: 0.0),
                        child: Image.asset(
                          prefixImagePath!,
                          width: iconSize ?? 20.0,
                          color: iconColor,
                        ))
                    : null,
                prefixIconConstraints: const BoxConstraints(),
              ),
              style: TextStyle(
                  fontSize: textSize ?? 17.5,
                  fontWeight: FontWeight.w500,
                  color: textColor ?? AppColors.WHITE_COLOR,
                  fontFamily: AppStrings.POPPINS_FONT_FAMILY),
              obscureText: obscureText ?? false,
              maxLines: maxLines ?? 1,
              keyboardType: textKeyboardType ?? TextInputType.text,
              inputFormatters: textInputFormatter ?? [],
              obscuringCharacter: changeObsure ? '*' : '•',
            ),
          ),
        ),
      ),
    );
  }
}
