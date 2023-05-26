import 'package:chatify/pages/frame/profile/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/store/user.dart';


class ProfileController extends GetxController{
  ProfileController();
  final state = ProfileState();

  Future<void> logOut() async{
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }



}