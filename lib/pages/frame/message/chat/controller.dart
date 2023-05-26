import 'package:chatify/common/routes/names.dart';
import 'package:chatify/pages/frame/message/chat/state.dart';
import 'package:get/get.dart';


class ChatController extends GetxController{

  late String doc_id;
  ChatController();
  final state = ChatState();


  @override
  void onInit(){
    super.onInit();
    var data = Get.parameters;
    // print(data);
    doc_id = data['doc_id']!;
    state.to_token.value = data['to_token'] ?? "";
    state.to_name.value = data['to_name'] ?? "";
    state.to_avatar.value = data['to_avatar'] ?? "";
    state.to_online.value = data['to_online'] ?? "1";
  }

  goMore(){
    state.more_status.value = !state.more_status.value;
  }

  goToAudioCall(){
    goMore();
    Get.toNamed(AppRoutes.VOICE_CALL, parameters: {
      "to_token" : state.to_token.value,
      "to_name" : state.to_name.value,
      "to_avatar" : state.to_avatar.value,
      "call_role" : "anchor",
      "doc_id"    : doc_id
    });
  }
}