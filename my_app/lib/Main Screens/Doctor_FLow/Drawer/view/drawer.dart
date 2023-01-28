import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../Patient_Flow/Patient_Edit_Profile/View/patient_edit_profile.dart';
import '../controller/menuItem.dart';
import 'menuPage.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  MenuItemDrawer currentItem = Menuitems.home;
  @override
  Widget build(BuildContext context) {
    // MenuItem currentItem = Menuitems.home;
    return ZoomDrawer(
        borderRadius: 40,
        angle: -5,
        showShadow: true,
        slideWidth: MediaQuery.of(context).size.width * 0.6,
        menuScreen: Builder(
          builder: (context) => MenuPage(
              currentItem: currentItem,
              onselectedItem: (item) {
                setState(() {
                  currentItem = item;
                  // ZoomDrawer.of(context)!.close();
                });
                // ZoomDrawer.of(context)!.close();
              }),
        ),
        mainScreen: getScreen());
  }

  Widget getScreen() {
    switch (currentItem) {
      case Menuitems.home:
        return PatientEditProfile();
      case Menuitems.profile:
        return PatientEditProfile();
      case Menuitems.gallery:
        return PatientEditProfile();
      case Menuitems.MemberShip:
        return PatientEditProfile();
      case Menuitems.privacypolicy:
        return PatientEditProfile();
      case Menuitems.termsncondition:
        return PatientEditProfile();
      case Menuitems.logout:
        return PatientEditProfile();
    }
    return SizedBox();
  }
}
