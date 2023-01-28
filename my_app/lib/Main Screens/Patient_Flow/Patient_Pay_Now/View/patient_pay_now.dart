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
import '../../../../Widgets/custom_button_widget.dart';
import '../../../../Widgets/custom_text_widget.dart';

class PatientPaNow extends StatefulWidget {
  const PatientPaNow({Key? key}) : super(key: key);

  @override
  State<PatientPaNow> createState() => _PatientPaNowState();
}

class _PatientPaNowState extends State<PatientPaNow> {
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
              child: Column(children: [
                SizedBox(
                  height: 10.h,
                ),
                patientHistoryProfile(),
                SizedBox(
                  height: 10.h,
                ),
                appointmentDetailWidget(),
                SizedBox(
                  height: 10.h,
                ),
                insurranceDetailWidget(),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: AppSize.widthSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.WHITE_PURE_COLOR),
                  child: Column(
                    children: [
                      clinicScheduleDetailsWidget(
                          text1: "Appointment Fee", text2: "\$250"),
                      SizedBox(
                        height: 10.h,
                      ),
                      clinicScheduleDetailsWidget(text1: "Tax", text2: "\$10"),
                      Divider(),
                      clinicScheduleDetailsWidget(
                          text1: "Total Amount", text2: "\$260"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                _registeredButton()
              ]),
            ))));
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

  Widget patientHistoryProfile() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.WHITE_PURE_COLOR),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
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
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: "Dr. Bessie Cooper",
                          textSize: 1.2.sp,
                          textColor: AppColors.FONT_THEME_COLOR,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomTextWidget(
                          text: "Psychiatrist",
                          textSize: 1.1.sp,
                          textColor: AppColors.GREY_COLOR,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () {
                // AppNavigation.navigateTo(
                //     context, AppRouteName.PATIENT_DOCTOR_DETAILS_SCREEN_ROUTE);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.GREY_COLOR),
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.WHITE_PURE_COLOR),
                child: Image.asset(
                  AssetPaths.ARROW_FORWARD_ICON,
                  scale: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appointmentDetailWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: AppSize.widthSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.WHITE_PURE_COLOR),
      child: Column(
        children: [
          appointmentDeatilTextHeading(),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _DateTimeDurationWidget(text1: "Date", text2: "Jan 01,2022"),
              _DateTimeDurationWidget(text1: "Date", text2: "Jan 01,2022"),
              _DateTimeDurationWidget(text1: "Date", text2: "Jan 01,2022")
            ],
          )
        ],
      ),
    );
  }

  Widget appointmentDeatilTextHeading() {
    return Row(
      children: [
        CustomTextWidget(
          text: "Appointment Detail",
          textSize: 1.1.sp,
          fontWeight: FontWeight.bold,
          textOverflow: TextOverflow.ellipsis,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ],
    );
  }

  Widget _DateTimeDurationWidget({String? text1, String? text2}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: text1,
          textSize: 1.1.sp,
          textColor: AppColors.FONT_THEME_COLOR,
          fontWeight: FontWeight.bold,
        ),
        CustomTextWidget(
          text: text2,
          textSize: 1.1.sp,
          textColor: AppColors.GREY_COLOR,
        ),
      ],
    );
  }

  Widget insurranceDetailWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: AppSize.widthSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.WHITE_PURE_COLOR),
      child: Column(
        children: [
          insurranceDeatilTextHeading(),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _insurrranceDurationWidget(
                  text1: "Insurance Company", text2: "State Farm Group"),
              _insurrranceDurationWidget(
                  text1: "Insurance Number", text2: "01234567890"),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              _insurrranceDurationWidget(
                  text1: "Expiry Date", text2: "Jan 01,2022")
            ],
          )
        ],
      ),
    );
  }

  Widget insurranceDeatilTextHeading() {
    return Row(
      children: [
        CustomTextWidget(
          text: "Insurrance Detail",
          textSize: 1.1.sp,
          fontWeight: FontWeight.bold,
          textOverflow: TextOverflow.ellipsis,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ],
    );
  }

  Widget _insurrranceDurationWidget({String? text1, String? text2}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: text1,
          textSize: 1.1.sp,
          textColor: AppColors.FONT_THEME_COLOR,
          fontWeight: FontWeight.bold,
        ),
        CustomTextWidget(
          text: text2,
          textSize: 1.1.sp,
          textColor: AppColors.GREY_COLOR,
        ),
      ],
    );
  }

  Widget clinicScheduleDetailsWidget({String? text1, String? text2}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: text1,
            textSize: 1.1.sp,
            textColor: AppColors.FONT_THEME_COLOR,
          ),
          CustomTextWidget(
            text: text2,
            textSize: 1.1.sp,
            textColor: AppColors.FONT_THEME_COLOR,
          ),
        ],
      ),
    );
  }

  Widget _registeredButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize * 0.85,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: "Pay Now",
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
            context, AppRouteName.PATIENT_BOTTOM_BAR_DASHBOARD_SCREEN_ROUTE);
      },
    );
  }
}
