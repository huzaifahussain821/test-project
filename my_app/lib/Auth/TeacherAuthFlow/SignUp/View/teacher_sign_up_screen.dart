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

class TeacherSignUpScreen extends StatefulWidget {
  const TeacherSignUpScreen({Key? key}) : super(key: key);

  @override
  State<TeacherSignUpScreen> createState() => _TeacherSignUpScreenState();
}

class _TeacherSignUpScreenState extends State<TeacherSignUpScreen> {
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
  String? _userRole = AppStrings.USER_ROLE_TEXT;
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
          child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          _mentalSupportLogoWidget(),
          SizedBox(
            height: 50.h,
          ),
          _userNameTextFormWidget(),
          _universityNameTextFormWidget(),
          _emailTextFormWidget(),
          _dateOfBirthTextFormWidget(),
          _genderdropdownWidget("gender"),
          _phoneNoTextFormWidget(),
          _addressTextFormWidget(),
          _state_zipCodeTextFormFieldsRowWidget(),
          _cityTextFormWidget(),
          _countryTextFormWidget(),
          _passwordTextFormWidget(),
          _confirmPasswordTextFormWidget(),
          SizedBox(
            height: 20.h,
          ),
          _signUpButton(),
          SizedBox(
            height: 20.h,
          ),
          _HaveAnAccount(),
          SizedBox(
            height: 20.h,
          ),
        ],
      )),
    ));
  }

  Widget _appbarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            AppNavigation.navigatorPop(context);
          },
          child: Image.asset(
            AssetPaths.BACK_BUTTON_IMAGE,
            color: AppColors.FONT_THEME_COLOR,
            scale: 3,
          ),
        ),
        CustomTextWidget(
          text: "Sign-Up",
          textSize: 1.1.sp,
          textColor: AppColors.FONT_THEME_COLOR,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox()
      ],
    );
  }

  Widget _mentalSupportLogoWidget() {
    return Center(
      child: Image.asset(
        AssetPaths.LOGO_IMAGE,
        scale: 4,
      ),
    );
  }

  Widget _userNameTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _userNameConroller,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.USERNAME_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.USERNAME_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _universityNameTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _userNameConroller,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.UNIVERSITY_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "University Name",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _emailTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _emailConroller,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.EMAIL_ADDRESS_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.EMAIL_ADDRESS_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _dateOfBirthTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _emailConroller,
      suffixImagePath: AssetPaths.CALENDER_ICON,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.CAKE_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.DATE_OF_BIRTH_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _genderdropdownWidget(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 25, 0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white.withOpacity(0.9),
        child: SizedBox(
          width: AppSize.widthSize * 0.87,
          height: AppSize.heightSize * 0.08,
          // decoration: BoxDecoration(
          //   color: AppColors.GREY_COLOR.withOpacity(0.08),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          child: DropdownButtonFormField<String>(
            dropdownColor: AppColors.WHITE_PURE_COLOR,
            // icon: const Icon(Icons.arrow_downward),
            isExpanded: true,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.TRANSPARENT_COLOR, width: 1.5)),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.WHITE_COLOR, width: 1.5)),
                errorBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.WHITE_COLOR, width: 1.5)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.WHITE_COLOR, width: 1.5)),
                border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.WHITE_COLOR, width: 1.5)),
                prefixIconColor: AppColors.BUTTON_COLOR,
                prefixIcon: Image.asset(
                  AssetPaths.GENDER_ICON,
                  scale: 2.7,
                  color: AppColors.BUTTON_COLOR,
                )),
            hint: Text(
              "Gender",
              style: TextStyle(
                  color: AppColors.GREY_COLOR.withOpacity(0.9),
                  fontFamily: AppStrings.POPPINS_FONT_FAMILY,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.5),
            ),
            items: <String>['Male', 'Female', 'Other'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  userRoleMap[value].toString(),
                  style: TextStyle(color: AppColors.FONT_THEME_COLOR),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _userRole = value;
              });
            },
          ),
        ),
      ),
    );
  }

  Map<String, String> userRoleMap = {
    "Male": "Male",
    "Female": "Female",
    "Other": "Other",
  };
  Widget _phoneNoTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _phoneNoController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.PHONE_NO_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.PHONE_NUMBER_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _addressTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _addressController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.ADDRESS_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.ADDRESS_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _state_zipCodeTextFormFieldsRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_stateTextFormWidget(), _zipCodeTextFormWidget()],
    );
  }

  Widget _stateTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _stateController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.STATE_ICON,
      containerWidth: AppSize.widthSize * 0.420,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.STATE_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _zipCodeTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _zipCodeController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.ZIP_CODE_ICON,
      containerWidth: AppSize.widthSize * 0.42,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.ZIP_CODE_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _cityTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _cityController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.CITY_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.CITY_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _countryTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _countryController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.COUNTRY_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.COUNTRY_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _passwordTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _passwordController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.PASSWORD_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.PASSWORD_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _confirmPasswordTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _confirmPasswordController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.PASSWORD_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.CONFIRMPASSWORD_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _signUpButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize * 0.85,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: AppStrings.SIGNUP_TEXT,
      textColor: AppColors.WHITE_COLOR,
      fontSize: 1.2,
      isGradientShow: true,
      borderRadius: 10,
      buttonColor: AppColors.BUTTON_COLOR,
      onTap: () {
        // if ((_loginKey.currentState?.validate()) ?? false) {
        //   Constants.unFocusKeyboardMethod(context: context);
        //   // _loginMethod();
        //   loginValidationMethod();
        // }
        AppNavigation.navigatorPop(context);
        // AppNavigation.navigateTo(context, AppRouteName.ON_BOARDING_SCREEN);
      },
    );
  }

  Widget _HaveAnAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            AppNavigation.navigatorPop(context);
          },
          child: CustomTextWidget(
            text: "Already Have an account? ",
            textColor: AppColors.FONT_THEME_COLOR,
            textSize: 1.1.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        InkWell(
          onTap: () {
            AppNavigation.navigatorPop(context);
          },
          child: CustomTextWidget(
            text: "Log-In",
            textColor: AppColors.BUTTON_COLOR,
            textSize: 1.1.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
