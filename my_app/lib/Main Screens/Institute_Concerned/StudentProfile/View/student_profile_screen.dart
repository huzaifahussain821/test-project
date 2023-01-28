import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_size.dart';
import '../../../../Utils/assets_path.dart';
import '../../../../Utils/navigation.dart';
import '../../../../Widgets/backgroundContainerImageWidget.dart';
import '../../../../Widgets/custom_text_widget.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              AboutTeacher(),
              SizedBox(
                height: 10.h,
              ),
              _PSC_Test_Score_Container_Widget(),
              SizedBox(
                height: 10.h,
              ),
              profileDetailsContainer(
                  imagePath: AssetPaths.STUDENTID_ICON,
                  text1: "Student Id",
                  text2: "1234456"),
              SizedBox(
                height: 10.h,
              ),
              profileDetailsContainer(
                  imagePath: AssetPaths.CAKE_ICON, text1: "Age", text2: "24"),
              SizedBox(
                height: 10.h,
              ),
              profileDetailsContainer(
                  imagePath: AssetPaths.CLASS_ICON,
                  text1: "class",
                  text2: "5th class"),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
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
              AppNavigation.navigatorPop(context);
            },
            child: Image.asset(
              AssetPaths.BACK_BUTTON_IMAGE,
              scale: 3,
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
          const SizedBox(),
        ],
      ),
    );
  }

  Widget AboutTeacher() {
    return Container(
      // height: AppSize.heightSize * 0.35,
      width: AppSize.widthSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AssetPaths.GREEN_BACKGROUND_IMAGE,
            ),
          ),
          color: AppColors.WHITE_PURE_COLOR),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 35,
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
            CustomTextWidget(
              text: "Dr. Bessie Cooper",
              textSize: 1.2.sp,
              textColor: AppColors.WHITE_PURE_COLOR,
              fontWeight: FontWeight.bold,
            ),
            CustomTextWidget(
              text: "Psychiatrist",
              textColor: AppColors.WHITE_PURE_COLOR,
              textSize: 1.2.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _PSC_Test_Score_Container_Widget() {
    return Container(
        // height: AppSize.heightSize * 0.2,
        width: AppSize.widthSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AssetPaths.BLUE_BACKGROUND_IMAGE,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: "PSC TEST",
                    textSize: 1.3.sp,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.WHITE_PURE_COLOR,
                  ),
                  SizedBox(
                    height: AppSize.heightSize * 0.03,
                  ),
                  CustomTextWidget(
                    text: "score 5-9",
                    textSize: 1.1.sp,
                    textColor: AppColors.WHITE_PURE_COLOR,
                  ),
                  CustomTextWidget(
                    text: "Mild Anxiety",
                    textSize: 1.1.sp,
                    textColor: AppColors.WHITE_PURE_COLOR,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              child: CustomTextWidget(
                text: "Share with Administration",
                textSize: 1.1.sp,
                textColor: AppColors.WHITE_PURE_COLOR,
              ),
            ),
          ],
        )
        // Stack(
        //   children: [
        //     Positioned(
        //         child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           CustomTextWidget(
        //             text: "PSC TEST",
        //             textSize: 1.4.sp,
        //             fontWeight: FontWeight.bold,
        //             textColor: AppColors.WHITE_PURE_COLOR,
        //           ),
        //           SizedBox(
        //             height: 20.h,
        //           ),
        //           CustomTextWidget(
        //             text: "score 5-9",
        //             textSize: 1.2.sp,
        //             textColor: AppColors.WHITE_PURE_COLOR,
        //           ),
        //           CustomTextWidget(
        //             text: "Mild Anxiety",
        //             textSize: 1.2.sp,
        //             textColor: AppColors.WHITE_PURE_COLOR,
        //           ),
        //         ],
        //       ),
        //     )),
        //     Align(
        //       alignment: Alignment.centerRight,
        //       child: Positioned(
        //           top: 20, child: Image.asset(AssetPaths.PSC_TEST_IMAGE)),
        //     )
        //   ],
        // ),
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
}
