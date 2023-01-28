import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';


import '../../../Utils/app_colors.dart';
import '../../../Utils/app_route_name.dart';
import '../../../Utils/app_size.dart';
import '../../../Utils/assets_path.dart';
import '../../../Utils/navigation.dart';
import '../../../Widgets/custom_text_widget.dart';

class MenuScreen extends StatefulWidget {
  final ZoomDrawerController? zoomDrawer;

  const MenuScreen({this.zoomDrawer});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Curve _curve = Curves.fastOutSlowIn;

  bool? showSettingsmenu = false;
  double? height = 0, width = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // drawerEnableOpenDragGesture: false,
        backgroundColor: AppColors.BUTTON_COLOR,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.TRANSPARENT_COLOR,
          automaticallyImplyLeading: false,
          title: _appbarWidget(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                EditProfile(),
                SizedBox(
                  height: 10.h,
                ),
                DrawerOptions()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appbarWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
        ],
      ),
    );
  }

  Widget DrawerOptions() {
    return Column(
      children: [
        ListTile(
            leading: Image.asset(
              AssetPaths.EDIT_PROFILE_ICON,
              color: AppColors.WHITE_PURE_COLOR,
              scale: 3,
            ),
            onTap: () {
              // AppNavigation.navigateTo(context, AppRouteName.dpct)
              // AppNavigation.navigateToRemovingAll(context, HomeScreen(currentIndex: 0,));
              // print("drawer");
              // widget.zoomDrawer!.toggle;
            },
            title: CustomTextWidget(
              text: "Edit Profile",
              textColor: AppColors.WHITE_PURE_COLOR,
              textSize: 1.1.sp,
            )),
        ListTile(
            leading: Image.asset(
              AssetPaths.NOTIFICATION_ICON,
              color: AppColors.WHITE_PURE_COLOR,
              scale: 3,
            ),
            onTap: () {
              // AppNavigation.navigateToRemovingAll(context, HomeScreen(currentIndex: 0,));
              // print("drawer");
              // widget.zoomDrawer!.toggle;
            },
            title: CustomTextWidget(
              text: "Notification",
              textColor: AppColors.WHITE_PURE_COLOR,
              textSize: 1.1.sp,
            )),
        ListTile(
            leading: Image.asset(
              AssetPaths.CHANGE_PASWORD_ICON,
              color: AppColors.WHITE_PURE_COLOR,
              scale: 3,
            ),
            onTap: () {
              // AppNavigation.navigateToRemovingAll(context, HomeScreen(currentIndex: 0,));
              // print("drawer");
              // widget.zoomDrawer!.toggle;
            },
            title: CustomTextWidget(
              text: "Change Password",
              textColor: AppColors.WHITE_PURE_COLOR,
              textSize: 1.1.sp,
            )),
        ListTile(
            leading: Image.asset(
              AssetPaths.TERMS_CONDITION_ICON,
              color: AppColors.WHITE_PURE_COLOR,
              scale: 3,
            ),
            onTap: () {
              AppNavigation.navigateTo(
                  context, AppRouteName.PATIENT_TERMS_CONDITION_SCREEN_ROUTE);
              // AppNavigation.navigateToRemovingAll(context, HomeScreen(currentIndex: 0,));
              // print("drawer");
              // widget.zoomDrawer!.toggle;
            },
            title: CustomTextWidget(
              text: "Terms & Condition",
              textColor: AppColors.WHITE_PURE_COLOR,
              textSize: 1.1.sp,
            )),
        ListTile(
            leading: Image.asset(
              AssetPaths.PRIVACY_POLICY_ICON,
              color: AppColors.WHITE_PURE_COLOR,
              scale: 3,
            ),
            onTap: () {
              AppNavigation.navigateTo(
                  context, AppRouteName.PATIENT_TERMS_CONDITION_SCREEN_ROUTE);
              // AppNavigation.navigateToRemovingAll(context, HomeScreen(currentIndex: 0,));
              // print("drawer");
              // widget.zoomDrawer!.toggle;
            },
            title: CustomTextWidget(
              text: "privacy Policy",
              textColor: AppColors.WHITE_PURE_COLOR,
              textSize: 1.1.sp,
            )),
        SizedBox(height: 120.h),
        removeAccountButton()
        // Container(
        //   decoration: showSettingsmenu == true
        //       ? BoxDecoration(
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.grey.withOpacity(0.3),
        //               spreadRadius: 5,
        //               blurRadius: 7,
        //               offset: Offset(3, 3),
        //             )
        //           ],
        //           color: Colors.white,
        //           borderRadius: BorderRadius.only(
        //               bottomRight: Radius.circular(40),
        //               topRight: Radius.circular(40)),
        //         )
        //       : BoxDecoration(),
        //   child: ListTile(
        //     leading: SizedBox(
        //       height: 30,
        //       width: 20,
        //       child: Image.asset(
        //         AssetPaths.ATTACHMENT_FILE_IMAGE,
        //         color: showSettingsmenu == true
        //             ? AppColors.BLACK_COLOR
        //             : AppColors.BLACK_COLOR.withOpacity(0.8),
        //       ),
        //     ),
        //     onTap: () {
        //       if (showSettingsmenu == false) {
        //         setState(() {
        //           showSettingsmenu = true;
        //           height = 170.h;
        //           width = 280.w;
        //         });
        //       } else {
        //         setState(() {
        //           showSettingsmenu = false;
        //         });
        //       }
        //     },
        //     title: Text(
        //       'Settings',
        //       style: TextStyle(
        //         color: showSettingsmenu == true
        //             ? AppColors.BACKGROUND_COLOR
        //             : AppColors.BLACK_COLOR,
        //         fontSize: 20,
        //       ),
        //     ),
        //   ),
        // ),
        // showSettingsmenu == true
        //     ? AnimatedContainer(
        //         height: height,
        //         width: width,
        //         duration: Duration(milliseconds: 500),
        //         // curve: Curves.easeInBack,

        //         child: Column(
        //           children: [
        //             Padding(
        //               padding: EdgeInsets.symmetric(horizontal: 10.h),
        //               child: ListTile(
        //                 onTap: () {
        //                   AppNavigation.navigateTo(context, ChangePasssword());
        //                 },
        //                 title: Padding(
        //                   padding: EdgeInsets.only(left: 40.w),
        //                   child: Text(
        //                     'Change Password',
        //                     style: TextStyle(
        //                         color: AppColors.REDCOLOR,
        //                         fontSize: 18,
        //                         fontFamily: AppStrings.Jost),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             Padding(
        //               padding: EdgeInsets.only(left: 10.h),
        //               child: ListTile(
        //                 onTap: () {
        //                   AppNavigation.navigateTo(
        //                       context, TermsAndCondition());
        //                 },
        //                 title: Padding(
        //                   padding: EdgeInsets.only(left: 40.w),
        //                   child: Text(
        //                     'Terms & Conditions',
        //                     style: TextStyle(
        //                         color: AppColors.REDCOLOR,
        //                         fontSize: 18,
        //                         fontFamily: AppStrings.Jost),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             Padding(
        //               padding: EdgeInsets.symmetric(horizontal: 10.h),
        //               child: ListTile(
        //                 onTap: () {
        //                   AppNavigation.navigateTo(context, PrivacyAndPolicy());
        //                 },
        //                 title: Padding(
        //                   padding: EdgeInsets.only(left: 40.w),
        //                   child: Text(
        //                     "Privacy Policy",
        //                     style: TextStyle(
        //                         color: AppColors.REDCOLOR,
        //                         fontSize: 18,
        //                         fontFamily: AppStrings.Jost),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       )
        // : SizedBox(),
      ],
    );
  }

  Widget removeAccountButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: AppSize.widthSize,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.WHITE_PURE_COLOR),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.WHITE_PURE_COLOR.withOpacity(0.2)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AssetPaths.LOGOUT_ICON,
                      color: AppColors.WHITE_PURE_COLOR,
                      scale: 3,
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    CustomTextWidget(
                      text: "Logout",
                      textColor: AppColors.WHITE_PURE_COLOR,
                      textSize: 1.2.sp,
                    ),
                  ],
                ),
                Image.asset(
                  AssetPaths.ARROW_FORWARD_ICON,
                  color: AppColors.WHITE_PURE_COLOR,
                  scale: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget EditProfile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child:
                      //  _userProvider!.getCurrentUser!.data!.profileImage == ""
                      //     ?

                      CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    backgroundImage: AssetImage(AssetPaths.USER_PROFILE_IMAGE),
                  )
                  // : CircleAvatar(
                  //     backgroundColor: Colors.white,
                  //     radius: 42,
                  //     backgroundImage: NetworkImage(
                  //         "${_userProvider!.getCurrentUser!.data!.profileImage}"),
                  //   ),
                  ),
            ],
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomTextWidget(
                    text: "Dr. Bessie Cooper",
                    textSize: 1.2.sp,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              CustomTextWidget(
                text: "physcartists",
                textSize: 1.1.sp,
              ),

              SizedBox(
                height: 5.h,
              ),
              // GestureDetector(
              //   onTap: () {
              //     // AppNavigation.navigateTo(
              //     //     context,
              //     //     CompleteProfile(
              //     //       title: false,
              //     //     ));
              //   },
              //   child: Container(
              //       height: 25,
              //       width: 62,
              //       decoration: BoxDecoration(
              //           color: AppColors.RED_COLOR,
              //           borderRadius: BorderRadius.circular(10)),
              //       child: Row(
              //         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              //             child: Image.asset(
              //               AssetPaths.USER_PROFILE_IMAGE,
              //               scale: 6,
              //             ),
              //           ),
              //           const Padding(
              //             padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
              //             child: Text(
              //               'Edit',
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ),
              //         ],
              //       )),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
