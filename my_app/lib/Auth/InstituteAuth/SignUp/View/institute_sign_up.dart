import 'dart:io';

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
import '../../../../Widgets/custom_user_profile_image_widget.dart';
import '../../../../Widgets/image_gallery_class.dart';

class InstituteSignUp extends StatefulWidget {
  const InstituteSignUp({Key? key}) : super(key: key);

  @override
  State<InstituteSignUp> createState() => _InstituteSignUpState();
}

class _InstituteSignUpState extends State<InstituteSignUp> {
  String? _profileImagePath, _profileNetworkPath;
  File? _profileTempFileImage, _profileFileImage;
  final ImageGalleryClass _imageGalleryClass = ImageGalleryClass();
  final TextEditingController _emailConroller = TextEditingController();
  final TextEditingController _userNameConroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
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
          child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          _userProfileImageWidget(),
          SizedBox(
            height: 10.h,
          ),
          _userNameTextFormWidget(),
          _emailTextFormWidget(),
          _phoneNoTextFormWidget(),
          _addressTextFormWidget(),
          _state_zipCodeTextFormFieldsRowWidget(),
          _cityTextFormWidget(),
          _countryTextFormWidget(),
          _passwordTextFormWidget(),
          _confirmPasswordTextFormWidget(),
          SizedBox(
            height: 20.h,
          ),
          _signUpButton(),
          SizedBox(
            height: 20.h,
          ),
          _HaveAnAccount(),
          SizedBox(
            height: 20.h,
          ),
        ],
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
              print("huzaida");
              // ZoomDrawer.of(context)!.open();
            },
            child: Image.asset(
              AssetPaths.BACK_BUTTON_IMAGE,
              scale: 4,
              color: AppColors.BUTTON_COLOR,
            ),
          ),
          CustomTextWidget(
            text: "Sign Up",
            textSize: 1.1.sp,
            textColor: AppColors.FONT_THEME_COLOR,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(),
        ],
      ),
    );
  }

  Widget _userNameTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _userNameConroller,
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

  Widget _emailTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _emailConroller,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.EMAIL_ADDRESS_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.EMAIL_ADDRESS_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _phoneNoTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _phoneNoController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.PHONE_NO_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.PHONE_NUMBER_TEXT,
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

  Widget _passwordTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _passwordController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.PASSWORD_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.PASSWORD_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _confirmPasswordTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _confirmPasswordController,
      textKeyboardType: TextInputType.emailAddress,
      prefixImagePath: AssetPaths.PASSWORD_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: AppStrings.CONFIRMPASSWORD_TEXT,
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget _signUpButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize * 0.85,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: AppStrings.SIGNUP_TEXT,
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
        //     context, AppRouteName.INSTITITE_DASHBOARD_SCREEN_ROUTE);
      },
    );
  }

  Widget _HaveAnAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            AppNavigation.navigatorPop(context);
          },
          child: CustomTextWidget(
            text: "Already Have an account? ",
            textColor: AppColors.FONT_THEME_COLOR,
            textSize: 1.1.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        InkWell(
          onTap: () {
            AppNavigation.navigatorPop(context);
          },
          child: CustomTextWidget(
            text: "Log-In",
            textColor: AppColors.BUTTON_COLOR,
            textSize: 1.1.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
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
