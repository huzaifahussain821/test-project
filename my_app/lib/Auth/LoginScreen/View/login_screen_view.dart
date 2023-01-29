import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_size.dart';
import '../../../../Utils/app_strings.dart';
import '../../../../Utils/assets_path.dart';
import '../../../../Widgets/custom_button_widget.dart';
import '../../../../Widgets/custom_text_form_field_widget.dart';
import '../../../../Widgets/custom_text_widget.dart';
import '../../../Utils/app_route_name.dart';
import '../../../Utils/navigation.dart';
import '../../../Widgets/app_dialogs.dart';
import '../../../Widgets/backgroundContainerImageWidget.dart';

class LoginScreen extends StatefulWidget {
  int? userType;
  LoginScreen({required this.userType});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailConroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    print("User Type" + widget.userType.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppSize.appSizeMethod(context: context);
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
            height: 80.h,
          ),
          _emailTextFormWidget(),
          SizedBox(
            height: 10.h,
          ),
          _PasswordTextFormWidget(),
          _forgetPassword(),
          SizedBox(
            height: 30.h,
          ),
          _loginButton(),
          SizedBox(
            height: 60.h,
          ),
          _dontHaveAnAccountPassword()
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
          text: "LOG-IN",
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

  Widget _emailTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _emailConroller,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.EMAIL_ADDRESS_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.EMAIL_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _PasswordTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _passwordController,
      obscureText: true,
      prefixImagePath: AssetPaths.PASSWORD_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.08,
      labelText: AppStrings.PASSWORD_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // suffixImagePath: _passwordInvisible == true
      //     ? AssetPaths.PASSWORD_INVISIBLE_ICON
      //     : AssetPaths.PASSWORD_VISIBLE_ICON,
      // errorLines: 3,
      // obscureText: _passwordInvisible,
      // onSuffixTap: () {
      //   setState(() {
      //     _passwordInvisible = !_passwordInvisible;
      //   });
      // },
      // onValidate: (String? value) {
      //   return Validation.passwordValidationMethod(
      //       value: value ?? "", passwordField: AppStrings.PASSWORD_TEXT);
      // },
    );
  }

  Widget _forgetPassword() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              // AppNavigation.navigateTo(
              //     context, AppRouteName.FORGOTPASSWORD_SCREEN);
            },
            child: CustomTextWidget(
              text: AppStrings.FORGETPASSWORD_TEXT,
              textColor: AppColors.FONT_THEME_COLOR,
              textSize: 1.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize * 0.85,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: AppStrings.LOGIN_TEXT,
      textColor: AppColors.WHITE_PURE_COLOR,
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
        if (widget.userType == 0) {
          AppNavigation.navigateTo(
              context, AppRouteName.PATIENT_BOTTOM_BAR_DASHBOARD_SCREEN_ROUTE);
        } else if (widget.userType == 1) {
          AppNavigation.navigateTo(
              context, AppRouteName.TEACHER_DRAWER_SCREEN_ROUTE);
        } else if (widget.userType == 2) {
          AppNavigation.navigateTo(
              context, AppRouteName.INSTITITE_DRAWER_SCREEN_ROUTE);
        } else if (widget.userType == 3) {
          AppNavigation.navigateTo(
              context, AppRouteName.DOCTOR_DRAWER_SCREEN_ROUTE);
        }
      },
    );
  }

  Widget _dontHaveAnAccountPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            if (widget.userType == 0) {
              AppNavigation.navigateTo(context,
                  AppRouteName.PATIENT_BOTTOM_BAR_DASHBOARD_SCREEN_ROUTE);
            } else if (widget.userType == 1) {
              AppNavigation.navigateTo(
                  context, AppRouteName.TEACHER_SIGN_UP_SCREEN_ROUTE);
            } else if (widget.userType == 2) {
              AppNavigation.navigateTo(
                  context, AppRouteName.INSTITITE_DRAWER_SCREEN_ROUTE);
            } else if (widget.userType == 3) {
              AppNavigation.navigateTo(
                  context, AppRouteName.DOCTOR_DRAWER_SCREEN_ROUTE);
            }
          },
          child: CustomTextWidget(
            text: "Don't Have an account? ",
            textColor: AppColors.FONT_THEME_COLOR,
            textSize: 1.1.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        InkWell(
          onTap: () {
            if (widget.userType == 0) {
              AppNavigation.navigateTo(context, AppRouteName.SIGNUP_SCREEN);
            } else if (widget.userType == 1) {
              AppNavigation.navigateTo(
                  context, AppRouteName.TEACHER_SIGN_UP_SCREEN_ROUTE);
            } else if (widget.userType == 2) {
              AppNavigation.navigateTo(
                  context, AppRouteName.INSTITITE_SIGN_UP_SCREEN_ROUTE);
            } else if (widget.userType == 3) {
              AppNavigation.navigateTo(
                  context, AppRouteName.DOCTOR_SIGNUP_SCREEN);
            }
          },
          child: CustomTextWidget(
            text: "Sign-Up",
            textColor: AppColors.BUTTON_COLOR,
            textSize: 1.1.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
