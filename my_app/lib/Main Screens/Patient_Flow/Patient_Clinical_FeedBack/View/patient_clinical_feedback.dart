import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_size.dart';
import '../../../../Utils/assets_path.dart';
import '../../../../Utils/navigation.dart';
import '../../../../Widgets/backgroundContainerImageWidget.dart';
import '../../../../Widgets/custom_button_widget.dart';
import '../../../../Widgets/custom_text_widget.dart';

class PatientClinicalFeedback extends StatefulWidget {
  bool? showEditButton;
  PatientClinicalFeedback({Key? key, this.showEditButton}) : super(key: key);

  @override
  State<PatientClinicalFeedback> createState() =>
      _PatientClinicalFeedbackState();
}

class _PatientClinicalFeedbackState extends State<PatientClinicalFeedback> {
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
      bottomNavigationBar:
          widget.showEditButton == true ? updateButton() : SizedBox(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              medicalPrescriptionTextWidget(),
              SizedBox(
                height: 10.h,
              ),
              medicalPrescriptionDetailWidget(),
              SizedBox(
                height: 10.h,
              ),
              medicalReportTextWidget(),
              SizedBox(
                height: 10.h,
              ),
              medicalReportListviewWidget()
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
          widget.showEditButton == true
              ? InkWell(
                  onTap: () {
                    // AppNavigation.navigatorPop(context);
                  },
                  child: Image.asset(
                    AssetPaths.EDIT_ICON,
                    scale: 4,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget medicalPrescriptionTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: "Medical Prescription",
          textSize: 1.2.sp,
          fontWeight: FontWeight.bold,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ],
    );
  }

  Widget medicalPrescriptionDetailWidget() {
    return CustomTextWidget(
      text:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      textSize: 1.sp,
      textOverflow: TextOverflow.fade,
      textColor: AppColors.FONT_THEME_COLOR,
    );
  }

  Widget medicalReportTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: "Medical Report",
          textSize: 1.2.sp,
          fontWeight: FontWeight.bold,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ],
    );
  }

  Widget medicalReportListviewWidget() {
    return ListView.builder(
        controller: _scrollController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: medicalReportContainerWidget(),
          );
        });
  }

  Widget medicalReportContainerWidget() {
    return Container(
      // height: AppSize.heightSize * 0.37,
      width: AppSize.widthSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.WHITE_PURE_COLOR),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetPaths.CLINICAL_REPORT_IMAGE),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "Clinical Feedback",
                      textSize: 1.sp,
                      textColor: AppColors.FONT_THEME_COLOR,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    CustomTextWidget(
                      text: "05 attachment files",
                      textSize: 1.sp,
                      textColor: AppColors.GREY_COLOR,
                    ),
                  ],
                ),
                Image.asset(
                  AssetPaths.DOWNLOAD_ICON,
                  scale: 4,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget updateButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomButtonWidget(
        containerWidth: AppSize.widthSize * 0.85,
        // containerheight: AppSize.heightSize * 0.07,
        buttonText: "Update",
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
          // AppNavigation.navigateTo(
          //     context, AppRouteName.PATIENT_CLINICAL_FEEDBACK_SCREEN_ROUTE,
          //     arguments: PatientClinicalFeedbackRoutingArguments(
          //         showEditFeedbackButton: true));
        },
      ),
    );
  }
}
