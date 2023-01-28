import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../Utils/app_route_name.dart';

import '../../Utils/app_size.dart';
import '../../Utils/assets_path.dart';
import '../../utils/navigation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   print("splash screen");
  //   _splashTimer();
  //   super.initState();
  // }
  void initState() {
    super.initState();
    _splashTimer();
  }

  @override
  Widget build(BuildContext context) {
    _appSizeMethod();
    AppSize.appSizeMethod(context: context);
    return Scaffold(
      body: Center(
        child: Container(
          width: AppSize.widthSize,
          height: AppSize.heightSize,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AssetPaths.SPLASH_FOREGROUND_IMAGE,
                ),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  void _appSizeMethod() {
    AppSize.appSizeMethod(context: context);
  }

  Future<Timer> _splashTimer() async {
    return Timer(const Duration(seconds: 2), _onComplete);
  }

  void _onComplete() async {
    _checkCurrentUserMethod();
  }

  void _checkCurrentUserMethod() async {
    AppNavigation.navigateReplacementNamed(
        context, AppRouteName.SELECT_USER_SCREEN_ROUTE);
  }
}
