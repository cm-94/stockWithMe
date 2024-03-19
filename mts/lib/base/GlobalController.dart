import 'package:get/get.dart';
import 'package:mts/comm/CommApi.dart';
import 'package:mts/comm/header/AuthHeader.dart';

import '../comm/Api.dart';
import '../utils/Constants.dart';

class GlobalController extends GetxController {
  static const TAG = 'SplashPageController';

  var authKey = ''.obs;

  bool getAuthKey() {
    Map<String, dynamic> result = {};
    if(authKey.value.isEmpty){
      Map<String, String> input = {
        'grant_type' : 'client_credentials',
        'appkey' : Constants.appkey,
        'secretkey' : Constants.secretkey,

      };
      CommApi.instance.requestApi(url : Api.AuthToken, input : input, header: AuthHeader().toMap(), type: "POST");
    }

    return false;
  }

  List<Map<String, dynamic>> getJmData() {
    List<Map<String, dynamic>> result = [];

    return result;
  }

}