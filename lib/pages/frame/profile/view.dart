import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';
import 'controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: [
                    _buildAvatar(),
                    SizedBox(height: 60.h),
                    _buildBtn("Complete", (){}, AppColors.primaryElement),
                    _buildBtn("Logout", (){
                      Get.defaultDialog(
                        titlePadding: EdgeInsets.only(top: 20.h),
                        title: "Are you sure to logout?",
                        content: Container(),
                        radius: 10,
                        contentPadding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, bottom: 10.w),
                        actions: [
                          Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: (){
                                        Get.back();
                                      },
                                      child: const Text("Cancel")),
                                  TextButton(
                                      onPressed: (){
                                        // Get.back();
                                        controller.logOut();
                                      },
                                      child: const Text("Confirm"))
                                ],
                              )
                        ],
                        buttonColor: Colors.transparent,
                        confirmTextColor: Colors.white
                      );
                    }, AppColors.primarySecondaryElementText),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }


  _buildBtn(String text, VoidCallback onTap, Color color){
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 295.w,
          height: 44.h,
          margin: EdgeInsets.only(bottom: 30.h),
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1)
                )
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal
                )
              )
            ],
          )
      )
    );

  }


  _buildAvatar(){
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            color: AppColors.primarySecondaryBackground,
            borderRadius: BorderRadius.all(Radius.circular(60.w)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0,1)
              )
            ]
          ),
          child: Image(
            width: 120.w,
            height: 120.h,
            image: const AssetImage("assets/images/account_header.png"),),
        ),
        Positioned(
          right: 0,
          bottom: 20.w,
          width: 30.w,
          child: GestureDetector(
              onTap: (){},
              child: Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.all(Radius.circular(20.w))
                ),
                child: const Image(image: AssetImage("assets/icons/edit.png")),
              ),
            )
        )
      ],
    );

  }


  AppBar _appBar(){
    return AppBar(
      centerTitle: true,
      title: Text("Profile", style:
      TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal
      )),
    );
  }

}
