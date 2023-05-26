import 'package:chatify/pages/frame/message/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/routes/names.dart';
import '../../../common/values/colors.dart';


class MessagePage extends GetView<MessageController> {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: _headBar(),
                  pinned: true, // not scrollable app bar
                )
              ],
            ),
            Positioned(
              bottom: 40.h,
              right: 30.h,
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.CONTACT);
                },
                child: Container(
                  width: 60.2,
                  height: 60.h,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.all(Radius.circular(40.w)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(1,1)
                      )
                    ]
                  ),
                  child: Image.asset("assets/icons/contact.png"),
                ),
              )
            )
          ],
        )
      ),
    );
  }

  Widget _headBar(){
    return Row(
          children: [
            Stack(
              children: [
                GestureDetector(
                  child: Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color:AppColors.primarySecondaryBackground,
                      borderRadius: BorderRadius.all(Radius.circular(22.h)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0,1)
                        )
                      ]
                    ),
                    child: controller.state.user.value.avatar == null ?
                    Image(image: AssetImage("assets/images/account_header.png")) :
                    Text("HI"),
                  ),
                  onTap: (){
                    controller.goToProfile();
                  },
                ),
                Positioned(
                  right: 3.w,
                  bottom: 4.w,
                  child: Container(
                    width: 15.w,
                    height: 15.h,
                    decoration:  BoxDecoration(
                      color: AppColors.primaryElementStatus,
                      borderRadius: BorderRadius.all(Radius.circular(12.w)),
                      border:Border.all(
                        width: 2.w,
                        color:AppColors.primaryElementText
                      )
                    ),
                  )
                )
              ],
            )
          ],
    );
  }
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