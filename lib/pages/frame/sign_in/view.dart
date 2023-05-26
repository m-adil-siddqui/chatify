import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/values/colors.dart';
import 'controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _socialLoginCard("Sign in with Apple", "assets/icons/apple.png", ""),
            _socialLoginCard("Sign in with Facebook", "assets/icons/facebook.png", ""),
            _socialLoginCard("Sign in with Google", "assets/icons/google.png", "google"),
            _buildDivider(),
            _socialLoginCard("Sign in with phone number", "", ""),
            SizedBox(height: 40.h),
            Text("Already have an account?",
                textAlign: TextAlign.center,
                style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.normal,
                fontSize: 12.sp
            )),
            GestureDetector(
              child: Text("Sign up here", textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.primaryElement,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp
                  )
              ),
            )
          ],
        )
      ),
    );
  }


  Container _buildDivider(){
    return Container(
      margin: EdgeInsets.only(top:20.h, bottom: 30.h),
      child: Row(
        children: [
          Expanded(child: Divider(
              indent: 50,
              height: 2.h,
              color:AppColors.primarySecondaryElementText
          )),
          SizedBox(width: 5.w),
          const Text("or"),
          SizedBox(width: 5.w),
          Expanded(child: Divider(
              endIndent: 50,
              height: 2.h,
              color:AppColors.primarySecondaryElementText
          )),
        ],
      ),
    );
  }

  GestureDetector _socialLoginCard(String loginType, String iconUrl, String loginWith){
    return GestureDetector(
      onTap: (){
        controller.handleSignIn(loginWith);
      },
      child: Container(
        padding: EdgeInsets.all(10.h),
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1)
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: iconUrl == '' ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            iconUrl ==  '' ? Container() : Container(
              padding: EdgeInsets.only(left: 40.w, right: 30.w),
              child: Image.asset(iconUrl),
            ),
            Text(
                loginType, style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp
            ))
          ],
        ),
      ),
    );
  }

  Container _buildLogo(){
    return Container(
      margin: EdgeInsets.only(top:100.h, bottom: 80.h),
      child: Text("Chatify",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
          fontSize: 34.sp
        )
      ),
    );
  }
}
