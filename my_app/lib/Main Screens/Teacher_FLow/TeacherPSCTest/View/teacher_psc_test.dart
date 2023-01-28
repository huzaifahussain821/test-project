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

class TeacherPSCTest extends StatefulWidget {
  const TeacherPSCTest({Key? key}) : super(key: key);

  @override
  State<TeacherPSCTest> createState() => _TeacherPSCTestState();
}

class _TeacherPSCTestState extends State<TeacherPSCTest> {
  int _groupValue = -1;

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
          // bottomNavigationBar: Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [nextQuestionButton(), previousQuestionButton()],
          // ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  questionListContainer(),
                  questionYesButtoncontainer(),
                  SizedBox(
                    height: 220.h,
                  ),
                  nextQuestionButton(),
                  SizedBox(
                    height: 10.h,
                  ),
                  previousQuestionButton()
                ],
              ),
            ),
          )),
    );
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
          CustomTextWidget(
            text: "1/14",
            textColor: AppColors.FONT_THEME_COLOR,
            textSize: 0.8.sp,
          )
        ],
      ),
    );
  }

  Widget questionListContainer() {
    return Container(
      width: AppSize.widthSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.WHITE_PURE_COLOR),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: CustomTextWidget(
          text:
              "Most of the time do you find yourself taking actions for the plans you have set for your daily life",
          textColor: AppColors.FONT_THEME_COLOR,
          textSize: 1.1.sp,
        ),
      ),
    );
  }

  Widget questionYesButtoncontainer() {
    return Container(
      width: AppSize.widthSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.WHITE_PURE_COLOR),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: <Widget>[
            RadioListTile(
              value: 0,
              groupValue: _groupValue,
              title: CustomTextWidget(
                text: "Yes(0)",
                textColor: AppColors.FONT_THEME_COLOR,
                textSize: 1.sp,
              ),
              onChanged: (newValue) =>
                  setState(() => _groupValue = int.parse(newValue.toString())),
              activeColor: AppColors.BUTTON_COLOR,
              selected: false,
            ),
            RadioListTile(
              value: 1,
              groupValue: _groupValue,
              title: CustomTextWidget(
                text: "No(15)",
                textColor: AppColors.FONT_THEME_COLOR,
                textSize: 1.sp,
              ),
              onChanged: (newValue) =>
                  setState(() => _groupValue = int.parse(newValue.toString())),
              activeColor: AppColors.BUTTON_COLOR,
              selected: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget nextQuestionButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: "Next",
      textColor: AppColors.WHITE_PURE_COLOR,
      fontSize: 1.2,
      isGradientShow: true,
      borderRadius: 10,
      buttonColor: AppColors.BUTTON_COLOR,
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: CustomTextWidget(
                    text: "PSC Test",
                    textColor: AppColors.FONT_THEME_COLOR,
                    textSize: 1.1.sp,
                  ),
                  content: Container(
                    width: AppSize.widthSize,
                    height: AppSize.heightSize * 0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              text: "Based on your answer,",
                              textColor: AppColors.FONT_THEME_COLOR,
                              textSize: 1.1.sp,
                            )
                          ],
                        ),
                        CustomTextWidget(
                          text: "your score is xxx",
                          textColor: AppColors.FONT_THEME_COLOR,
                          textSize: 1.1.sp,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        consultQuestionButton()
                      ],
                    ),
                  ),
                ));

        // showDialog(
        //     context: context,
        //     barrierDismissible: false,
        //     builder: (BuildContext context) {
        //       return WillPopScope(
        //         onWillPop: () async {
        //           return false;
        //         },
        //         child: Column(
        //           children: [
        //             Row(
        //               children: [
        //                 CustomTextWidget(
        //                   text: "PSC Test",
        //                   textColor: AppColors.FONT_THEME_COLOR,
        //                   textSize: 1.1.sp,
        //                 )
        //               ],
        //             ),
        //             Column(
        //               children: [
        //                 CustomTextWidget(
        //                   text: "PSC Test",
        //                   textColor: AppColors.FONT_THEME_COLOR,
        //                   textSize: 1.1.sp,
        //                 ),
        //                 CustomTextWidget(
        //                   text: "PSC Test",
        //                   textColor: AppColors.FONT_THEME_COLOR,
        //                   textSize: 1.1.sp,
        //                 )
        //               ],
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [exitButton(), consultQuestionButton()],
        //             )
        //           ],
        //         ),
        //       );
        //     });
        // if ((_loginKey.currentState?.validate()) ?? false) {
        //   Constants.unFocusKeyboardMethod(context: context);
        //   // _loginMethod();
        //   loginValidationMethod();
        // }
        // AppNavigation.navigateTo(
        //     context, AppRouteName.PATIENT_EDIT_PROFILE_SCREEN_ROUTE);
      },
    );
  }

  Widget previousQuestionButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: AppSize.widthSize,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.RED_COLOR),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.WHITE_PURE_COLOR),
        child: Center(
          child: CustomTextWidget(
            text: "Previous",
            textColor: AppColors.RED_COLOR,
            textSize: 1.2.sp,
          ),
        ),
      ),
    );
  }

  Widget exitButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: AppSize.widthSize * 0.3,
        height: 45,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.RED_COLOR),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.WHITE_PURE_COLOR),
        child: Center(
          child: CustomTextWidget(
            text: "Exit",
            textColor: AppColors.RED_COLOR,
            textSize: 1.2.sp,
          ),
        ),
      ),
    );
  }

  Widget consultQuestionButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize,
      containerheight: AppSize.heightSize * 0.07,
      buttonText: "Share with Administrator",
      textColor: AppColors.WHITE_PURE_COLOR,
      fontSize: 1.1.sp,
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
            context, AppRouteName.TEACHER_DRAWER_SCREEN_ROUTE);
      },
    );
  }

  // Widget _myRadioButton({String? title, int? value, Function? onChanged}) {
  //   return RadioListTile(
  //     value: value,
  //     groupValue: _groupValue,
  //     onChanged: onChanged,
  //     title: Text(title!),
  //   );
  // }
}










 // Column(
        //   children: <Widget>[
        //     _myRadioButton(
        //       title: "Checkbox 0",
        //       value: 0,
        //       onChanged: (newValue) => setState(() => _groupValue = newValue),
        //     ),
        //     _myRadioButton(
        //       title: "Checkbox 1",
        //       value: 1,
        //       onChanged: (newValue) => setState(() => _groupValue = newValue),
        //     ),
        //   ],
          // Row(
          //   children: [
          //     CustomTextWidget(
          //       text: "Yes(0)",
          //     ),
          //     Radio(
          //         value: "radio value",
          //         groupValue: "group value",
          //         onChanged: (value) {
          //           print(value); //selected value
          //         })
          //   ],