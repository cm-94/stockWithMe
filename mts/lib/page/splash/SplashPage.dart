import 'package:flutter/material.dart';
import 'package:mts/base/BasePage.dart';

import 'SplashPageController.dart';

class SplashPage extends BasePage<SplashPageController> {
  SplashPage({super.key, required super.ctrl}) : super(isSafeArea: false);

  @override
  Widget setBuild() {
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: Text("Splash 페이지 입니다."),
    );
  }

}