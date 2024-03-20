import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mts/base/BasePage.dart';
import 'package:mts/utils/MyColors.dart';

import 'SplashPageController.dart';

class SplashPage extends BasePage<SplashPageController> {
  SplashPage({super.key}) : super(isSafeArea: false);

  @override
  SplashPageController getController() {
    return Get.put(SplashPageController());
  }

  @override
  Widget setBuild() {
    return Container(
      width: double.infinity,
      color: MyColors.bgPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx((){
            return Text("Auth : ${globalCtrl.authKey.value}",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: MyColors.fWhite));
          }),
          InkWell(
            onTap: globalCtrl.getJmMst,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: MyColors.bgBtnRed,
              ),
              child: Text('getAuthKey',style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}