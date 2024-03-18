import 'package:fluttertoast/fluttertoast.dart';

class DialogUtils{
  /// 토스트 메시지 표시
  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        // backgroundColor: SMColors.bgToast,
        // textColor: SMColors.naturalWhite,
        fontSize: 16.0);
  }
}