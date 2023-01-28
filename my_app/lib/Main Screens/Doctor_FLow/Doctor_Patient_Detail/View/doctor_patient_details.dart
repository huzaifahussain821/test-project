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

class DoctorPatientDetails extends StatefulWidget {
  const DoctorPatientDetails({Key? key}) : super(key: key);

  @override
  State<DoctorPatientDetails> createState() => _DoctorPatientDetailsState();
}

class _DoctorPatientDetailsState extends State<DoctorPatientDetails> {
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _createPrescriptionButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              patientHistoryProfile(),
              SizedBox(
                height: 10.h,
              ),
              downloadableFormsTextHeading(),
              SizedBox(
                height: 10.h,
              ),
              downloadableFormsListviewWidget(),
              SizedBox(
                height: 10.h,
              ),
              visitsHeadingTextWidget(),
              SizedBox(
                height: 10.h,
              ),
              feedBackListviewWidget()
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

  Widget visitsHeadingTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: "Visits",
          textSize: 1.2.sp,
          fontWeight: FontWeight.bold,
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

  Widget feedBackListviewWidget() {
    return ListView.builder(
        controller: _scrollController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: attachmentFeedBackContainer(),
          );
        });
  }

  Widget attachmentFeedBackContainer() {
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
                              CustomTextWidget(
                                text: "05 attachment files",
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
                    textColor: AppColors.GREY_COLOR,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createPrescriptionButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize * 0.85,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: "Create Prescription",
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
        AppNavigation.navigateTo(
            context, AppRouteName.DOCTOR_CREATE_PRESCRIPTION_SCREEN_ROUTE);
      },
    );
  }
}
