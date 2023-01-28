import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_route_name.dart';
import '../../../../Utils/app_size.dart';
import '../../../../Utils/assets_path.dart';
import '../../../../Utils/navigation.dart';
import '../../../../Widgets/backgroundContainerImageWidget.dart';
import '../../../../Widgets/custom_text_widget.dart';

class DoctorDashBoard extends StatefulWidget {
  const DoctorDashBoard({Key? key}) : super(key: key);

  @override
  State<DoctorDashBoard> createState() => _DoctorDashBoardState();
}

class _DoctorDashBoardState extends State<DoctorDashBoard> {
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundImageContainerWidget(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppSize.heightSize * 0.25),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AssetPaths.BLUE_BACKGROUND_2_IMAGE))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_appbarWidget(), _NameDoctorProfileImageWidget()],
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(children: [
            SizedBox(
              height: 5.h,
            ),
            newAppointmentTextHeading(),
            SizedBox(
              height: 10.h,
            ),
            _appointmentContainerWidget(),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
                onTap: () {
                  AppNavigation.navigateTo(
                      context,
                      AppRouteName
                          .DOCTOR_UPCOMING_APPOINTMENT_LIST_SCREEN_ROUTE);
                },
                child: Image.asset(AssetPaths.UPCOMING_APPOINTMENTS_IMAGE)),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
                onTap: () {
                  AppNavigation.navigateTo(
                      context, AppRouteName.CHAT_LIST_SCREEN_ROUTE);
                },
                child: Image.asset(AssetPaths.CHATS_IMAGE)),
            SizedBox(
              height: 10.h,
            ),
            patientHistoryTextWidget(),
            SizedBox(
              height: 10.h,
            ),
            patientsHistoryListviewWidget()
          ]),
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
              // print("huzaida");
              FocusScope.of(context).unfocus();
              if (ZoomDrawer.of(context)!.isOpen()) {
                FocusScope.of(context).unfocus();
                ZoomDrawer.of(context)?.close();
              } else {
                FocusScope.of(context).unfocus();
                ZoomDrawer.of(context)!.open();
              }
              // ZoomDrawer.of(context)!.open();
            },
            child: Image.asset(
              AssetPaths.MENU_ICON,
              scale: 4,
              color: AppColors.WHITE_COLOR,
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
              color: AppColors.WHITE_COLOR,
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }

  Widget _NameDoctorProfileImageWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: "Good Morning,",
              textSize: 1.3.sp,
              fontWeight: FontWeight.bold,
              textColor: AppColors.WHITE_PURE_COLOR,
            ),
            CustomTextWidget(
              text: "Dr. Bessie Cooper",
              textSize: 1.3.sp,
              fontWeight: FontWeight.bold,
              textColor: AppColors.WHITE_PURE_COLOR,
            ),
            CustomTextWidget(
              text: "Psychiatrist",
              textSize: 1.3.sp,
              textColor: AppColors.WHITE_PURE_COLOR,
            )
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                // AppNavigation.navigateTo(
                //     context, AppRouteName.PATIENT_PROFILE_SCREEN_ROUTE);
              },
              child: CircleAvatar(
                radius: 33,
                backgroundColor: AppColors.WHITE_PURE_COLOR,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.FONT_THEME_COLOR,
                  child: CircleAvatar(
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
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget newAppointmentTextHeading() {
    return Row(
      children: [
        CustomTextWidget(
          text: "New Appointments",
          textSize: 1.1.sp,
          fontWeight: FontWeight.bold,
          textOverflow: TextOverflow.ellipsis,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
      ],
    );
  }

  Widget _appointmentContainerWidget() {
    return Container(
      // height: AppSize.heightSize * 0.23,
      width: AppSize.widthSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AssetPaths.GREEN_BACKGROUND_IMAGE,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 25,
                    child: Image.asset(AssetPaths.USER_PROFILE_IMAGE)),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "Dr. Bessie Cooper",
                      textSize: 1.1.sp,
                      textColor: AppColors.WHITE_PURE_COLOR,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTextWidget(
                      text: "Psychiatrist",
                      textSize: 1.sp,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              // height: AppSize.heightSize * 0.07,
              width: AppSize.widthSize,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.WHITE_COLOR.withOpacity(0.3)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      AssetPaths.CALENDER_WHITE_ICON,
                      color: AppColors.WHITE_PURE_COLOR.withOpacity(1),
                      scale: 1,
                    ),
                    CustomTextWidget(
                      text: "Monday, Jan 29",
                      textColor: AppColors.WHITE_PURE_COLOR,
                    ),
                    Image.asset(
                      AssetPaths.CLOCK_ICON,
                      color: AppColors.WHITE_PURE_COLOR.withOpacity(1),
                      scale: 4,
                    ),
                    CustomTextWidget(
                      text: "01:00-02:00 PM",
                      textColor: AppColors.WHITE_PURE_COLOR,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget patientHistoryTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          text: "Patients History",
          textSize: 1.2.sp,
          fontWeight: FontWeight.bold,
          textColor: AppColors.FONT_THEME_COLOR,
        ),
        InkWell(
          onTap: () {
            AppNavigation.navigateTo(
                context, AppRouteName.DOCTOR_PATIENTS_HISTORY_SCREEN_ROUTE);
          },
          child: CustomTextWidget(
            text: "See All",
            textSize: 1.2.sp,
            textColor: AppColors.BACKGROUND_COLOR,
          ),
        ),
      ],
    );
  }

  Widget patientsHistoryListviewWidget() {
    return Container(
      width: AppSize.widthSize,
      height: AppSize.heightSize * 0.15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: patientProfileNameContainer(),
            );
          }),
    );
  }

  Widget patientProfileNameContainer() {
    return InkWell(
      onTap: () {
        AppNavigation.navigateTo(
            context, AppRouteName.PATIENT_CLINICAL_FEEDBACK_SCREEN_ROUTE);
      },
      child: Container(
        // height: AppSize.heightSize * 0.13,
        width: AppSize.widthSize * 0.7,
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
                                text: "Jenny Wilson",
                                textSize: 1.2.sp,
                                textColor: AppColors.FONT_THEME_COLOR,
                                fontWeight: FontWeight.bold,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                              CustomTextWidget(
                                text: "Mild Anxiety",
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
