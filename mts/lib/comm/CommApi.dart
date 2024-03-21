import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:charset_converter/charset_converter.dart';
import 'package:mts/comm/mst/JmKospi.dart';
import 'package:mts/utils/CommonUtils.dart';
import 'package:mts/utils/LogCat.dart';

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

  Future<Map<String, dynamic>> requestApi({required String url, Map<String, dynamic>? input, Map<String, String>? header, String type = "GET"/*, Function(Map<String, dynamic> response, bool isSuccess)? response*/}) async {
    Map<String, dynamic> result = <String, dynamic>{};

    var rqUrl = "$domain:$port$url";    /// 요청 URL
    var inputBody = json.encode(input); /// input Data
    var uri = Uri.parse(rqUrl);
    var client = http.Client();
    http.Response resData;

    try {
      if( type == "GET" ){
        resData = await client.get(
          uri,
          headers: header
        );
      }
      else{
        resData = await client.post(
            uri,
            headers: header,
            body: inputBody
        );
      }

      if(resData.statusCode == 200) {
        // 성공적으로 데이터를 받음
        LogCat.e(TAG, 'Secure response data: ${resData.body}');
        result['header'] = resData.headers;
        result['body'] = json.decode(resData.body);
        result['isSuccess'] = true;
        // response?.call(result, true);
      } else {
        // 에러 처리
        LogCat.e(TAG, 'Secure request failed with status: ${resData.statusCode}.');
        result['header'] = resData.headers;
        result['statusCode'] = resData.statusCode;
        result['isSuccess'] = false;
        // response?.call(result, false);
      }
    } finally {
      client.close();
    }
    return result;
  }

  Future<String?> fileDownload({required String url}) async {
    http.Response resData = await http.get(Uri.parse(url));
    if(resData.statusCode == 200){

      var path = await CommonUtils.getFilePath();

      File zipFile = File('$path/temp');
      await zipFile.writeAsBytes(resData.bodyBytes);
      final bytes = zipFile.readAsBytesSync();
      zipFile.delete();
      Archive archive = ZipDecoder().decodeBytes(
        bytes,
        verify: true,
      );
      final unzipFile = archive[0];
      if (unzipFile.isFile) {
        final data = unzipFile.content as Uint8List;
        /// TODO : byte -> string ... Unhandled Exception: FormatException: Invalid value in input: 199
        String? decoded = (await CharsetConverter.decode(
            "EUC-KR", data));

        LogCat.d(TAG,decoded);
        return decoded;
      }

      return null;
    }
    else {
      return null;
    }
  }

  Map<String, String> getHeader(Map<String, String> inputHdr){
    Map<String, String> result = inputHdr;



    return result;
  }
}