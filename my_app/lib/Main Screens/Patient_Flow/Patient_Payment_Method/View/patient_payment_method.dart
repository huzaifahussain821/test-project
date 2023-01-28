import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_route_name.dart';
import '../../../../Utils/app_size.dart';
import '../../../../Utils/app_strings.dart';
import '../../../../Utils/assets_path.dart';
import '../../../../Utils/navigation.dart';
import '../../../../Widgets/backgroundContainerImageWidget.dart';
import '../../../../Widgets/custom_button_widget.dart';
import '../../../../Widgets/custom_text_form_field_widget.dart';
import '../../../../Widgets/custom_text_widget.dart';


class PatientPaymentMethod extends StatefulWidget {
  const PatientPaymentMethod({Key? key}) : super(key: key);

  @override
  State<PatientPaymentMethod> createState() => _PatientPaymentMethodState();
}

class _PatientPaymentMethodState extends State<PatientPaymentMethod> {
  int _groupValue = -1;
  final TextEditingController _emailConroller = TextEditingController();
  final TextEditingController _userNameConroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundImageContainerWidget(
        child: Scaffold(
      backgroundColor: AppColors.TRANSPARENT_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        automaticallyImplyLeading: false,
        title: _appbarWidget(),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            cardDetailsHeadingWidget(),
            SizedBox(
              height: 10.h,
            ),
            _cardHolderNameTextFormWidget(),
            _cardNumberTextFormWidget(),
            _EXPIRYDATECVVVCodeTextFormFieldsRowWidget(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isITCoverredByInsuredHeadingWidget(),
                  Container(
                      height: 2,
                      width: 2,
                      child: Radio(
                          value: _groupValue,
                          groupValue: _groupValue,
                          activeColor: AppColors.FONT_THEME_COLOR,
                          onChanged: (value) {
                            print(value); //selected value
                            if (_groupValue == -1) {
                              setState(() {
                                _groupValue = 1;
                              });
                            } else {
                              setState(() {
                                _groupValue = -1;
                              });
                            }
                          })),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            _insurranceCompanyTextFormWidget(),
            _insurranceNumberTextFormWidget(),
            _expiryDateInsuranceTextFormWidget(),
            SizedBox(
              height: 20.h,
            ),
            continueButton(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      )),
    ));
  }

  Widget _appbarWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              // AppNavigation.navigatorPop(context);
            },
            child: Image.asset(
              AssetPaths.BACK_BUTTON_IMAGE,
              scale: 4,
            ),
          ),
          InkWell(
            onTap: () {
              // AppNavigation.navigatorPop(context);
            },
            child: Image.asset(
              AssetPaths.LOGO_IMAGE,
              scale: 6,
            ),
          ),
          const SizedBox()
        ],
      ),
    );
  }

  Widget cardDetailsHeadingWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: "Card Details",
          textSize: 1.2.sp,
          fontWeight: FontWeight.bold,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ],
    );
  }

  Widget _cardNumberTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _userNameConroller,
      textKeyboardType: TextInputType.number,

      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Card number",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _cardHolderNameTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _emailConroller,
      textKeyboardType: TextInputType.emailAddress,

      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Card holder name",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _EXPIRYDATECVVVCodeTextFormFieldsRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_expiryDateTextFormWidget(), _cvvTextFormWidget()],
    );
  }

  Widget _expiryDateTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _stateController,
      textKeyboardType: TextInputType.emailAddress,

      containerWidth: AppSize.widthSize * 0.420,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Expiry Date",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _cvvTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _zipCodeController,
      textKeyboardType: TextInputType.emailAddress,

      containerWidth: AppSize.widthSize * 0.42,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Cvv",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget isITCoverredByInsuredHeadingWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: "Is it covered by insured?",
          textSize: 1.2.sp,
          fontWeight: FontWeight.bold,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ],
    );
  }

  Widget _insurranceCompanyTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _emailConroller,

      textKeyboardType: TextInputType.emailAddress,

      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Insurrance Company",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _insurranceNumberTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _emailConroller,

      textKeyboardType: TextInputType.emailAddress,

      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Insurrance number",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _expiryDateInsuranceTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _emailConroller,
      suffixImagePath: AssetPaths.CALENDER_ICON,
      textKeyboardType: TextInputType.emailAddress,

      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Expiry Date",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget continueButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: "Continue",
      textColor: AppColors.WHITE_PURE_COLOR,
      fontSize: 1.2,
      isGradientShow: true,
      borderRadius: 10,
      buttonColor: AppColors.BUTTON_COLOR,
      onTap: () {
        //     context: context,
        //     barrierDismissible: false,
        //     builder: (BuildContext context) {
        //       return WillPopScope(
        //         onWillPop: () async {
        //           return false;
        //         },
        //         child: Column(
        //           children: [
        //             Row(
        //               children: [
        //                 CustomTextWidget(
        //                   text: "PSC Test",
        //                   textColor: AppColors.FONT_THEME_COLOR,
        //                   textSize: 1.1.sp,
        //                 )
        //               ],
        //             ),
        //             Column(
        //               children: [
        //                 CustomTextWidget(
        //                   text: "PSC Test",
        //                   textColor: AppColors.FONT_THEME_COLOR,
        //                   textSize: 1.1.sp,
        //                 ),
        //                 CustomTextWidget(
        //                   text: "PSC Test",
        //                   textColor: AppColors.FONT_THEME_COLOR,
        //                   textSize: 1.1.sp,
        //                 )
        //               ],
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [exitButton(), consultQuestionButton()],
        //             )
        //           ],
        //         ),
        //       );
        //     });
        // if ((_loginKey.currentState?.validate()) ?? false) {
        //   Constants.unFocusKeyboardMethod(context: context);
        //   // _loginMethod();
        //   loginValidationMethod();
        // }
        AppNavigation.navigateTo(
            context, AppRouteName.PATIENT_PAY_NOW_SCREEN_ROUTE);
      },
    );
  }
}
