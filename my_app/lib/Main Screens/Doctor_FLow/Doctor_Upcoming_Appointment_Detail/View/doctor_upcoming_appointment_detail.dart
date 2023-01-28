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

class DoctorUpcomingAppointmentDetail extends StatefulWidget {
  const DoctorUpcomingAppointmentDetail({Key? key}) : super(key: key);

  @override
  State<DoctorUpcomingAppointmentDetail> createState() =>
      _DoctorUpcomingAppointmentDetailState();
}

class _DoctorUpcomingAppointmentDetailState
    extends State<DoctorUpcomingAppointmentDetail> {
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
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
              downloadableFormsTextHeading(),
              SizedBox(
                height: 10.h,
              ),
              downloadableFormsListviewWidget()
            ],
          ),
        ),
      ),
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

  Widget downloadableFormsTextHeading() {
    return Row(
      children: [
        CustomTextWidget(
          text: "Downloadable Forms",
          textSize: 1.1.sp,
          fontWeight: FontWeight.bold,
          textOverflow: TextOverflow.ellipsis,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ],
    );
  }

  Widget downloadableFormsListviewWidget() {
    return ListView.builder(
        controller: _scrollController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: downloadableFormsContainer(),
          );
        });
  }

  Widget downloadableFormsContainer() {
    return InkWell(
      onTap: () {
        // AppNavigation.navigateTo(
        //     context, AppRouteName.PATIENT_CLINICAL_FEEDBACK_SCREEN_ROUTE);
      },
      child: Container(
        // height: AppSize.heightSize * 0.13,
        width: AppSize.widthSize,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.FONT_THEME_COLOR),
            borderRadius: BorderRadius.circular(20),
            color: AppColors.FONT_THEME_COLOR.withOpacity(0.2)),
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
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 14),
                            decoration: BoxDecoration(
                                // border: Border.all(color: AppColors.GREY_COLOR),
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.BUTTON_COLOR.withOpacity(0.1)),
                            child: Image.asset(
                              AssetPaths.ATTACHMENT_FILE_IMAGE,
                              scale: 3.5,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: "Clinical Feedback",
                                textSize: 1.2.sp,
                                textColor: AppColors.FONT_THEME_COLOR,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.ellipsis,
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
                      padding:
                          EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.TRANSPARENT_COLOR),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.TRANSPARENT_COLOR),
                      child: Image.asset(
                        AssetPaths.DOWNLOAD_ICON,
                        scale: 4,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
