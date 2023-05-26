import 'dart:convert';

import 'package:chatify/common/apis/apis.dart';
import 'package:chatify/common/routes/names.dart';
import 'package:chatify/common/store/store.dart';
import 'package:chatify/pages/frame/contact/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../common/entities/contact.dart';
import '../../../common/entities/msg.dart';


class ContactController extends GetxController{
  ContactController();

  final state = ContactState();
  final token = UserStore.to.profile.token;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void onReady(){
    super.onReady();
    asyncLoadAllData();
  }


  Future<void> goToChat(ContactItem item) async{

    var profile = UserStore.to.profile;

    //withConverter will help to convert json into object
    var from_messages = await db.collection("messages").withConverter(
        fromFirestore: Msg.fromFirestore,
        toFirestore: (Msg msg, options) => msg.toFirestore()
    ).where("from_token", isEqualTo: profile.token)
        .where("to_token", isEqualTo: item.token).get();

    // print("From ========= ${from_messages.docs.isEmpty}");

    var to_messages = await db.collection("messages")
        .withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (Msg msg, options) => msg.toFirestore()
    )
        .where("from_token", isEqualTo: item.token)
        .where("to_token", isEqualTo: profile.token)
        .get();

    // print("To ========= ${to_messages.docs.isEmpty}");

    if(from_messages.docs.isEmpty && to_messages.docs.isEmpty){

      var msgData = Msg(
        from_token  : profile.token,
        to_token    : item.token,
        from_name   : profile.name,
        to_name     : item.name,
        from_avatar : item.avatar,
        to_avatar   : item.avatar,
        from_online : profile.online,
        to_online   : item.online,
        last_msg: "",
        last_time: Timestamp.now(),
        msg_num: 0
      );
      //


      var doc_id = await db.collection("messages").withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (Msg msg, options) => msg.toFirestore()
      ).add(msgData);

      goChat(item, doc_id.id);
    }else{
      var from = from_messages.docs;
      if(from.isNotEmpty){
        goChat(item, from.first.id);
      }

      var to = to_messages.docs;
      if(to.isNotEmpty){
        goChat(item, to.first.id);
      }
    }
  }

  goChat(item, id){
    Get.toNamed(AppRoutes.CHAT, parameters: {
      "doc_id" :   id,
      "to_token" : item.token ?? "",
      "to_name"  : item.name ?? "",
      "to_avatar" : item.avatar ?? "",
      "to_online" : item.online.toString()
    });
  }

  asyncLoadAllData() async {
    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true
    );

    state.contactList.clear();
    var res = await ContactAPI.post_contact();
    if(res.code == 0){
      state.contactList.addAll(res.data!);
    }
    EasyLoading.dismiss();
  }

}