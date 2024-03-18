import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import '../utils/LogCat.dart';

enum BuildType {
  development,
  productionTest,
  production,
}
/// flutter (개발/운영) 환경 클래스
/// [주의]Android 프로젝트를 빌드시(flutter 프로젝트는 영향없음) main.dart 파일로만 기동이 되기 때문에
/// environment.dart run()메소드에 수정 사항이 발생시 같이 수정 하도록 한다.
class Environment {
  /// Environment.newInstance로 생성되지 못했을 경우의 기본값
  /// ex) Android 프로젝트로 빌드시. Environment 인스턴스를 생성하지 못하기 때문에 강제로 지정
  static const defaultBuildType = BuildType.development;
  static Environment? _instance;
  static Environment get instance {
    if (_instance == null) {
      _instance = const Environment._internal(defaultBuildType);
      LogCat.d('Environment', '================[ENV]${buildType.toString()} CREATED===========');
    }
    return _instance!;
  }

  final BuildType _buildType;
  static BuildType get buildType => instance._buildType;

  const Environment._internal(this._buildType);

  factory Environment.newInstance({BuildType buildType = BuildType.development}) {
    //assert(buildType != null);
    if (_instance == null) {
      _instance = Environment._internal(buildType);
      LogCat.d('Environment', '================[ENV]${buildType.toString()} CREATED===========');
    }
    return _instance!;
  }

  bool get isDevelopment => _buildType == BuildType.development;
  bool get isProductionTest => _buildType == BuildType.productionTest;

  void run() {
    WidgetsFlutterBinding.ensureInitialized();

    var orientation = Platform.isAndroid
        ? [DeviceOrientation.portraitUp]
        : [DeviceOrientation.portraitUp, DeviceOrientation.landscapeRight];
    SystemChrome.setPreferredOrientations(orientation);

    runApp(const StockApp());
  }
}