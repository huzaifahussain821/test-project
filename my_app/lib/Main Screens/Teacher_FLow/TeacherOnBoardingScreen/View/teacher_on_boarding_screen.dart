import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_route_name.dart';
import '../../../../Utils/app_size.dart';
import '../../../../Utils/assets_path.dart';
import '../../../../Utils/navigation.dart';
import '../../../../Widgets/custom_text_widget.dart';

class TeacherOnBoarding extends StatefulWidget {
  const TeacherOnBoarding({Key? key}) : super(key: key);

  @override
  State<TeacherOnBoarding> createState() => _TeacherOnBoardingState();
}

class _TeacherOnBoardingState extends State<TeacherOnBoarding> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      headerBackgroundColor: AppColors.WHITE_COLOR,
      finishButtonText: 'Yes',
      finishButtonColor: AppColors.BUTTON_COLOR,
      skipTextButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetPaths.LOGO_IMAGE,
            scale: 1,
          )
        ],
      ),
      onFinish: () {
        AppNavigation.navigateReplacementNamed(
            context, AppRouteName.TEACHER_PSC_TEST_SCREEN_ROUTE);
      },
      // leading: Container(
      //   color: AppColors.RED_COLOR,
      //   child: CustomTextWidget(
      //     text: "asfjlfj",
      //     textColor: AppColors.WHITE_COLOR,
      //   ),
      // ),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            AssetPaths.LOGO_IMAGE,
            scale: 1,
          ),
          CustomTextWidget(
            text: "Skip",
            textSize: 1.2.sp,
            fontWeight: FontWeight.bold,
            textColor: AppColors.FONT_THEME_COLOR,
          ),
        ],
      ),
      hasSkip: true,
      background: [
        // Image.asset(
        //   AssetPaths.ON_BOARDING_1,
        //   fit: BoxFit.cover,
        //   scale: 1,
        // ),
        // Image.asset(
        //   AssetPaths.ON_BOARDING_2,
        //   fit: BoxFit.cover,
        //   scale: 1,
        // ),
        // Image.asset(
        //   AssetPaths.ON_BOARDING_3,
        //   fit: BoxFit.cover,
        //   scale: 1,
        // ),
        // Image.asset(
        //   AssetPaths.ON_BOARDING_4,
        //   fit: BoxFit.cover,
        //   scale: 1,
        // ),
        Container(
          height: AppSize.heightSize,
          width: AppSize.widthSize,
          color: AppColors.WHITE_COLOR,
        ),
        Container(
          height: AppSize.heightSize,
          width: AppSize.widthSize,
          color: AppColors.WHITE_COLOR,
        ),
        Container(
          height: AppSize.heightSize,
          width: AppSize.widthSize,
          color: AppColors.WHITE_COLOR,
        ),
        Container(
          height: AppSize.heightSize,
          width: AppSize.widthSize,
          color: AppColors.WHITE_COLOR,
        ),
      ],
      totalPage: 4,
      speed: 2,
      pageBodies: [
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 0),
        //   child: Image.asset(
        //     AssetPaths.ON_BOARDING_1,
        //     fit: BoxFit.fill,
        //     scale: 10,
        //   ),
        // ),
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 0),
        //   child: Image.asset(
        //     AssetPaths.ON_BOARDING_2,
        //     fit: BoxFit.fill,
        //     scale: 10,
        //   ),
        // ),
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 0),
        //   child: Image.asset(
        //     AssetPaths.ON_BOARDING_3,
        //     fit: BoxFit.fill,
        //     scale: 10,
        //   ),
        // ),
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 0),
        //   child: Image.asset(
        //     AssetPaths.ON_BOARDING_4,
        //     fit: BoxFit.fitWidth,
        //     scale: 10,
        //   ),
        // ),
        Container(
          color: AppColors.TRANSPARENT_COLOR,
          width: AppSize.widthSize,
          // padding: EdgeInsets.symmetric(horizontal: AppSize.widthSize),
          child: Column(
            children: <Widget>[
              Container(
                width: AppSize.widthSize,
                color: AppColors.RED_COLOR,
                height: AppSize.heightSize * 0.65,
                child: Image.asset(
                  AssetPaths.PSC_TEST_1_IMAGE,
                  fit: BoxFit.fill,
                  // scale: 6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomTextWidget(
                  text:
                      "We are so pleased to help you today. Before we start, let us explore how we will go ahead",
                  textSize: 1.2.sp,
                  textColor: AppColors.FONT_THEME_COLOR,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.TRANSPARENT_COLOR,
          width: AppSize.widthSize,
          // padding: EdgeInsets.symmetric(horizontal: AppSize.widthSize),
          child: Column(
            children: <Widget>[
              Container(
                width: AppSize.widthSize,
                color: AppColors.RED_COLOR,
                height: AppSize.heightSize * 0.65,
                child: Image.asset(
                  AssetPaths.PSC_TEST_2_IMAGE,
                  fit: BoxFit.fill,
                  // scale: 6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomTextWidget(
                  text:
                      " We are human beings and its okay to have different emotions at different times, however sometimes its good and sometimes bad",
                  textSize: 1.2.sp,
                  textColor: AppColors.FONT_THEME_COLOR,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.TRANSPARENT_COLOR,
          width: AppSize.widthSize,
          // padding: EdgeInsets.symmetric(horizontal: AppSize.widthSize),
          child: Column(
            children: <Widget>[
              Container(
                width: AppSize.widthSize,
                color: AppColors.RED_COLOR,
                height: AppSize.heightSize * 0.65,
                child: Image.asset(
                  AssetPaths.PSC_TEST_3_IMAGE,
                  fit: BoxFit.fill,
                  // scale: 6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomTextWidget(
                  text:
                      "We will help you to stay focused, feel motivated and finish your day at a positive note.",
                  textSize: 1.2.sp,
                  textColor: AppColors.FONT_THEME_COLOR,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.TRANSPARENT_COLOR,
          width: AppSize.widthSize,
          // padding: EdgeInsets.symmetric(horizontal: AppSize.widthSize),
          child: Column(
            children: <Widget>[
              Container(
                width: AppSize.widthSize,
                color: AppColors.TRANSPARENT_COLOR,
                height: AppSize.heightSize * 0.65,
                child: Image.asset(
                  AssetPaths.PSC_TEST_4_IMAGE,
                  fit: BoxFit.fill,
                  // scale: 6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text:
                          "You may have to answer few easy questions to design a well being program for you",
                      textSize: 1.2.sp,
                      textColor: AppColors.FONT_THEME_COLOR,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextWidget(
                      text: "Are you ready?",
                      textSize: 1.2.sp,
                      textColor: AppColors.FONT_THEME_COLOR,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
