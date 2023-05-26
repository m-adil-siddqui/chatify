import 'package:chatify/pages/frame/message/state.dart';
import 'package:get/get.dart';

import '../../../common/routes/names.dart';

class MessageController extends GetxController{
  MessageController();
  final state = MessageState();

  goToProfile() async{
    await Get.toNamed(AppRoutes.PROFILE);
  }


}