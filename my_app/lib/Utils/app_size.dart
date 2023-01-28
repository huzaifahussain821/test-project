import 'package:flutter/cupertino.dart';

class AppSize {
  static double widthSize = 0.0;
  static double heightSize = 0.0;

  static appSizeMethod({required BuildContext context}) {
    widthSize = MediaQuery.of(context).size.width; 
    heightSize = MediaQuery.of(context).size.height;
    print("widthSize: $widthSize");
    print("heightSize: $heightSize");
  }
}
