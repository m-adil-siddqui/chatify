import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/values/colors.dart';
import 'controller.dart';


class VoiceCallPage extends GetView<VoiceCallController> {
  const VoiceCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary_bg,
      body: SafeArea(
        child: Obx(() => Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(top: 50.h, bottom: 50.h),
                alignment: Alignment.center,
                // color: Colors.red,
                child: Text(
                  controller.state.callTime.value,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.w
                  ),
                )
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 50.h, bottom: 50.h),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(20.w),
                // color: Colors.cyanAccent
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.w),
                      child: Image.network(controller.state.to_avatar.value, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    controller.state.to_name.value,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.primaryElementText,
                    ),
                  )
                ],
              ),

            ),
            Expanded(
                flex:2,
                child: Container(
                  // color: Colors.cyan,
                  margin: EdgeInsets.only(top:80.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMicrophoneIcon(),
                      _buildPhoneIcon(),
                      _buildSpeakerIcon()
                    ],
                  ),
                )
            ),
          ],
        ))
      ),
    );
  }

  Column _buildMicrophoneIcon() => Column(
    children: [
      GestureDetector(
        onTap: (){},
        child: Container(
          width: 60.w,
          height: 60.w,
          margin: EdgeInsets.only(bottom: 8.w),
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
              color: controller.state.openMicrophone.value ?
              AppColors.primaryElementText : AppColors.primaryText,
              borderRadius: BorderRadius.all(Radius.circular(30.w))
          ),
          child: controller.state.openMicrophone.value ? Image.asset("assets/icons/b_microphone.png") :
          Image.asset("assets/icons/a_microphone.png"),
        ),
      ),
      Text("Microphone",
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontSize: 15.sp,
              fontWeight: FontWeight.normal
          ))
    ],
  );

  Column _buildPhoneIcon() => Column(
    children: [
      GestureDetector(
        onTap: (){
          if(controller.state.isJoined.value){
            controller.leaveChannel();
          }else{
            controller.joinChannel();
          }
        },
        child: Container(
          width: 60.w,
          height: 60.w,
          margin: EdgeInsets.only(bottom: 8.w),
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
              color: controller.state.isJoined.value ?
              AppColors.primaryElementBg : AppColors.primaryElementStatus,
              borderRadius: BorderRadius.all(Radius.circular(30.w))
          ),
          child: controller.state.isJoined.value ? Image.asset("assets/icons/b_phone.png") :
          Image.asset("assets/icons/a_telephone.png"),
        ),
      ),
      Text(
          controller.state.isJoined.value ? "Disconnect" : "Connect",
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontSize: 15.sp,
              fontWeight: FontWeight.normal
          ))
    ],
  );

  Column _buildSpeakerIcon() => Column(
    children: [
      GestureDetector(
        onTap: (){},
        child: Container(
          width: 60.w,
          height: 60.w,
          margin: EdgeInsets.only(bottom: 8.w),
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
              color: controller.state.enableSpeaker.value ?
              AppColors.primaryElementText : AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(30.w))
          ),
          child: controller.state.enableSpeaker.value ? Image.asset("assets/icons/bo_trumpet.png") :
          Image.asset("assets/icons/a_trumpet.png"),
        ),
      ),
      Text(
          "Speaker",
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontSize: 15.sp,
              fontWeight: FontWeight.normal
          ))
    ],
  );

}


















// Widget _headBar(){
//   return Center(
//     child: Container(
//       color:Colors.red,
//       width: 320.w,
//       height: 44.h,
//       child: Row(
//         children: [
//           Stack(
//             children: [
//               GestureDetector(
//                 child: Container(
//                   width: 44.w,
//                   height: 44.h,
//                   decoration: BoxDecoration(
//                       color:AppColors.primarySecondaryBackground,
//                       borderRadius: BorderRadius.all(Radius.circular(22.h)),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: Offset(0,1)
//                         )
//                       ]
//                   ),
//                   child: controller.state.user.value.avatar == null ?
//                   Image(image: AssetImage("assets/images/account_header.png")) :
//                   Text("HI"),
//                 ),
//                 onTap: (){
//                   controller.goToProfile();
//                 },
//               ),
//               Positioned(
//                   right: 3.w,
//                   bottom: 4.w,
//                   child: Container(
//                     width: 15.w,
//                     height: 15.h,
//                     decoration:  BoxDecoration(
//                         color: AppColors.primaryElementStatus,
//                         borderRadius: BorderRadius.all(Radius.circular(12.w)),
//                         border:Border.all(
//                             width: 2.w,
//                             color:AppColors.primaryElementText
//                         )
//                     ),
//                   )
//               )
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }