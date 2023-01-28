import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../../Utils/app_colors.dart';
import '../../TeacherDashboard/View/teacher_dashboard_screen.dart';
import '../menu_screen.dart';

// ignore: must_be_immutable
class TeacherDrawer extends StatefulWidget {
  int? currentIndex;
  TeacherDrawer({Key? key, this.currentIndex}) : super(key: key);

  @override
  State<TeacherDrawer> createState() => _TeacherDrawerState();
}

class _TeacherDrawerState extends State<TeacherDrawer> {
  final zoomDrawer = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.BUTTON_COLOR,
      child: ZoomDrawer(
        controller: zoomDrawer,
        mainScreenTapClose: true,
        style: DrawerStyle.defaultStyle,
        // openDragSensitivity: 525, closeDragSensitivity: 50,
        menuScreen: MenuScreen(
          zoomDrawer: zoomDrawer,
        ),
        mainScreen: const TeacherDashboard(),

        //  CustomBottomBar(
        //   currentIndex: widget.currentIndex ?? 0,
        // ),
        borderRadius: 40,
        overlayBlend: BlendMode.colorDodge,
        showShadow: true,
        angle: -5,
        //showShadow: true,
        // drawerShadowsBackgroundColor: Colors.blueAccent,
        slideWidth: MediaQuery.of(context).size.width * 0.8,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      ),
    );
  }
}
