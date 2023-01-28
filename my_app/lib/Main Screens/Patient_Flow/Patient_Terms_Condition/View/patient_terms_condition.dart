import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/assets_path.dart';
import '../../../../Utils/navigation.dart';
import '../../../../Widgets/backgroundContainerImageWidget.dart';
import '../../../../Widgets/custom_text_widget.dart';

class PatientTermsCondition extends StatefulWidget {
  const PatientTermsCondition({Key? key}) : super(key: key);

  @override
  State<PatientTermsCondition> createState() => _PatientTermsConditionState();
}

class _PatientTermsConditionState extends State<PatientTermsCondition> {
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
            SizedBox(
              height: 10.h,
            ),
            medicalPrescriptionDetailWidget(),
            SizedBox(
              height: 10.h,
            ),
            medicalPrescriptionDetailWidget(),
            SizedBox(
              height: 10.h,
            ),
            medicalPrescriptionDetailWidget(),
            SizedBox(
              height: 10.h,
            ),
            medicalPrescriptionDetailWidget(),
            SizedBox(
              height: 10.h,
            ),
            medicalPrescriptionDetailWidget(),
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
          const SizedBox(),
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

  Widget medicalPrescriptionDetailWidget() {
    return CustomTextWidget(
      text:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      textSize: 1.sp,
      textOverflow: TextOverflow.fade,
      textColor: AppColors.FONT_THEME_COLOR,
    );
  }
}
