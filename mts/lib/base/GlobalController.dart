import 'package:mts/comm/mst/JmKospi.dart';
import 'package:sprintf/sprintf.dart';

import 'package:get/get.dart';
import 'package:mts/comm/CommApi.dart';
import 'package:mts/comm/header/AuthHeader.dart';
import 'package:mts/utils/LogCat.dart';

import '../comm/Api.dart';
import '../comm/mst/JmKosdaq.dart';
import '../comm/mst/JmNas.dart';
import '../utils/Constants.dart';

class GlobalController extends GetxController {
  static const TAG = 'SplashPageController';

  var authKey = ''.obs;

  Future<bool> getAuthKey() async {
    Map<String, dynamic> result = {};
    if(authKey.value.isEmpty){
      Map<String, String> input = {
        'grant_type' : 'client_credentials',
        'appkey' : Constants.appkey,
        'secretkey' : Constants.secretkey,

      };
      var authData = await CommApi.instance.requestApi(url : Api.AuthToken, input : input, header: AuthHeader().toMap(), type: "POST"/*,response: (data, isSuccess){
        if(isSuccess){
          var resData = data['body'] as Map<String, dynamic>;
          authKey.value = resData['approval_key'];

          LogCat.d(TAG, "Auth key :: " + resData['approval_key']);
        }
      }*/);

      if(authData['isSuccess'] == true){
        var resData = authData['body'] as Map<String, dynamic>;
        authKey.value = resData['approval_key'];
        // LogCat.d(TAG, "Auth key :: ${resData['approval_key']}");
        return true;
      }
      else{
        // LogCat.d(TAG, "Auth Error  ::  $authData");
        return false;
      }
    }

    return true;
  }

  Future<bool> getJmMst() async {
    List<JmKospi> mstKospi = [];
    List<JmKosdaq> mstKosdaq = [];
    List<JmNas> mstNas = [];

    var strKos = await CommApi.instance.fileDownload(url: Api.kospiMst);
    if(strKos == null){
      return false;
    }
    else{
      LogCat.d(TAG, strKos);
    }






    return false;
  }

}