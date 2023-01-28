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
import '../../../../Widgets/custom_text_widget.dart';

class PatientSetting extends StatefulWidget {
  const PatientSetting({Key? key}) : super(key: key);

  @override
  State<PatientSetting> createState() => _PatientSettingState();
}

class _PatientSettingState extends State<PatientSetting> {
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundImageContainerWidget(
      child: Scaffold(
          backgroundColor: AppColors.TRANSPARENT_COLOR,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.WHITE_COLOR,
            automaticallyImplyLeading: false,
            title: _appbarWidget(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  _settingButton(
                    imagePath: AssetPaths.EDIT_PROFILE_ICON,
                    buttonName: "Edit Profile",
                    onTap: () {
                      AppNavigation.navigateTo(context,
                          AppRouteName.PATIENT_EDIT_PROFILE_SCREEN_ROUTE);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _settingButton(
                    imagePath: AssetPaths.NOTIFICATION_ICON,
                    buttonName: "Notification",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _settingButton(
                      imagePath: AssetPaths.CHANGE_PASWORD_ICON,
                      buttonName: "Change Password"),
                  SizedBox(
                    height: 10.h,
                  ),
                  _settingButton(
                    imagePath: AssetPaths.PRIVACY_POLICY_ICON,
                    buttonName: "Privacy Policy",
                    onTap: () {
                      AppNavigation.navigateTo(context,
                          AppRouteName.PATIENT_TERMS_CONDITION_SCREEN_ROUTE);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _settingButton(
                    imagePath: AssetPaths.TERMS_CONDITION_ICON,
                    buttonName: "Terms & Conditions",
                    onTap: () {
                      AppNavigation.navigateTo(context,
                          AppRouteName.PATIENT_TERMS_CONDITION_SCREEN_ROUTE);
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  logoutButton()
                ],
              ),
            ),
          )),
    );
  }

  Widget _appbarWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          InkWell(
            onTap: () {
              // AppNavigation.navigatorPop(context);
            },
            child: Image.asset(
              AssetPaths.LOGO_IMAGE,
              scale: 6,
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }

  Widget _settingButton(
      {String? imagePath, String? buttonName, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: AppSize.heightSize * 0.12,
        width: AppSize.widthSize,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.WHITE_PURE_COLOR),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        // border: Border.all(color: AppColors.GREY_COLOR),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.BUTTON_COLOR.withOpacity(0.1)),
                    child: Image.asset(
                      imagePath.toString(),
                      scale: 3.5,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomTextWidget(
                    text: buttonName,
                    textSize: 1.3.sp,
                    textColor: AppColors.FONT_THEME_COLOR,
                    fontWeight: FontWeight.bold,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.GREY_COLOR),
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.WHITE_PURE_COLOR),
                child: Image.asset(
                  AssetPaths.ARROW_FORWARD_ICON,
                  scale: 3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget logoutButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize * 0.85,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: AppStrings.LOGOUT_TEXT,
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
        AppNavigation.navigateToRemovingAll(
            context, AppRouteName.SELECT_USER_SCREEN_ROUTE);
      },
    );
  }
}
