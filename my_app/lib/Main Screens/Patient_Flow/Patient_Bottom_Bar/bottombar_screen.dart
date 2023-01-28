import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


import '../../../Utils/app_colors.dart';

import '../../../Utils/app_size.dart';
import '../../../Utils/assets_path.dart';
import '../Patient_Clinical_FeedBack/View/patient_clinical_feedback.dart';
import '../Patient_Dashboard_Screen/View/patient_dashboard_screen.dart';
import '../Patient_Setting/View/patient_setting.dart';
import '../Petient_My_Visits/View/patient_my_visit.dart';

class PatientBottomBarScreen extends StatefulWidget {
  // const PatientBottomBarScreen({Key? key}) : super(key: key);

  @override
  State<PatientBottomBarScreen> createState() => _PatientBottomBarScreenState();
}

class _PatientBottomBarScreenState extends State<PatientBottomBarScreen> {
  int _currentIndex = 0;

  PageController? _paegcontroller;
  final globalKey = GlobalKey<ScaffoldState>();
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    // getCategoryListViewMethod();
    _paegcontroller = PageController(initialPage: 0);
    //  _currentIndex = 2;
    // _paegcontroller!.jumpToPage(_currentIndex);
    super.initState();
  }

  // Future<void> getCategoryListViewMethod() async {
  //   await getCategoryListView?.getCategoryViewListBlocMethod(
  //       // currentMonthDate: "2022-07-01",
  //       context: context,
  //       setProgressBar: () {
  //         AppDialogs.progressAlertDialog(context: context);
  //       });
  // }

  // void inistateMethodCall() async {
  //   await getCategoryListViewMethod();

  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: globalKey,
        body: PageView(
          controller: _paegcontroller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const PatientDashboardScreen(),
            const PatientMyVisit(),
            PatientClinicalFeedback(
              showEditButton: false,
            ),
            const PatientSetting()
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          height: AppSize.heightSize * 0.07,
          color: AppColors.WHITE_PURE_COLOR,
          buttonBackgroundColor: AppColors.WHITE_PURE_COLOR,
          backgroundColor: AppColors.BUTTON_COLOR,
          items: <Widget>[
            Image.asset(
              AssetPaths.HOME_ICON,
              scale: 5,
              color: _currentIndex == 0
                  ? AppColors.BUTTON_COLOR
                  : AppColors.GREY_COLOR,
            ),
            Image.asset(
              AssetPaths.MY_VISITS_ICON,
              scale: 5,
              color: _currentIndex == 1
                  ? AppColors.BUTTON_COLOR
                  : AppColors.GREY_COLOR,
            ),
            Image.asset(
              AssetPaths.PRESCRIPTIONS_ICON,
              scale: 5,
              color: _currentIndex == 2
                  ? AppColors.BUTTON_COLOR
                  : AppColors.GREY_COLOR,
            ),
            Image.asset(
              AssetPaths.SETTINGS_ICON,
              scale: 5,
              color: _currentIndex == 3
                  ? AppColors.BUTTON_COLOR
                  : AppColors.GREY_COLOR,
            ),
            // Icon(Icons.add, size: 30),
            // Icon(Icons.list, size: 30),
            // Icon(Icons.compare_arrows, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });

            if (_page == 0) {
              setState(() {
                _currentIndex = _page;
                _paegcontroller!.jumpToPage(_currentIndex);
              });
            } else if (_page == 1) {
              setState(() {
                _currentIndex = _page;
                _paegcontroller!.jumpToPage(_currentIndex);
              });
            } else if (_page == 2) {
              setState(() {
                _currentIndex = _page;
                _paegcontroller!.jumpToPage(_currentIndex);
              });
            } else if (_page == 3) {
              setState(() {
                _currentIndex = _page;
                _paegcontroller!.jumpToPage(_currentIndex);
              });
            }
          },
        ),

        //  Container(
        //   height: AppSize.heightSize * 0.09,
        //   decoration: BoxDecoration(
        //       borderRadius: const BorderRadius.only(
        //           topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        //       color: Colors.black.withOpacity(0.01)),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       InkWell(
        //         onTap: () {
        //           setState(() {
        //             _currentIndex = 0;
        //             _paegcontroller!.jumpToPage(_currentIndex);
        //           });
        //         },
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             InkWell(
        //               onTap: () {
        //                 setState(() {
        //                   _currentIndex = 0;
        //                   _paegcontroller!.jumpToPage(_currentIndex);
        //                 });
        //               },
        //               child: Image.asset(
        //                 AssetPaths.HOME_ICON,
        //                 scale: 5,
        //                 color: _currentIndex == 0
        //                     ? AppColors.BUTTON_COLOR
        //                     : AppColors.GREY_COLOR,
        //               ),
        //               // Image(
        //               //   image: AssetImage(AssetPaths.HOME_ICON),
        //               //   height: 25,
        //               //   color: _currentIndex == 0
        //               //       ? AppColors.BUTTON_COLOR
        //               //       : AppColors.GREY_COLOR,
        //               // ),
        //             ),
        //             CustomTextWidget(
        //               text: "Home",
        //               textColor: _currentIndex == 0
        //                   ? AppColors.BUTTON_COLOR
        //                   : AppColors.GREY_COLOR,
        //               textSize: 1.1.sp,
        //             )
        //           ],
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () {
        //           setState(() {
        //             _currentIndex = 1;
        //             _paegcontroller!.jumpToPage(_currentIndex);
        //           });
        //         },
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             InkWell(
        //               onTap: () {
        //                 setState(() {
        //                   _currentIndex = 1;
        //                   _paegcontroller!.jumpToPage(_currentIndex);
        //                 });
        //               },
        //               child: Image(
        //                 image: AssetImage(AssetPaths.MY_VISITS_ICON),
        //                 height: 25,
        //                 color: _currentIndex == 1
        //                     ? AppColors.BUTTON_COLOR
        //                     : AppColors.GREY_COLOR,
        //               ),
        //             ),
        //             CustomTextWidget(
        //               text: "My Visits",
        //               textColor: _currentIndex == 1
        //                   ? AppColors.BUTTON_COLOR
        //                   : AppColors.GREY_COLOR,
        //               textSize: 1.1.sp,
        //             )
        //           ],
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () {
        //           setState(() {
        //             _currentIndex = 2;
        //             _paegcontroller!.jumpToPage(_currentIndex);

        //             // _imageGalleryOption();
        //           });
        //         },
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             InkWell(
        //               onTap: () {
        //                 setState(() {
        //                   _currentIndex = 2;
        //                   _paegcontroller!.jumpToPage(_currentIndex);

        //                   // _imageGalleryOption();
        //                 });
        //               },
        //               child: Image(
        //                 image: const AssetImage(AssetPaths.PRESCRIPTIONS_ICON),
        //                 height: 25,
        //                 color: _currentIndex == 2
        //                     ? AppColors.BUTTON_COLOR
        //                     : AppColors.GREY_COLOR,
        //               ),
        //             ),
        //             CustomTextWidget(
        //               text: "Prescriptions",
        //               textColor: _currentIndex == 2
        //                   ? AppColors.BUTTON_COLOR
        //                   : AppColors.GREY_COLOR,
        //               textSize: 1.1.sp,
        //             )
        //           ],
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () {
        //           setState(() {
        //             _currentIndex = 3;
        //             _paegcontroller!.jumpToPage(_currentIndex);
        //           });
        //         },
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             InkWell(
        //               onTap: () {
        //                 setState(() {
        //                   _currentIndex = 3;
        //                   _paegcontroller!.jumpToPage(_currentIndex);
        //                 });
        //               },
        //               child: Image(
        //                 image: const AssetImage(AssetPaths.SETTINGS_ICON),
        //                 height: 25,
        //                 color: _currentIndex == 3
        //                     ? AppColors.BUTTON_COLOR
        //                     : AppColors.GREY_COLOR,
        //               ),
        //             ),
        //             CustomTextWidget(
        //               text: "Settings",
        //               textColor: _currentIndex == 3
        //                   ? AppColors.BUTTON_COLOR
        //                   : AppColors.GREY_COLOR,
        //               textSize: 1.1.sp,
        //             )
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
