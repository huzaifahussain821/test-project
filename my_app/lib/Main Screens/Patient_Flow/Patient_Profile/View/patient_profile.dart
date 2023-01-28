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

class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key}) : super(key: key);

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
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
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            patientProfileWidget(),
            SizedBox(
              height: 10.h,
            ),
            patientNameAndEmail(),
            SizedBox(
              height: 10.h,
            ),
            profileDetailsContainer(
                imagePath: AssetPaths.CAKE_ICON,
                text1: "Date of Birth",
                text2: "13-August-1999"),
            SizedBox(
              height: 10.h,
            ),
            profileDetailsContainer(
                imagePath: AssetPaths.GENDER_ICON,
                text1: "Gender",
                text2: "Male"),
            SizedBox(
              height: 10.h,
            ),
            profileDetailsContainer(
                imagePath: AssetPaths.PHONE_NO_ICON,
                text1: "Phone Number",
                text2: "+0 123 456 7890"),
            SizedBox(
              height: 10.h,
            ),
            profileDetailsContainer(
                imagePath: AssetPaths.ADDRESS_ICON,
                text1: "Address",
                text2: "2118 Thornridge Cir. Syracuse"),
            SizedBox(
              height: 10.h,
            ),
            editProfileButton(),
            SizedBox(
              height: 10.h,
            ),
            removeAccountButton(),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      )),
    ));
  }

  Widget _appbarWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              AppNavigation.navigatorPop(context);
            },
            child: Image.asset(
              AssetPaths.BACK_BUTTON_IMAGE,
              scale: 3,
            ),
          ),
          InkWell(
            onTap: () {
              AppNavigation.navigatorPop(context);
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

  Widget patientProfileWidget() {
    return Center(
      child: CircleAvatar(
        radius: 55,
        backgroundColor: AppColors.GREEN_COLOR,
        child: CircleAvatar(
          radius: 52,
          backgroundColor: AppColors.WHITE_COLOR,
          child: CircleAvatar(
            radius: 50,
            child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.WHITE_COLOR),
                child: Image.asset(
                  AssetPaths.USER_PROFILE_IMAGE,
                  scale: 1,
                )
                //  FancyShimmerImage(
                //   shimmerBackColor: AppColors.BACKGROUND_COLOR,
                //   shimmerHighlightColor: AppColors.WHITE_COLOR,
                //   imageUrl: AssetPaths.LOGO_IMAGE,
                // ),
                ),
          ),
        ),
      ),
    );
  }

  Widget patientNameAndEmail() {
    return Column(
      children: [
        CustomTextWidget(
          text: "John Smith",
          textSize: 1.1.sp,
          textColor: AppColors.FONT_THEME_COLOR,
          fontWeight: FontWeight.bold,
        ),
        CustomTextWidget(
          text: "johnsmith@getnada.com",
          textSize: 1.sp,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ],
    );
  }

  Widget profileDetailsContainer(
      {String? imagePath, String? text1, String? text2}) {
    return InkWell(
      onTap: () {
        // AppNavigation.navigateTo(
        //     context, AppRouteName.PATIENT_CLINICAL_FEEDBACK_SCREEN_ROUTE);
      },
      child: Container(
        // height: AppSize.heightSize * 0.13,
        width: AppSize.widthSize,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.WHITE_PURE_COLOR),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 14),
                            decoration: BoxDecoration(
                                // border: Border.all(color: AppColors.GREY_COLOR),
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.BUTTON_COLOR.withOpacity(0.1)),
                            child: Image.asset(
                              imagePath.toString(),
                              scale: 3.5,
                              color: AppColors.BACKGROUND_COLOR,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: text1,
                                textSize: 1.2.sp,
                                textColor: AppColors.FONT_THEME_COLOR,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                              CustomTextWidget(
                                text: text2,
                                textSize: 1.1.sp,
                                textColor: AppColors.GREY_COLOR,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  CustomTextWidget(
                    text: "05,June 22",
                    textSize: 1.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget editProfileButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: AppStrings.EDIT_PROFILE_TEXT,
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
        AppNavigation.navigateTo(
            context, AppRouteName.PATIENT_EDIT_PROFILE_SCREEN_ROUTE);
      },
    );
  }

  Widget removeAccountButton() {
    return Container(
      width: AppSize.widthSize,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.RED_COLOR),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.WHITE_PURE_COLOR),
      child: Center(
        child: CustomTextWidget(
          text: "Remove Account",
          textColor: AppColors.RED_COLOR,
          textSize: 1.2.sp,
        ),
      ),
    );
  }
}
