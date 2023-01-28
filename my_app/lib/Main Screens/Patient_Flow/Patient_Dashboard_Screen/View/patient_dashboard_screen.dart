import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_route_name.dart';
import '../../../../Utils/app_size.dart';
import '../../../../Utils/assets_path.dart';
import '../../../../Utils/navigation.dart';
import '../../../../Widgets/backgroundContainerImageWidget.dart';
import '../../../../Widgets/custom_text_widget.dart';

class PatientDashboardScreen extends StatefulWidget {
  const PatientDashboardScreen({Key? key}) : super(key: key);

  @override
  State<PatientDashboardScreen> createState() => _PatientDashboardScreenState();
}

class _PatientDashboardScreenState extends State<PatientDashboardScreen> {
  final ScrollController _scrollController = ScrollController();
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
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            _NameProfileImageWidget(),
            SizedBox(
              height: 10.h,
            ),
            _appointmentContainerWidget(),
            SizedBox(
              height: 10.h,
            ),
            _PSC_Test_Score_Container_Widget(),
            SizedBox(
              height: 10.h,
            ),
            changeDoctorNearbyTextWidget(),
            SizedBox(
              height: 10.h,
            ),
            changeDoctorNearYouContainerWidget(),
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
          const SizedBox(),
          InkWell(
            onTap: () {
              AppNavigation.navigatorPop(context);
            },
            child: Image.asset(
              AssetPaths.LOGO_IMAGE,
              scale: 6,
            ),
          ),
          InkWell(
            onTap: () {
              AppNavigation.navigateTo(
                  context, AppRouteName.CHAT_LIST_SCREEN_ROUTE);
            },
            child: Image.asset(
              AssetPaths.CHAT_ICON,
              scale: 4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _NameProfileImageWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: "Good Morning,",
              textSize: 1.3.sp,
              fontWeight: FontWeight.bold,
              textColor: AppColors.FONT_THEME_COLOR,
            ),
            CustomTextWidget(
              text: "John Smith,",
              textSize: 1.3.sp,
              fontWeight: FontWeight.bold,
              textColor: AppColors.FONT_THEME_COLOR,
            )
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                AppNavigation.navigateTo(
                    context, AppRouteName.PATIENT_PROFILE_SCREEN_ROUTE);
              },
              child: CircleAvatar(
                radius: 33,
                backgroundColor: AppColors.GREEN_COLOR,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.WHITE_COLOR,
                  child: CircleAvatar(
                    radius: 28,
                    child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.WHITE_COLOR),
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
            )
          ],
        )
      ],
    );
  }

  Widget _appointmentContainerWidget() {
    return Container(
      // height: AppSize.heightSize * 0.23,
      width: AppSize.widthSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AssetPaths.GREEN_BACKGROUND_IMAGE,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 25,
                    child: Image.asset(AssetPaths.USER_PROFILE_IMAGE)),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "Dr. Bessie Cooper",
                      textSize: 1.1.sp,
                      textColor: AppColors.WHITE_PURE_COLOR,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTextWidget(
                      text: "Psychiatrist",
                      textSize: 1.sp,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              // height: AppSize.heightSize * 0.07,
              width: AppSize.widthSize,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.WHITE_COLOR.withOpacity(0.3)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      AssetPaths.CALENDER_WHITE_ICON,
                      color: AppColors.WHITE_PURE_COLOR.withOpacity(1),
                      scale: 1,
                    ),
                    CustomTextWidget(
                      text: "Monday, Jan 29",
                      textColor: AppColors.WHITE_PURE_COLOR,
                    ),
                    Image.asset(
                      AssetPaths.CLOCK_ICON,
                      color: AppColors.WHITE_PURE_COLOR.withOpacity(1),
                      scale: 4,
                    ),
                    CustomTextWidget(
                      text: "01:00-02:00 PM",
                      textColor: AppColors.WHITE_PURE_COLOR,
                    )
                  ],
                ),
              ),
            )
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
            Image.asset(
              AssetPaths.PSC_TEST_IMAGE,
              scale: 5,
            )
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

  Widget changeDoctorNearbyTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          text: "Change Doctors Near You",
          textSize: 1.2.sp,
          fontWeight: FontWeight.bold,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
        CustomTextWidget(
          text: "See All",
          textSize: 1.2.sp,
          textColor: AppColors.BACKGROUND_COLOR,
        ),
      ],
    );
  }

  Widget changeDoctorNearYouContainerWidget() {
    return SizedBox(
      height: AppSize.heightSize * 0.23,
      width: AppSize.widthSize,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height: AppSize.heightSize * 0.23,
              width: AppSize.widthSize * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  // scale: 1,
                  image: AssetImage(
                    AssetPaths.NEARBY_DOCTOR_bg_IMAGE,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        radius: 30,
                        child: Image.asset(AssetPaths.USER_PROFILE_IMAGE)),
                    CustomTextWidget(
                      text: "Dr. Olivia Emma",
                      textSize: 1.1.sp,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.ellipsis,
                      textColor: AppColors.FONT_THEME_COLOR,
                    ),
                    CustomTextWidget(
                      text: "Psychiatrist",
                      textSize: 1.1.sp,
                      textColor: AppColors.FONT_THEME_COLOR,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
