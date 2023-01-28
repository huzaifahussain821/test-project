import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

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


class InstituteConcernedDashboard extends StatefulWidget {
  const InstituteConcernedDashboard({Key? key}) : super(key: key);

  @override
  State<InstituteConcernedDashboard> createState() =>
      _InstituteConcernedDashboardState();
}

class _InstituteConcernedDashboardState
    extends State<InstituteConcernedDashboard> {
  int? dashbaordTabIndex = 0;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  List<String>? dashboardLsit = ["Invited Students", "Invited Teachers"];

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
        child: dashbaordTabIndex == 0
            ? invitedStudentsButton()
            : invitedTeachersButton(),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            DashBoardTabBarWidget(),
            SizedBox(
              height: 10.h,
            ),
            _searchTextFormWidget(),
            dashbaordTabIndex == 0
                ? invitedStudentsHeadingTextWidget()
                : invitedTeachersHeadingTextWidget(),
            dashbaordTabIndex == 0
                ? invitedStudentsListviewWidget()
                : invitedTeachersContainer(),
          ],
        ),
      )),
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
              // print("huzaida");
              FocusScope.of(context).unfocus();
              if (ZoomDrawer.of(context)!.isOpen()) {
                FocusScope.of(context).unfocus();
                ZoomDrawer.of(context)?.close();
              } else {
                FocusScope.of(context).unfocus();
                ZoomDrawer.of(context)!.open();
              }
            },
            child: Image.asset(
              AssetPaths.MENU_ICON,
              scale: 4,
              color: AppColors.BUTTON_COLOR,
            ),
          ),
          InkWell(
            onTap: () {
              // print("huzaida");
              // ZoomDrawer.of(context)!.toggle();
              // AppNavigation.navigatorPop(context);
            },
            child: Image.asset(
              AssetPaths.LOGO_IMAGE,
              scale: 6,
              // color: AppColors.butt,
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }

  Widget invitedStudentsButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize * 0.85,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: "Invited Students",
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
        AppNavigation.navigateTo(
            context, AppRouteName.STUDENT_REGISTRATION_SCREEN_ROUTE);
        // }
      },
    );
  }

  Widget invitedTeachersButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize * 0.85,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: "Invited Teachers",
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
        AppNavigation.navigateTo(
            context, AppRouteName.TEACHER_REGISTRATION_SCREEN_ROUTE);
        // }
      },
    );
  }

  Widget DashBoardTabBarWidget() {
    return Center(
      child: SizedBox(
        height: AppSize.heightSize * 0.13,
        child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  dashbaordTabIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: AppSize.heightSize * 0.13,
                  width: AppSize.widthSize * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: dashbaordTabIndex == index
                          ? AppColors.BUTTON_COLOR
                          : AppColors.GREY_COLOR.withOpacity(0.2)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: "250",
                          textSize: 1.3.sp,
                          textColor: dashbaordTabIndex != index
                              ? AppColors.BUTTON_COLOR
                              : AppColors.WHITE_PURE_COLOR,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomTextWidget(
                          text: dashboardLsit![index].toString(),
                          textSize: 1.1.sp,
                          textColor: dashbaordTabIndex != index
                              ? AppColors.BUTTON_COLOR
                              : AppColors.WHITE_PURE_COLOR,
                          // textColor: "fontColor",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _searchTextFormWidget() {
    return CustomTextFormFieldWidget(
      controller: _searchController,
      textKeyboardType: TextInputType.emailAddress,
      suffixImagePath: AssetPaths.SEARCH_ICON,
      containerWidth: AppSize.widthSize * 0.86,
      containerHeight: AppSize.heightSize * 0.09,
      labelText: "Search here.....",
      textColor: AppColors.FONT_THEME_COLOR,
      iconColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.TRANSPARENT_COLOR,
      // onValidate: (String? value) {
      //   return Validation.emailValidationMethod(value: value ?? "");
      // }
    );
  }

  Widget invitedStudentsHeadingTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: "Invited Students",
          textSize: 1.2.sp,
          fontWeight: FontWeight.bold,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ],
    );
  }

  Widget invitedTeachersHeadingTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: "Invited Teachers",
          textSize: 1.2.sp,
          fontWeight: FontWeight.bold,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ],
    );
  }

  Widget invitedStudentsListviewWidget() {
    return ListView.builder(
        controller: _scrollController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: invitedStudentsContainer(),
          );
        });
  }

  Widget invitedStudentsContainer() {
    return InkWell(
      onTap: () {
        AppNavigation.navigateTo(
            context, AppRouteName.STUDENT_PROFILE_SCREEN_ROUTE);
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
                          CircleAvatar(
                            radius: 30,
                            child: Image.asset(
                              AssetPaths.USER_PROFILE_IMAGE,
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

  Widget invitedTeachersContainer() {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      childAspectRatio: 3 / 2.5,
      reverse: false,
      mainAxisSpacing: 10.0,
      padding: EdgeInsets.all(1),
      addAutomaticKeepAlives: true,
      addRepaintBoundaries: true,
      addSemanticIndexes: true,
      shrinkWrap: true,
      children: List.generate(10, (index) {
        return InkWell(
          onTap: () {
            AppNavigation.navigateTo(
                context, AppRouteName.TEACHER_PROFILE_SCREEN_ROUTE);
          },
          child: Container(
            height: AppSize.widthSize * 0.1,
            width: AppSize.widthSize,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.WHITE_PURE_COLOR),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: Image.asset(
                      AssetPaths.USER_PROFILE_IMAGE,
                    ),
                  ),
                  Column(
                    children: [
                      CustomTextWidget(
                        text: "Devon Lane",
                        textSize: 1.2.sp,
                        textColor: AppColors.FONT_THEME_COLOR,
                        fontWeight: FontWeight.bold,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      CustomTextWidget(
                        text: "Teacher",
                        textSize: 1.1.sp,
                        textColor: AppColors.GREY_COLOR,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
