

import 'app_strings.dart';
import 'constants.dart';

class Validation {
  //Email Validation Method
  static String? emailValidationMethod({required String value}) {
    if (value.trim().isEmpty) {
      return AppStrings.EMAIL_EMPTY_ERROR_TEXT;
    } else if (!Constants.EMAIL_REGEX_EXPRESSION.hasMatch(value)) {
      return AppStrings.EMAIL_INVALID_ERROR_TEXT;
    }
    return null;
  }

  //Password Validation Method
  static String? passwordValidationMethod(
      {required String value, required String passwordField}) {
    if (value.trim().isEmpty) {
      return passwordField + AppStrings.FIELD_EMPTY_ERROR_TEXT;
    } else if (!Constants.PASSWORD_REGEX_EXPRESSION.hasMatch(value)) {
      return passwordField + AppStrings.PASSWORD_INVALID_ERROR_TEXT;
    }
    return null;
  }

  //Confirm Password Validation Method
  static String? confirmPasswordValidationMethod(
      {required String value,
      required String passwordText,
      required String passwordField,
      required String confirmPasswordField}) {
    if (value.trim().isEmpty) {
      return confirmPasswordField + AppStrings.FIELD_EMPTY_ERROR_TEXT;
    } else if (!Constants.PASSWORD_REGEX_EXPRESSION.hasMatch(value)) {
      return confirmPasswordField + AppStrings.PASSWORD_INVALID_ERROR_TEXT;
    } else if (passwordText != value) {
      return passwordField +
          " And " +
          confirmPasswordField +
          AppStrings.SAME_ERROR;
    }
    return null;
  }

  // Confirm Password Validation Method
  // static Map<String, dynamic> confirmPasswordValidationMethod(
  //     {required String value,
  //       required String passwordText,
  //       required String passwordField,
  //       required String confirmPasswordField}) {
  //   if (value.trim().isEmpty) {
  //     return _commonErrorMethod(
  //         errorMessage: confirmPasswordField + AppStrings.FIELD_EMPTY_ERROR,
  //         errorStatus: true);
  //   } else if (!Constants.PASSWORD_REGEX_EXPRESSION.hasMatch(value)) {
  //     return _commonErrorMethod(
  //         errorMessage:
  //         confirmPasswordField + AppStrings.PASSWORD_INVALID_ERROR,
  //         errorStatus: true);
  //   } else if (passwordText != value) {
  //     return _commonErrorMethod(
  //         errorMessage: passwordField +
  //             " And " +
  //             confirmPasswordField +
  //             AppStrings.SAME_ERROR,
  //         errorStatus: true);
  //   } else {
  //     return _commonErrorMethod(errorMessage: null, errorStatus: false);
  //   }
  // }

  //Contact No Validation Method
  // static Map<String, dynamic> contactNoValidationMethod({
  //   required String value,
  //   String emptyError = AppStrings.CONTACT_NUMBER_EMPTY_ERROR,
  //   String lengtherror = AppStrings.CONTACT_NUMBER_LENGTH_ERROR
  // }) {
  //   if (value.trim().isEmpty) {
  //     return _commonErrorMethod(
  //         errorMessage: emptyError,
  //         errorStatus: true);
  //   } else if (!(value.length >= 9 &&
  //       value.length <= 15)) {
  //     return _commonErrorMethod(
  //         errorMessage: lengtherror, errorStatus: true);
  //   } else {
  //     return _commonErrorMethod(errorMessage: null, errorStatus: false);
  //   }
  // }

  //Gender Validation Method
  // static Map<String, dynamic> dropDownValidationMethod(
  //     {String? value, required String field}) {
  //   if (value == null) {
  //     return _commonErrorMethod(
  //         errorMessage: field + AppStrings.FIELD_EMPTY_ERROR,
  //         errorStatus: true);
  //   } else {
  //     return _commonErrorMethod(errorMessage: null, errorStatus: false);
  //   }
  // }

  //Card Number Validation Method
  // static Map<String, dynamic> cardNumberValidationMethod(
  //     {required String value}) {
  //   cardNumberValidate = _ccValidator.validateCCNum(value.replaceAll(" ", ""));
  //   if (value.trim().isEmpty) {
  //     return _commonErrorMethod(
  //         errorMessage: AppStrings.CARD_NUMBER_EMPTY_ERROR, errorStatus: true);
  //   } else if (!(cardNumberValidate.isValid)) {
  //     return _commonErrorMethod(
  //         errorMessage: AppStrings.CARD_NUMBER_ERROR, errorStatus: true);
  //   } else {
  //     return _commonErrorMethod(errorMessage: null, errorStatus: false);
  //   }
  // }

  //CVV Validation Method
  // static Map<String, dynamic> cvvValidationMethod(
  //     {required String value, required String cardNumber}) {
  //   cardNumberValidate =
  //       _ccValidator.validateCCNum(cardNumber.replaceAll(" ", ""));
  //   cvcValidate = _ccValidator.validateCVV(value, cardNumberValidate.ccType);
  //
  //   if (value.trim().isEmpty) {
  //     return _commonErrorMethod(
  //         errorMessage: AppStrings.CVV_EMPTY_ERROR, errorStatus: true);
  //   } else if (!(cvcValidate.isValid)) {
  //     return _commonErrorMethod(
  //         errorMessage: AppStrings.CVV_ERROR, errorStatus: true);
  //   } else {
  //     return _commonErrorMethod(errorMessage: null, errorStatus: false);
  //   }
  // }

  //Field Validation Method
  static String? fieldValidationMethod(
      {required String value, required String field}) {
    if (value.trim().isEmpty) {
      return field + AppStrings.FIELD_EMPTY_ERROR_TEXT;
    }
    return null;
  }

  // static Map<String, dynamic> _commonErrorMethod(
  //     {String? errorMessage, bool? errorStatus}) {
  //   return {"errorMessage": errorMessage, "errorStatus": errorStatus};
  // }
}
