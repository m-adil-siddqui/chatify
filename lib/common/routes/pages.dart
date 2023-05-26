import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'routes.dart';

import 'package:chatify/pages/frame/message/index.dart';
import 'package:chatify/pages/frame/welcome/index.dart';
import 'package:chatify/common/middlewares/middlewares.dart';

import 'package:chatify/pages/frame/profile/index.dart';
import 'package:chatify/pages/frame/sign_in/index.dart';
import 'package:chatify/pages/frame/contact/index.dart';
import 'package:chatify/pages/frame/message/chat/index.dart';
import 'package:chatify/pages/frame/message/voicecall/index.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];


  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(),
      binding: WelcomeBinding()
    ),
    GetPage(
      name: AppRoutes.MESSAGE,
      page: () => const MessagePage(),
      binding: MessageBinding(),
      middlewares: [
        AuthMiddleware(priority: 1)
      ]
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(name: AppRoutes.PROFILE, page: () => ProfilePage(),
        binding: ProfileBinding()),

    GetPage(name: AppRoutes.CONTACT,
        page: () => ContactPage(),
        binding: ContactBinding()),

    GetPage(name: AppRoutes.CHAT,
        page: () =>  ChatPage(), binding: ChatBinding()),

    GetPage(name: AppRoutes.VOICE_CALL, page: () => VoiceCallPage(),
        binding: VoiceCallBinding()),



  ];

 /*
  static final List<GetPage> routes = [
    // 免登陆

    // 需要登录
    // GetPage(
    //   name: AppRoutes.Application,
    //   page: () => ApplicationPage(),
    //   binding: ApplicationBinding(),
    //   middlewares: [
    //     RouteAuthMiddleware(priority: 1),
    //   ],
    // ),

    // 最新路由
    GetPage(name: AppRoutes.EmailLogin, page: () => EmailLoginPage(), binding: EmailLoginBinding()),
    GetPage(name: AppRoutes.Register, page: () => RegisterPage(), binding: RegisterBinding()),
    GetPage(name: AppRoutes.Forgot, page: () => ForgotPage(), binding: ForgotBinding()),
    GetPage(name: AppRoutes.Phone, page: () => PhonePage(), binding: PhoneBinding()),
    GetPage(name: AppRoutes.SendCode, page: () => SendCodePage(), binding: SendCodeBinding()),
    // 首页
    //消息
    GetPage(name: AppRoutes.Message, page: () => MessagePage(), binding: MessageBinding(),middlewares: [
       RouteAuthMiddleware(priority: 1),
     ],),
    //我的
    //聊天详情

    GetPage(name: AppRoutes.Photoimgview, page: () => PhotoImgViewPage(), binding: PhotoImgViewBinding()),
    GetPage(name: AppRoutes.VideoCall, page: () => VideoCallPage(), binding: VideoCallBinding()),
  ];*/






}
