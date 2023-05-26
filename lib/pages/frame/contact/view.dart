import 'package:chatify/pages/frame/contact/widgets/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common/style/text.dart';
import '../../../common/values/colors.dart';
import 'controller.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios)
        ),
        centerTitle: true,
        title: Text("Contacts", style: appBarTS),
      ),
      body: Container(
        width: 360.w,
          height: 780.h,
          child: ContactList(),
        )
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