import 'dart:io';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_strings.dart';
import '../Utils/assets_path.dart';
import '../Utils/network_strings.dart';


class CustomUserProfileImageWidget extends StatelessWidget {
  final String? imagePath, imageType;
  final VoidCallback? onTap;

  CustomUserProfileImageWidget({this.imagePath, this.imageType, this.onTap});

  @override
  Widget build(BuildContext context) {
    // _userProvider = Provider.of<UserProvider>(context, listen: false);
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: onTap,
                child: CircleAvatar(
                    radius: 55,
                    backgroundColor: AppColors.BUTTON_COLOR,
                    child: imageType == AppStrings.IMAGE_NETWORK_TYPE_TEXT
                        ? Container()
                        //  CircleAvatar(
                        //     radius: 52,
                        //     backgroundColor: AppColors.WHITE_PURE_COLOR,
                        //     child: CircleAvatar(
                        //       radius: 50,
                        //       child: Container(
                        //         clipBehavior: Clip.antiAlias,
                        //         decoration: BoxDecoration(
                        //             shape: BoxShape.circle,
                        //             color: AppColors.BACKGROUND_COLOR),
                        //         child: FancyShimmerImage(
                        //           shimmerBackColor: AppColors.BACKGROUND_COLOR,
                        //           shimmerHighlightColor: AppColors.WHITE_COLOR,
                        //           imageUrl:
                        //               NetworkStrings.NETWORK_IMAGE_BASE_URL +
                        //                   _userProvider!
                        //                       .getCurrentUser!.data!.userImage
                        //                       .toString(),
                        //         ),
                        //       ),
                        //     ),
                        //   )
                        : imageType == AppStrings.IMAGE_FILE_TYPE_TEXT
                            ? CircleAvatar(
                                radius: 52,
                                backgroundColor: AppColors.WHITE_PURE_COLOR,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: FileImage(File(imagePath!)),
                                ),
                              )
                            : CircleAvatar(
                                radius: 52,
                                backgroundColor: AppColors.WHITE_PURE_COLOR,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage(AssetPaths.USER_PROFILE_IMAGE),
                                ),
                              )

                    //  _userProvider!.getCurrentUser!.data!.userImage != null
                    //     ? CircleAvatar(
                    //         radius: 55,
                    //         backgroundImage: NetworkImage(
                    //             NetworkStrings.NETWORK_IMAGE_BASE_URL +
                    //                 _userProvider!.getCurrentUser!.data!.userImage
                    //                     .toString()),
                    //       )
                    //     : CircleAvatar(
                    //         radius: 55,
                    //         backgroundImage: AssetImage(imagePath.toString()),
                    //       ),
                    ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.edit, size: 20, color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.WHITE_COLOR,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            50,
                          ),
                        ),
                        color: AppColors.BUTTON_COLOR,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(2, 4),
                            color: Colors.black.withOpacity(
                              0.3,
                            ),
                            blurRadius: 3,
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      //  Container(
      //   width: 150.0,
      //   height: 132.0,
      //   child: Stack(
      //     children: [
      //       Container(
      //           width: 130.0,
      //           height: 120.0,
      //           child: imageType == AppStrings.IMAGE_NETWORK_TYPE_TEXT
      //               ? FadeInImage(
      //                   placeholder:
      //                       const AssetImage(AssetPaths.COMPLETEPROFILE_IMAGE),
      //                   image: NetworkImage(
      //                       NetworkStrings.NETWORK_IMAGE_BASE_URL + imagePath!),
      //                   fit: BoxFit.cover,
      //                 )
      //               : imageType == AppStrings.IMAGE_FILE_TYPE_TEXT
      //                   ? FadeInImage(
      //                       placeholder: const AssetImage(
      //                           AssetPaths.COMPLETEPROFILE_IMAGE),
      //                       image: FileImage(File(imagePath!)),
      //                       fit: BoxFit.cover,
      //                     )
      //                   : Image.asset(
      //                       AssetPaths.COMPLETEPROFILE_IMAGE,
      //                       fit: BoxFit.cover,
      //                     )),
      //       Align(
      //           alignment: Alignment.bottomCenter,
      //           child: GestureDetector(
      //               onTap: onTap,
      //               child: Icon(
      //                 Icons.edit,
      //                 size: 30,
      //                 color: AppColors.WHITE_COLOR,
      //               )))
      //     ],
      //   ),
      // ),
    );
  }
}
