import 'dart:convert';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:chatify/common/apis/apis.dart';
import 'package:chatify/common/entities/chat.dart';
import 'package:chatify/common/store/store.dart';
import 'package:chatify/pages/frame/message/voicecall/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../common/values/server.dart';


class VoiceCallController extends GetxController{
  VoiceCallController();
  final state = VoiceCallState();

  late final player;

  String appId = APPID;

  final db = FirebaseFirestore.instance;
  final profile_token  = UserStore.to.profile.token;
  late final RtcEngine engine;

  ChannelProfileType channelProfileType = ChannelProfileType.channelProfileCommunication;



  @override
  void onInit() {
    super.onInit();
    player = AudioPlayer();
    var data = Get.parameters;
    state.to_name.value = data['to_name'] ?? "";
    state.to_avatar.value = data['to_avatar'] ?? "";
    state.call_role.value = data['call_role'] ?? "";
    state.doc_id.value = data['doc_id'] ?? "";

    initEngine();
  }



  Future<void> initEngine() async{

    // await player.setAsset("assets/Sound_Horizon.mp3");
    engine = createAgoraRtcEngine();
    await engine.initialize(RtcEngineContext(
      appId: appId
    ));

    engine.registerEventHandler(RtcEngineEventHandler(
      onError: (ErrorCodeType err, String msg){
        print("[Error] err: $err msg: $msg ================================");
      },
      onJoinChannelSuccess: (RtcConnection connection, int elapsed){
        print("onConnection ${connection.toJson()} ---------------------------- CONNECTION IS ON  ");
        state.isJoined.value = true;
      },
      onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) async{
        await player.pause();
      },
      onLeaveChannel: (RtcConnection connection, RtcStats stats){
        print('My stats ${stats.toJson()} User Leave......................................');
        state.isJoined.value = false;
      },
      onRtcStats: (RtcConnection connection, RtcStats stats){
        print("time......");
        print(stats.duration);
      }
    ));


    await engine.enableAudio();
    await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await engine.setAudioProfile(
      profile: AudioProfileType.audioProfileDefault,
      scenario: AudioScenarioType.audioScenarioGameStreaming
    );

    await joinChannel();
    //
    if(state.call_role.value == "anchor"){
      await sendNotification("voice");
      await player.play();
    }
  }

  Future<void> sendNotification(String callType)async{
    CallRequestEntity callRequestEntity =  CallRequestEntity();
    callRequestEntity.call_type = callType;
    callRequestEntity.to_token = state.to_token.value;
    callRequestEntity.to_avatar = state.to_avatar.value;
    callRequestEntity.doc_id = state.doc_id.value;
    callRequestEntity.to_name = state.to_name.value;

    var res = await ChatAPI.call_notifications(params: callRequestEntity);

    if(res.code == 0){
      print("Notification has sent");
    }
    else
      print("Notification not sent");

  }



  Future<String?> getToken() async{

    if(state.call_role.value == "anchor"){
      state.channelId.value = md5.convert(utf8.encode("${profile_token}_${state.to_token.value}")).toString();
    }else{
      state.channelId.value = md5.convert(utf8.encode("${state.to_token.value}_${profile_token}")).toString();
    }

    CallTokenRequestEntity callTokenRequestEntity =  CallTokenRequestEntity();
    callTokenRequestEntity.channel_name = state.channelId.value;
    var res = await ChatAPI.call_token(params: callTokenRequestEntity);
    if(res.code == 0){
      return res.data;
    }
    return "";
  }




  Future<void> joinChannel() async{
    await Permission.microphone.request();

    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true
    );

    String? token = await getToken();

    if(token!.isEmpty){
      EasyLoading.dismiss();
      Get.back();
      return;
    }

    await engine.joinChannel(
        token: token,
        channelId: state.channelId.value,
        uid: 0,
        options: ChannelMediaOptions(
          channelProfile: channelProfileType,
          clientRoleType: ClientRoleType.clientRoleBroadcaster
        )
    );
    EasyLoading.dismiss();
  }

  Future<void> leaveChannel() async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true
    );
    await player.stop();
    state.isJoined.value = false;
    // await engine.leaveChannel();
    EasyLoading.dismiss();
    Get.back();
  }

  Future<void> disposeRes() async{
    await player.pause();
    await engine.leaveChannel();
    await engine.release();
    await player.stop();
  }

  @override
  void dispose() {
    disposeRes();
    super.dispose();
  }

  @override
  void onClose() {
    disposeRes();
    super.onClose();
  }
}