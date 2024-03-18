
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mts/page/splash/SplashPageController.dart';

import '../utils/CommonUtils.dart';
import '../utils/DialogUtils.dart';
import '../utils/LogCat.dart';

abstract class BasePageController<T> extends GetxController{
  static const String _TAG = "BasePageController";
  late String className;

  // 앱 종료
  static const snackBarDuration = Duration(seconds: 2);
  DateTime? backButtonPressTime;

  @override
  void onInit() {
    super.onInit();
    try {
      className = T.toString();
      LogCat.d(_TAG, '[$className]onInit');
    } catch (e) {
      LogCat.printStackTrace(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
    try {
      LogCat.d(_TAG, '[$className]onReady');
    } catch (e) {
      LogCat.printStackTrace(e);
    }
  }

  @override
  void onClose() {
    super.onClose();
    try {
      LogCat.d(_TAG, '[$className]onClose');
    } catch (e) {
      LogCat.printStackTrace(e);
    }
  }

  Future<bool> onBackPressed() async {
    // 뒤로 버튼 연속 터치시 종료
    if (!(await handleWillPop(Get.context!))) {
      return false;
    }
    backButtonPressTime = null;
    CommonUtils.appExit();
    return true;
  }

  Future<bool> handleWillPop(BuildContext context) async {
    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressTime == null || now.difference(backButtonPressTime!) > snackBarDuration;

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = now;
      DialogUtils.showToast('common_msg_0000'.tr);
      return false;
    }

    return true;
  }
}