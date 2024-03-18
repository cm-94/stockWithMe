import 'package:get/get.dart';

import '../page/splash/SplashPage.dart';
import '../page/splash/SplashPageController.dart';

/// 화면 전환 정보
class PageRouter {
  static final route = [
    GetPage(
        name: '/splashPage',
        page: () => SplashPage(ctrl: SplashPageController()), // 스플레쉬 기동화면
        transition: Transition.noTransition
    ),
  ];
}