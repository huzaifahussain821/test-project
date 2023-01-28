import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
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
import '../../../../Widgets/custom_text_form_field_widget.dart';
import '../../../../Widgets/custom_text_widget.dart';
import '../../../Patient_Flow/Patient_Clinical_FeedBack/RoutingArgument/patient_clinical_feedback_routing_arguments.dart';

class DoctorCreatePrescription extends StatefulWidget {
  const DoctorCreatePrescription({Key? key}) : super(key: key);

  @override
  State<DoctorCreatePrescription> createState() =>
      _DoctorCreatePrescriptionState();
}

class _DoctorCreatePrescriptionState extends State<DoctorCreatePrescription> {
  TextEditingController _medicalPrescriptionController =
      TextEditingController();
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
      bottomNavigationBar: createButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              medicalPrescriptionHeadingTextWidget(),
              _medicalPrescriptionTextFormWidget(),
              certificatesTextWidget(),
              uploadCertificatesContainerWidget(),
              certificatesviewWidget()
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

  Widget medicalPrescriptionHeadingTextWidget() {
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

  Widget _medicalPrescriptionTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _medicalPrescriptionController,
      textKeyboardType: TextInputType.emailAddress,
      // prefixImagePath: AssetPaths.PASSWORD_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Prescription Type here...",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget certificatesTextWidget() {
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
          // physics: const NeverScrollableScrollPhysics(),
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

  Widget uploadCertificatesContainerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(20),
        dashPattern: [10, 10],
        color: AppColors.FONT_THEME_COLOR,
        strokeWidth: 2,
        child: Container(
            width: AppSize.widthSize,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            // color: Colors.black12,
            child: Column(
              children: [
                Image.asset(
                  AssetPaths.UPLOAD_ICON,
                  scale: 1,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextWidget(
                  text: "Only .jpg .pdf .png files",
                  textSize: 1.2.sp,
                  textColor: AppColors.FONT_THEME_COLOR,
                  fontWeight: FontWeight.bold,
                  textOverflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextWidget(
                  text: "max size of 15 mb",
                  textSize: 1.1.sp,
                  textColor: AppColors.GREY_COLOR,
                ),
              ],
            )),
      ),
    );
  }

  Widget createButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomButtonWidget(
        containerWidth: AppSize.widthSize * 0.85,
        // containerheight: AppSize.heightSize * 0.07,
        buttonText: "Create",
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
              context, AppRouteName.PATIENT_CLINICAL_FEEDBACK_SCREEN_ROUTE,
              arguments: PatientClinicalFeedbackRoutingArguments(
                  showEditFeedbackButton: true));
        },
      ),
    );
  }
}
