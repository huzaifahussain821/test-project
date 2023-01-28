import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_size.dart';
import '../../../../Utils/app_strings.dart';
import '../../../../Utils/assets_path.dart';
import '../../../../Utils/navigation.dart';
import '../../../../Widgets/backgroundContainerImageWidget.dart';
import '../../../../Widgets/custom_button_widget.dart';
import '../../../../Widgets/custom_text_form_field_widget.dart';
import '../../../../Widgets/custom_text_widget.dart';
import '../../../../Widgets/custom_user_profile_image_widget.dart';
import '../../../../Widgets/image_gallery_class.dart';

class TeacherRegistration extends StatefulWidget {
  const TeacherRegistration({Key? key}) : super(key: key);

  @override
  State<TeacherRegistration> createState() => _TeacherRegistrationState();
}

class _TeacherRegistrationState extends State<TeacherRegistration> {
  String? _profileImagePath, _profileNetworkPath, _profileType;
  File? _profileTempFileImage, _profileFileImage;
  ImageGalleryClass _imageGalleryClass = ImageGalleryClass();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: _registerButton(),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          _userProfileImageWidget(),
          SizedBox(
            height: 10.h,
          ),
          _studentNameTextFormWidget(),
          _ageTextFormWidget(),
          _classTextFormWidget(),
        ],
      )),
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
          text: "Teacher Registration",
          textSize: 1.1.sp,
          textColor: AppColors.FONT_THEME_COLOR,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox()
      ],
    );
  }

  Widget _userProfileImageWidget() {
    return CustomUserProfileImageWidget(
      imagePath: _profileNetworkPath != null
          ? _profileNetworkPath
          : _profileFileImage != null
              ? _profileFileImage!.path
              : null,
      imageType: _profileNetworkPath != null
          ? AppStrings.IMAGE_NETWORK_TYPE_TEXT
          : _profileFileImage != null
              ? AppStrings.IMAGE_FILE_TYPE_TEXT
              : null,
      onTap: () {
        _imageGalleryOption();
      },
    );
  }

  Widget _studentNameTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _studentNameController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.USERNAME_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.USERNAME_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _ageTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _ageController,

      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.EMAIL_ADDRESS_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Email Address",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _classTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _classController,

      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.CLASS_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Teacher Class",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _registerButton() {
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
        // AppNavigation.navigateTo(
        //     context, AppRouteName.DOCTOR_ACADEMIC_INFORMATION_SCREEN);
      },
    );
  }

  //Select Image Start
  void _imageGalleryOption() {
    _imageGalleryClass.imageGalleryBottomSheet(
        context: context,
        onCameraTap: () {
          _getImage(imageText: AppStrings.CAMERA_TEXT);
        },
        onGalleryTap: () {
          _getImage(imageText: AppStrings.GALLERY_TEXT);
        });
  }

  void _getImage({String? imageText}) async {
    if (imageText == AppStrings.CAMERA_TEXT) {
      _profileImagePath = await _imageGalleryClass.getCameraImage();
      _cropImage(imagePath: _profileImagePath);
    } else if (imageText == AppStrings.GALLERY_TEXT) {
      _profileImagePath = await _imageGalleryClass.getGalleryImage();
      _cropImage(imagePath: _profileImagePath);
    }
  }

  void _cropImage({String? imagePath}) async {
    //Ya us hoa modal bottom sheet ko pop krna ka liya
    AppNavigation.navigatorPop(context);

    if (imagePath != null) {
      _profileTempFileImage =
          await _imageGalleryClass.cropImage(imageFilePath: imagePath);

      if (_profileTempFileImage != null) {
        _profileFileImage = _profileTempFileImage;
        _profileNetworkPath = null;
      }

      setState(() {});
    }
  }
}
