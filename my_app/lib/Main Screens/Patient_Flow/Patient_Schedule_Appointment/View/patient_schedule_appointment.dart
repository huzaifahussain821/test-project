import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_route_name.dart';
import '../../../../Utils/app_size.dart';
import '../../../../Utils/assets_path.dart';
import '../../../../Utils/navigation.dart';
import '../../../../Widgets/backgroundContainerImageWidget.dart';
import '../../../../Widgets/custom_button_widget.dart';
import '../../../../Widgets/custom_text_widget.dart';

class PatientScheduleAppointmwnt extends StatefulWidget {
  const PatientScheduleAppointmwnt({Key? key}) : super(key: key);

  @override
  State<PatientScheduleAppointmwnt> createState() =>
      _PatientScheduleAppointmwntState();
}

class _PatientScheduleAppointmwntState
    extends State<PatientScheduleAppointmwnt> {
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
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    calendarStyle: CalendarStyle(
                        rangeHighlightColor: AppColors.GREEN_COLOR),
                  ),
                  const Divider(),
                  scheduleContainerWidget(),
                  DateTimeRowWidget(text1: "Date", text2: "Jan,01"),
                  DateTimeRowWidget(text1: "Time", text2: "02:00 pm"),
                  SizedBox(
                    height: 10.h,
                  ),
                  _scheduleAppointmentButton()
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
          const SizedBox()
        ],
      ),
    );
  }

  Widget scheduleContainerWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: "Select Time",
                textSize: 1.2.sp,
                fontWeight: FontWeight.bold,
                textColor: AppColors.FONT_THEME_COLOR,
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weekdaysContainer(dayName: "01:00 PM"),
              weekdaysContainer(dayName: "02:00 PM"),
              weekdaysContainer(dayName: "03:00 PM"),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weekdaysContainer(dayName: "04:00 PM"),
              weekdaysContainer(dayName: "05:00 PM"),
              weekdaysContainer(dayName: "06:00 PM"),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weekdaysContainer(dayName: "07:00 PM"),
              weekdaysContainer(dayName: "08:00 PM"),
              weekdaysContainer(dayName: "09:00 PM"),
            ],
          )
        ],
      ),
    );
  }

  Widget weekdaysContainer({String? dayName}) {
    return Container(
      height: AppSize.heightSize * 0.06,
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

  Widget DateTimeRowWidget({String? text1, String? text2}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: text1,
            textSize: 1.1.sp,
            textColor: AppColors.FONT_THEME_COLOR,
          ),
          CustomTextWidget(
            text: text2,
            textSize: 1.1.sp,
            textColor: AppColors.FONT_THEME_COLOR,
          ),
        ],
      ),
    );
  }

  Widget _scheduleAppointmentButton() {
    return CustomButtonWidget(
      containerWidth: AppSize.widthSize * 0.85,
      // containerheight: AppSize.heightSize * 0.07,
      buttonText: "Schedule Appointment",
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
            context, AppRouteName.PATIENT_DOCTOR_SELECT_LIST_SCREEN_ROUTE);
      },
    );
  }
}
