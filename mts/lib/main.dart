import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mts/router/PageRouter.dart';

import 'lang/LocalizationService.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  var orientation = Platform.isAndroid
      ? [DeviceOrientation.portraitUp]
      : [DeviceOrientation.portraitUp, DeviceOrientation.landscapeRight];
  SystemChrome.setPreferredOrientations(orientation);
  // await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const StockApp());
}

class StockApp extends StatelessWidget {
  const StockApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "주식지갑",
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      getPages: PageRouter.route,
      initialRoute: '/splashPage',
    );
  }
}
