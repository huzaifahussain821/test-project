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

class DoctorProfessionalExperience extends StatefulWidget {
  const DoctorProfessionalExperience({Key? key}) : super(key: key);

  @override
  State<DoctorProfessionalExperience> createState() =>
      _DoctorProfessionalExperienceState();
}

class _DoctorProfessionalExperienceState
    extends State<DoctorProfessionalExperience> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _clinicNameController = TextEditingController();
  final TextEditingController _clinicExpereinceController =
      TextEditingController();
  final TextEditingController _specialitiesController = TextEditingController();
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
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            _clinicNameTextFormWidget(),
            _clinicExperienceTextFormWidget(),
            _specialitiesTextFormWidget(),
            _addressTextFormWidget(),
            _state_zipCodeTextFormFieldsRowWidget(),
            _cityTextFormWidget(),
            _countryTextFormWidget(),
            scheduleContainerWidget(),
            _startTimeEndTimeTextFormFieldsRowWidget(),
            addButton(),
            clinicScheduleDetailsWidget(),
            clinicScheduleDetailsWidget(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(),
            ),
            bioContainerWidget(),
            SizedBox(
              height: 10.h,
            ),
            _registeredButton(),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    ));
  }

  Widget _appbarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            AppNavigation.navigatorPop(context);
          },
          child: Image.asset(
            AssetPaths.BACK_BUTTON_IMAGE,
            color: AppColors.FONT_THEME_COLOR,
            scale: 3,
          ),
        ),
        CustomTextWidget(
          text: "Personal Experience",
          textSize: 1.1.sp,
          textColor: AppColors.FONT_THEME_COLOR,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox()
      ],
    );
  }

  Widget _clinicNameTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _clinicNameController,
      textKeyboardType: TextInputType.text,
      prefixImagePath: AssetPaths.CLININAL_NAME_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Clinic Name",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _clinicExperienceTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _clinicExpereinceController,
      textKeyboardType: TextInputType.text,
      prefixImagePath: AssetPaths.BRIEFCASE_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Clinic Experience",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _specialitiesTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _specialitiesController,
      textKeyboardType: TextInputType.text,
      prefixImagePath: AssetPaths.SPECIALITIES_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Specialities",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _addressTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _addressController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.ADDRESS_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.ADDRESS_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _state_zipCodeTextFormFieldsRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_stateTextFormWidget(), _zipCodeTextFormWidget()],
    );
  }

  Widget _stateTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _stateController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.STATE_ICON,
      containerWidth: AppSize.widthSize * 0.420,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.STATE_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _zipCodeTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _zipCodeController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.ZIP_CODE_ICON,
      containerWidth: AppSize.widthSize * 0.42,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.ZIP_CODE_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _cityTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _cityController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.CITY_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.CITY_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _countryTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _countryController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.COUNTRY_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.COUNTRY_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget scheduleContainerWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: "Clinic Schedule",
                textSize: 1.2.sp,
                fontWeight: FontWeight.bold,
                textColor: AppColors.FONT_THEME_COLOR,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weekdaysContainer(dayName: "Mon"),
              weekdaysContainer(dayName: "Tue"),
              weekdaysContainer(dayName: "Wed")
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weekdaysContainer(dayName: "Thu"),
              weekdaysContainer(dayName: "Fri"),
              weekdaysContainer(dayName: "Sat")
            ],
          )
        ],
      ),
    );
  }

  Widget weekdaysContainer({String? dayName}) {
    return Container(
      height: AppSize.heightSize * 0.065,
      width: AppSize.widthSize * 0.25,
      decoration: BoxDecoration(
          // border: Border.all(color: AppColors.GREY_COLOR),
          borderRadius: BorderRadius.circular(30),
          color: AppColors.GREY_COLOR.withOpacity(0.1)),
      child: Center(
        child: CustomTextWidget(
          text: dayName,
          textSize: 1.1.sp,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ),
    );
  }

  Widget _startTimeEndTimeTextFormFieldsRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_startTimeTextFormWidget(), _endTimeTextFormWidget()],
    );
  }

  Widget _startTimeTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _stateController,
      textKeyboardType: TextInputType.emailAddress,
      suffixImagePath: AssetPaths.STATE_ICON,
      containerWidth: AppSize.widthSize * 0.420,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.STATE_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _endTimeTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _zipCodeController,
      textKeyboardType: TextInputType.emailAddress,
      suffixImagePath: AssetPaths.ZIP_CODE_ICON,
      containerWidth: AppSize.widthSize * 0.42,

      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.ZIP_CODE_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget addButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        width: AppSize.widthSize,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.FONT_THEME_COLOR),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.TRANSPARENT_COLOR,
        ),
        child: Center(
          child: CustomTextWidget(
            text: "Add",
            textColor: AppColors.FONT_THEME_COLOR,
            textSize: 1.2.sp,
          ),
        ),
      ),
    );
  }

  Widget clinicScheduleDetailsWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: "Thursday",
            textSize: 1.1.sp,
            textColor: AppColors.FONT_THEME_COLOR,
          ),
          CustomTextWidget(
            text: "02:00pm to 05:00pm",
            textSize: 1.1.sp,
            textColor: AppColors.FONT_THEME_COLOR,
          ),
        ],
      ),
    );
  }

  Widget bioContainerWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: "Bio",
                textSize: 1.2.sp,
                fontWeight: FontWeight.bold,
                textColor: AppColors.FONT_THEME_COLOR,
              ),
            ],
          ),
          _bioTextFormWidget()
        ],
      ),
    );
  }

  Widget _bioTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _clinicExpereinceController,
      textKeyboardType: TextInputType.text,
      prefixImagePath: AssetPaths.BRIEFCASE_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.2,
      labelText: "Bio",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _registeredButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize * 0.85,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: "Register",
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
            context, AppRouteName.DOCTOR_DASHBAORD_SCREEN_ROUTE);
      },
    );
  }
}
