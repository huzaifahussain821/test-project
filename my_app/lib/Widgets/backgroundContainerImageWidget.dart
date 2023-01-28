import 'package:flutter/material.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_size.dart';
import '../Utils/assets_path.dart';


class CustomBackgroundImageContainerWidget extends StatelessWidget {
  final Widget child;
  final String? imagePath;
  final BoxFit? boxFit;
  CustomBackgroundImageContainerWidget(
      {required this.child,
      this.boxFit,
      this.imagePath = AssetPaths.BACKGROUNG_IMAGE});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.TRANSPARENT_COLOR,
      body: SafeArea(
        child: Container(
          height: AppSize.heightSize,
          width: AppSize.widthSize,
          decoration: BoxDecoration(
            color: AppColors.WHITE_COLOR,
            // image: DecorationImage(
            //     image: AssetImage(imagePath!), fit: boxFit ?? BoxFit.fill)
          ),
          child: child,
        ),
      ),
    );
  }
}
