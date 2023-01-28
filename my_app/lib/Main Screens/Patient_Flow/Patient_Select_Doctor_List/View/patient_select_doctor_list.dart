import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_route_name.dart';
import '../../../../Utils/assets_path.dart';
import '../../../../Widgets/backgroundContainerImageWidget.dart';
import '../../../../Widgets/custom_text_widget.dart';
import '../../../../utils/navigation.dart';

class PatientSelectDoctorList extends StatefulWidget {
  const PatientSelectDoctorList({Key? key}) : super(key: key);

  @override
  State<PatientSelectDoctorList> createState() =>
      _PatientSelectDoctorListState();
}

class _PatientSelectDoctorListState extends State<PatientSelectDoctorList> {
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
              ListView.builder(
                  controller: _scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: patientHistoryProfile(),
                    );
                  }),
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
    return InkWell(
      onTap: () {
        AppNavigation.navigateTo(
            context, AppRouteName.PATIENT_DOCTOR_DETAILS_SCREEN_ROUTE);
      },
      child: Container(
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
      ),
    );
  }
}
