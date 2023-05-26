import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatify/common/entities/contact.dart';
import 'package:chatify/pages/frame/contact/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/values/colors.dart';

class ContactList extends GetView<ContactController> {
   ContactList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomScrollView(

      slivers: [
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 20.w),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              var item = controller.state.contactList[index];
              return _buildListItem(item);
            },
            childCount: controller.state.contactList.length
            ),
          ),
        ),
      ],
    ));
  }


  Widget _buildListItem(ContactItem item){
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: AppColors.primarySecondaryBackground
          )
        )
      ),
      child: InkWell(
        onTap: () async{
          controller.goToChat(item);

        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              child: CachedNetworkImage(
                imageUrl: item.avatar!,
                height: 44.h,
                width: 44.w,
                imageBuilder: (context, imgProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(22.w)),
                      image: DecorationImage(
                        image: imgProvider
                      )
                    ),
                ),
              ),
            ),
            Container(
              width: 275.w,
              padding: EdgeInsets.only(top: 10.w, left:10.w, bottom: 0, right: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 42.h,
                    child: Text(
                      "${item.name}",
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.thirdElement,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:5.w),
                    width:12.w,
                    height: 12.h,
                    child: Image.asset('assets/icons/ang.png'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
