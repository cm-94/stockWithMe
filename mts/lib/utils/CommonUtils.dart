import 'dart:io';

import 'package:flutter/services.dart';

class CommonUtils {
  // 앱 종료. 딜레이 필요
  /// (https://stackoverflow.com/questions/45109557/flutter-how-to-programmatically-exit-the-app)
  static void appExit({bool isSplashScreen = false}) {
    // PluginManager.instance.v3Plugin.stopV3();

    if (Platform.isAndroid) {
      //exit(0);
      if (isSplashScreen) {
        SystemNavigator.pop();
        Future.delayed(const Duration(microseconds: 200), () {
          exit(0);
        });
      } else {
        // // 2021/10/07
        // // Android 12 대응 앱 종료 로직 수정
        // // Android 12에서 flutter 앱 종료(SystemNavigator.pop();)시 앱이 정상 종료 되지 않는 문제.
        // // Android 네이티브 기능을 이용해서 앱을 종료하도록 변경
        // // SystemNavigator.pop();
        // PluginManager.instance.platformPlugin.appExitForAndroid();
      }
    } else if (Platform.isIOS) {
      Future.delayed(const Duration(microseconds: 100), () {
        exit(0);
      });
    }
  }
}