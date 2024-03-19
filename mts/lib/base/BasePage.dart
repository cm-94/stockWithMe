import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mts/page/splash/SplashPageController.dart';

import '../utils/DialogUtils.dart';
import '../utils/MyColors.dart';
import 'BasePageController.dart';
import 'GlobalController.dart';

abstract class BasePage<T> extends StatelessWidget{
  final bool isSafeArea; /// SafeArea 유무
  final T ctrl;          /// 컨트롤러
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalController globalCtrl = Get.find();

  BasePage({Key? key, this.isSafeArea = false, required this.ctrl}) : super(key: key);

  Widget setBuild();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: MyColors.bgTransparent,
        body: isSafeArea? SafeArea(child: setBuild()): setBuild(),
      ),
      onWillPop:  () async {
        // Back 버튼 처리
        if (_scaffoldKey.currentState!.isDrawerOpen) {
          // DialogManager.instance.dismiss();
          return false;
        }
        if (ctrl is SplashPageController) {
          return false;
        }

        if (ctrl is BasePageController) {
          return (ctrl as BasePageController).onBackPressed();
        }

        return true;
      });
  }
}