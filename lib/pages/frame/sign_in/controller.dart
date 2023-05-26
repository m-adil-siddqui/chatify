import 'dart:convert';

import 'package:chatify/common/apis/apis.dart';
import 'package:chatify/common/entities/entities.dart';
import 'package:chatify/common/routes/names.dart';
import 'package:chatify/common/store/store.dart';
import 'package:chatify/common/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:chatify/pages/frame/sign_in/state.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignInController extends GetxController{
  SignInController();
  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['openid']
  );

  void handleSignIn(String type) async{
    //1: email, 2: google, 3: facebook, 4: apple, 5: phone
    try{

      if(type == "phone_number"){

      }else if(type == "google"){
        var user = await _googleSignIn.signIn();
        if(user != null){
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? 'assets/icons/google.png';

          LoginRequestEntity _loginRequestEntity = LoginRequestEntity();
          _loginRequestEntity.name = displayName;
          _loginRequestEntity.email = email;
          _loginRequestEntity.open_id = id;
          _loginRequestEntity.avatar = photoUrl;
          _loginRequestEntity.type = 2;

          asyncPostAllData(_loginRequestEntity);

        }

      }else{

      }

    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }

  asyncPostAllData(LoginRequestEntity loginRequestEntity) async{

    print(jsonEncode(loginRequestEntity));
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true
    );
    var res = await UserAPI.Login(params: loginRequestEntity);
    if(res.code == 0){
      await UserStore.to.saveProfile(res.data!);
      EasyLoading.dismiss();
    }else{
      EasyLoading.dismiss();
      toastInfo(msg: "Server error");
    }
    Get.offAllNamed(AppRoutes.MESSAGE);
  }

}