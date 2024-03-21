import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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

  /// 파일 다운로드 경로 찾기
  static Future<String> getFilePath() async {
    Directory? directory;
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = await getExternalStorageDirectory();
      String newPath = directory?.path.substring(0, 20) ?? "";
      newPath += "Download";
      directory = Directory(newPath);
      if (!directory.existsSync()) {
        await directory.create();
      }
    }
    return directory.path;
  }
  /// 마스터 파일 라인 파싱
  static Map<String,String>? parseMstData(List<int> sizeList, List<String> keyList, String lineData) {
    Map<String,String> result = {};

    try{
      if(sizeList.length != keyList.length){
        return null;
      }

      var startIdx = 0;
      var endIdx = 0;
      for(var i = 0; i < sizeList.length; i++){
        endIdx += sizeList[i];
        var key = keyList[i];
        var value = lineData.substring(startIdx,endIdx);
        result[key] = value;
        startIdx = endIdx;
      }
    }
    catch(e){
      return null;
    }

    return result;
  }
}