import 'package:mts/comm/mst/JmKospi.dart';
import 'package:mts/utils/CommonUtils.dart';

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


    // var sizeList = [
    //   2, 1, 4, 4, 4,
    //   1, 1, 1, 1, 1,
    //   1, 1, 1, 1, 1,
    //   1, 1, 1, 1, 1,
    //   1, 1, 1, 1, 1,
    //   1, 1, 1, 1, 1,
    //   1, 9, 5, 5, 1,
    //   1, 1, 2, 1, 1,
    //   1, 2, 2, 2, 3,
    //   1, 3, 12, 12, 8,
    //   15, 21, 2, 7, 1,
    //   1, 1, 1, 1, 9,
    //   9, 9, 5, 9, 8,
    //   9, 3, 1, 1, 1
    // ];
    // var totSize = 0;
    // for(var i = 0; i < sizeList.length; i++){
    //   totSize += sizeList[i];
    // }
    // var ddd = 'F70100001KR5701000014 한투글로벌신성장2호(A)                  BC 000000000000NN 0NNN NN    N  0        0000009990000100000NNN00NNN000000100N09000000000000000000000100020231103000000000019841000000000019841403000         0 NNN00000000000000000000000000000000000000.00        000000198   NNN';
    // LogCat.d(TAG,"TotSize :: $totSize / lineLength :: ${ddd.length}");

    var strKos = await CommApi.instance.fileDownload(url: Api.kospiMst);
    if(strKos == null){
      return false;
    }
    else{
      var arrJm = strKos.split('\n');

      var lineLength = 0;
      for (var i = 0; i < JmKospi.sizeList.length; i++){
        lineLength += JmKospi.sizeList[i];
      }
      for(var i = 0; i < arrJm.length -1; i++){
        /// 1. 종목명 가져오기
        var jmData = arrJm[i];

        var jmCode = jmData.substring(0,9);
        var jmStdCode = jmData.substring(9,21);
        var jmName = jmData.substring(21,jmData.length - lineLength);

        /// 2. 뒤 228 라인 넘기기
        int start = 21 + jmName.length;
        int end = jmData.length;
        Map<String,String>? kosData = CommonUtils.parseMstData(JmKospi.sizeList, JmKospi.keyList, jmData.substring(start,end));
        // if(kosData != null){
        //   mstKospi.add(kosData);
        // }
        if(kosData != null){
          LogCat.d(TAG, "[$i] 종목코드 : $jmCode / 종목코드 : $jmStdCode / 종목명 : $jmName // " + kosData.toString());
        }
      }
    }
    return false;
  }

}