import 'package:chatify/pages/frame/welcome/state.dart';
import 'package:get/get.dart';

import '../../../common/routes/names.dart';

class WelcomeController extends GetxController{
  WelcomeController();
  final title = "Chatify";
  final state = WelcomeState();


  //it use for navigation
  @override
  void onReady(){
    super.onReady();
    Future.delayed(const Duration(seconds: 3),
            () => Get.offAllNamed(AppRoutes.MESSAGE));
  }
}