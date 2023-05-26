import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatify/common/style/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/values/colors.dart';
import 'controller.dart';


class ChatPage extends GetView<ChatController> {
  ChatPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>(); // Global key to access the scaffold

  showMessage(String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
  @override
  Widget build(BuildContext context) {
    showMessage("HI THere is ...");
    return Scaffold(
      appBar: _buildAppBar(),
      body: Obx(() => SafeArea(
          child: Stack(
            children: [
              Positioned(
                  bottom: 0.h,
                  child: Container(
                    width: 360.w,
                    padding: EdgeInsets.only(left: 10.w, bottom: 10.h, right: 10.w),
                    // decoration: BoxDecoration(
                    //   color: Colors.indigo,
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            // width: 270.w,
                              decoration: BoxDecoration(
                                // color:Colors.cyanAccent,
                                borderRadius: BorderRadius.circular(30.w),
                              ),
                              child: TextField(
                                textAlign: TextAlign.left,
                                textAlignVertical: TextAlignVertical.center,
                                // textInputAction: TextInputAction.go,
                                autofocus:false,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  // isDense:true,
                                  contentPadding: const EdgeInsets.only(left: 10),
                                  hintText: 'Message...',
                                  hintStyle: const TextStyle(
                                    color: AppColors.primarySecondaryElementText,
                                    fontSize: 15.0,
                                  ),
                                  border: _buildMsgInputBorder(),
                                  focusedBorder: _buildMsgInputBorder(),
                                  enabledBorder: _buildMsgInputBorder(),
                                  disabledBorder: _buildMsgInputBorder(),
                                  suffixIcon: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child:IconButton(icon: const Icon(Icons.send), onPressed: (){})
                                  ),
                                ),
                              )
                          ),
                        ),
                        SizedBox(width: 10.w),
                        GestureDetector(
                          onTap: (){
                            controller.goMore();
                          },
                          child: Container(
                            width: 40.w,
                            height: 40.w,
                            decoration: BoxDecoration(
                                color: AppColors.primaryElement,
                                borderRadius: BorderRadius.circular(20.w),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(1, 2)
                                  )
                                ]
                            ),
                            child: Icon(Icons.add, size: 20.w, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
              ),
              controller.state.more_status.value ? Positioned(
                  bottom: 70.h,
                  right: 10.w,
                  width: 40.w,
                  height: 200.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIcons("assets/icons/file.png", () {}),
                      _buildIcons("assets/icons/photo.png", () {}),
                      _buildIcons("assets/icons/video.png", () {}),
                      _buildIcons("assets/icons/call.png", () {
                        controller.goToAudioCall();
                      }),
                    ],
                  )
              ) : Container()
            ],
          )
      )),
    );
  }


  GestureDetector _buildIcons(url, callBack) => GestureDetector(
    onTap: callBack,
    child: Container(
      // margin: EdgeInsets.only(bottom: 10.w),
      padding: EdgeInsets.all(6.w),
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(20.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 2,
            spreadRadius: 2,
            offset: const Offset(1, 1)
          )
        ]
      ),
      child: Image.asset(url),
    ),
  );


  OutlineInputBorder _buildMsgInputBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.w),
      borderSide: const BorderSide(
          color: AppColors.primarySecondaryElementText,
          width: 1
      )
  );

  AppBar _buildAppBar(){
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios)
      ),
      title: Obx(() => Text(
        controller.state.to_name.value,
        overflow: TextOverflow.clip,
        maxLines: 1,
        style: appBarTS.copyWith(fontWeight: FontWeight.bold),
      )),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 15.w),
          child: Stack(
            alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 40.w,
                  height: 40.h,
                  child: CachedNetworkImage(
                    imageUrl: controller.state.to_avatar.value,
                    imageBuilder: (context, imgProvider) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: imgProvider),
                          borderRadius: BorderRadius.all(Radius.circular(25.w))
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Image(image: AssetImage("assets/images/account_header.png",), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                    bottom: 5.w,
                    right: 0.w,
                    height: 14.w,
                    child: Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                          color: controller.state.to_online.value == "1" ? AppColors.primaryElementStatus :
                          AppColors.primarySecondaryElementText,
                          border: Border.all(width: 2, color: AppColors.primaryElementText),
                          borderRadius: BorderRadius.all(Radius.circular(25.w))
                      ),
                    )
                )
              ],
            )
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