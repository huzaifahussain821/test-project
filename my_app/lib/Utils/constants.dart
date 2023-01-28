import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_strings.dart';

class Constants {
  static const String EMAIL_VALIDATION_REGEX =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const String PASSWORD_VALIDATE_REGEX =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  static const String PHONE_NO_VALIDATION_REGEX = r'^[+][0-9]*$';

  //MaskTextInputFormatter for Card Number Field
  //static MaskTextInputFormatter cardNumberMaskFormatter =  MaskTextInputFormatter(mask: '#### #### #### ####', filter: { "#": RegExp(r'[0-9]') });

  //Email Regex Expression
  static RegExp EMAIL_REGEX_EXPRESSION = RegExp(EMAIL_VALIDATION_REGEX);

  //Password Regex Expression
  static RegExp PASSWORD_REGEX_EXPRESSION = RegExp(PASSWORD_VALIDATE_REGEX);

  //Phone No Regex Expression
  static RegExp PHONE_NO_REGEX_EXPRESSION = RegExp(PHONE_NO_VALIDATION_REGEX);

  //MaskTextInputFormatter for Card Number Field
  //static MaskTextInputFormatter cardNumberMaskFormatter =  MaskTextInputFormatter(mask: '#### #### #### ####', filter: { "#": RegExp(r'[0-9]') });

  //Calendar Method
  static Future<DateTime?> getCalendarMethod(
      {BuildContext? context, String? dateText}) async {
    return await showDatePicker(
        context: context!,
        initialDate:
            dateText!.isEmpty ? DateTime.now() : DateTime.parse(dateText),
        firstDate: DateTime.now().subtract(Duration(days: 36500)),
        lastDate: DateTime.now());
  }

  static void unFocusKeyboardMethod({required BuildContext context}) {
    FocusScope.of(context).unfocus();
  }

  // Cupertino Calendar Method

}
