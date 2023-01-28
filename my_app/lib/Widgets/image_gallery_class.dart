import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_strings.dart';
import 'app_dialogs.dart';



class ImageGalleryClass {
  ImagePicker picker = ImagePicker();
  XFile? getFilePath;
  File? imageFile;

  //Select Image Start
  void imageGalleryBottomSheet(
      {BuildContext? context,
      VoidCallback? onCameraTap,
      VoidCallback? onGalleryTap}) {
    showModalBottomSheet(
        context: context!,
        builder: (_) {
          return Container(
            color: AppColors.BACKGROUND_COLOR.withOpacity(1),
            child: SafeArea(
              child: Wrap(
                children: <Widget>[
                  GestureDetector(
                    onTap: onCameraTap,
                    child: Container(
                      color: AppColors.TRANSPARENT_COLOR,
                      margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 15.0,
                          ),
                          Icon(
                            Icons.camera_enhance,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            AppStrings.CAMERA_TEXT,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textScaleFactor: 1.3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  GestureDetector(
                    onTap: onGalleryTap,
                    child: Container(
                      color: AppColors.TRANSPARENT_COLOR,
                      margin: EdgeInsets.only(top: 9.0, bottom: 15.0),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 15.0,
                          ),
                          Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            AppStrings.GALLERY_TEXT,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textScaleFactor: 1.3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<String?> getCameraImage() async {
    try {
      getFilePath =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 70);
      if (getFilePath != null) {
        return getFilePath!.path;
      }
    } on PlatformException catch (e) {
      AppDialogs.showToast(
          message: e.message ?? AppStrings.SOMETHING_WENT_WRONG_ERROR);
    }

    return null;
  }

  Future<String?> getGalleryImage() async {
    try {
      getFilePath =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (getFilePath != null) {
        return getFilePath!.path;
      }
    } on PlatformException catch (e) {
      AppDialogs.showToast(
          message: e.message ?? AppStrings.SOMETHING_WENT_WRONG_ERROR);
    }
    return null;
  }

  Future<File?> cropImage({String? imageFilePath}) async {
    imageFile = await ImageCropper().cropImage(
      sourcePath: imageFilePath!,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: AppStrings.APP_TITLE_TEXT,
          toolbarColor: AppColors.BACKGROUND_COLOR.withOpacity(0.9),
          toolbarWidgetColor: AppColors.WHITE_COLOR,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      // iosUiSettings: IOSUiSettings(
      //   minimumAspectRatio: 1.0,
      // )
    );

    return imageFile;
  }
}
