// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import '../Utils/app_colors.dart';

// class AppDialogs {
// ////////////////////// Toast //////////////////////////
//   static void showToast({String? message}) {
//     Fluttertoast.showToast(
//       msg: message ?? "",
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//     );
//   }

//   static Widget progressDialog() {
//     return CircularProgressIndicator(
//       color: AppColors.BACKGROUND_COLOR,
//     );
//   }

//   static void progressAlertDialog({required BuildContext context}) {
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return WillPopScope(
//             onWillPop: () async {
//               return false;
//             },
//             child: Center(
//               child: CircularProgressIndicator(
//                 backgroundColor: AppColors.WHITE_COLOR,
//                 color: AppColors.FONT_THEME_COLOR,
//               ),
//             ),
//           );
//         });
//   }
// }
