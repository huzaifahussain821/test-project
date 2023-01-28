import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Auth/LoginScreen/LoginRoutingArguments/login_routing_arguments.dart';

import '../../../Utils/app_route_name.dart';
import '../../../Utils/assets_path.dart';
import '../../../Widgets/backgroundContainerImageWidget.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/navigation.dart';
import '../../../Widgets/custom_text_widget.dart';

class SelectUser extends StatefulWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  State<SelectUser> createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              _mentalSupportLogoWidget(),
              SizedBox(
                height: 20.h,
              ),
              _selectUserTypeswidget()
            ],
          ),
        )),
      ),
    );
  }

  Widget _appbarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextWidget(
          text: "Select User",
          textSize: 1.1.sp,
          textColor: AppColors.FONT_THEME_COLOR,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }

  Widget _mentalSupportLogoWidget() {
    return Center(
      child: Image.asset(
        AssetPaths.LOGO_IMAGE,
        scale: 4,
      ),
    );
  }

  Widget _selectUserTypeswidget() {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {
            AppNavigation.navigateTo(context, AppRouteName.LOGIN_SCREEN,
                arguments: LoginRoutingArguments(userType: 0));
          },
          child: Image.asset(
            AssetPaths.FAMILY_CONSERNED_IMAGE,
            scale: 3.5,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
            AppNavigation.navigateTo(context, AppRouteName.LOGIN_SCREEN,
                arguments: LoginRoutingArguments(userType: 1));
          },
          child: Image.asset(
            AssetPaths.YOUTH_IMAGE,
            scale: 3.5,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {
            AppNavigation.navigateTo(context, AppRouteName.LOGIN_SCREEN,
                arguments: LoginRoutingArguments(userType: 2));
          },
          child: Image.asset(
            AssetPaths.INSTITUTE_IMAGE,
            scale: 3.5,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {
            AppNavigation.navigateTo(context, AppRouteName.LOGIN_SCREEN,
                arguments: LoginRoutingArguments(userType: 3));
          },
          child: Image.asset(
            AssetPaths.PROFESSIONAL_DOCTOR_IMAGE,
            scale: 3.5,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
