import '../env/environment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CommApi {
  static const String TAG = 'CommApi';

  var domain = Environment.buildType == BuildType.production? 'https://openapi.koreainvestment.com' : 'https://openapivts.koreainvestment.com';
  var port = Environment.buildType == BuildType.production? '9443' : '29443';

  static final CommApi _instance = CommApi._();
  static CommApi get instance => _instance;

  CommApi._() {
    // _init();
  }

  void requestApi({required String url, Map<String, dynamic>? input, Map<String, String>? header, String type = "GET"}) async {
    var rqUrl = "$domain:$port$url";
    // var rqUrl = domain + port + url;

    /////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////

    // final response = await http.get(Uri.parse(rqUrl), headers: rqHeader);

    /////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////

    var body = json.encode(input);

    // if (input != null && input.isNotEmpty){
    //   rqUrl += "?";
    //   var keys = input.keys.toList();
    //   for ( var i = 0; i < keys.length; i++ ){
    //     String key = keys[i];
    //     String value = input[key];
    //
    //     rqUrl += "$key=$value%";
    //   }
    //   rqUrl = rqUrl.replaceAll(RegExp(r'.$'), ''); /// 마지막 문자(%) 제거
    // }

    var uri = Uri.parse(rqUrl);
    var client = http.Client();

    try {
      var response;
      if( type == "GET"){
        response = await client.get(
          uri,
          headers: header
        );
      }
      else{
        response = await client.post(
            uri,
            headers: header,
            body: body
        );
      }


      if (response.statusCode == 200) {
        // 성공적으로 데이터를 받음
        print('Secure response data: ${response.body}');
      } else {
        // 에러 처리
        print('Secure request failed with status: ${response.statusCode}.');
      }
    } finally {
      client.close();
    }
  }

  Map<String, String> getHeader(Map<String, String> inputHdr){
    Map<String, String> result = inputHdr;



    return result;
  }
}