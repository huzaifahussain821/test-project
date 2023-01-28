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

class PatientDoctorDetails extends StatefulWidget {
  const PatientDoctorDetails({Key? key}) : super(key: key);

  @override
  State<PatientDoctorDetails> createState() => _PatientDoctorDetailsState();
}

class _PatientDoctorDetailsState extends State<PatientDoctorDetails> {
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            AboutDoctor(),
            SizedBox(
              height: 10.h,
            ),
            aboutDoctorHeadingWidget(),
            SizedBox(
              height: 10.h,
            ),
            aboutDoctorDetailTextWidget(),
            SizedBox(
              height: 10.h,
            ),
            phoneHeadingAndDetailRow(
                heading: "Phone",
                imagePath: AssetPaths.PHONE_NO_ICON,
                text1: "Contact us",
                text2: "+0 1234 567980"),
            SizedBox(
              height: 10.h,
            ),
            phoneHeadingAndDetailRow(
                heading: "Location",
                imagePath: AssetPaths.LOCATION_ICON,
                text1: "Lotus Medical Center",
                text2: "4517 Washington Ave. Manchester"),
            SizedBox(
              height: 10.h,
            ),
            certificatesHeadingWidget(),
            SizedBox(
              height: 10.h,
            ),
            certificatesviewWidget(),
            SizedBox(
              height: 10.h,
            ),
            rEQUESTTONEXTAPPOINTMENTTEXTBUTTON()
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

  Widget AboutDoctor() {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                appointmentFeeYearExperinceContainerWidget(
                    amount: "\$ 250", text: "Appointment Fee"),
                appointmentFeeYearExperinceContainerWidget(
                    amount: "10+", text: "year Expereince"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget appointmentFeeYearExperinceContainerWidget(
      {String? amount, String? text}) {
    return Container(
      height: AppSize.heightSize * 0.1,
      width: AppSize.widthSize * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.WHITE_COLOR.withOpacity(0.3)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: amount,
              textSize: 1.3.sp,
              textColor: AppColors.WHITE_PURE_COLOR,
              fontWeight: FontWeight.bold,
            ),
            CustomTextWidget(
              text: text,
              textSize: 1.1.sp,
              textColor: AppColors.WHITE_PURE_COLOR,
            ),
          ],
        ),
      ),
    );
  }

  Widget aboutDoctorHeadingWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: "About Doctor",
          textSize: 1.2.sp,
          fontWeight: FontWeight.bold,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ],
    );
  }

  Widget aboutDoctorDetailTextWidget() {
    return CustomTextWidget(
      text:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      textSize: 1.sp,
      textOverflow: TextOverflow.fade,
      textColor: AppColors.FONT_THEME_COLOR,
    );
  }

  Widget phoneHeadingAndDetailRow(
      {String? heading, String? imagePath, String? text1, String? text2}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: heading,
          textSize: 1.2.sp,
          fontWeight: FontWeight.bold,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Container(
              // height: AppSize.heightSize * 0.07,
              // width: AppSize.widthSize * 0.11,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  // border: Border.all(color: AppColors.GREY_COLOR),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.BUTTON_COLOR.withOpacity(0.1)),
              child: Image.asset(
                imagePath.toString(),
                scale: 3.5,
                color: AppColors.BUTTON_COLOR,
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
                  textSize: 1.1.sp,
                  textColor: AppColors.FONT_THEME_COLOR,
                  fontWeight: FontWeight.bold,
                  textOverflow: TextOverflow.ellipsis,
                ),
                CustomTextWidget(
                  text: text2,
                  textSize: 1.sp,
                  textOverflow: TextOverflow.ellipsis,
                  textColor: AppColors.GREY_COLOR,
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget certificatesHeadingWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: "Certificates",
          textSize: 1.2.sp,
          fontWeight: FontWeight.bold,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ],
    );
  }

  Widget certificatesviewWidget() {
    return Container(
      height: AppSize.heightSize * 0.17,
      width: AppSize.widthSize,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: certificateImageContainerWidget(),
            );
          }),
    );
  }

  Widget certificateImageContainerWidget() {
    return Container(
      height: AppSize.heightSize * 0.17,
      width: AppSize.widthSize * 0.35,
      decoration: BoxDecoration(
          // border: Border.all(color: AppColors.GREY_COLOR),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.WHITE_PURE_COLOR),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Image.asset(
          AssetPaths.CLINICAL_REPORT_IMAGE,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget rEQUESTTONEXTAPPOINTMENTTEXTBUTTON() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: AppStrings.REQUEST_TO_NEXT_APPOINTMENT_TEXT,
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
            context, AppRouteName.PATIENT_PAYMENT_METHOD_SCREEN_ROUTE);
      },
    );
  }
}
