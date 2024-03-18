import 'package:flutter/foundation.dart';
class LogCat {
  static const bool isEnable = false; //kDebugMode
  static const bool isDebugEnable = false;
  static const bool isVerboseEnable =false;
  static const bool isCommApiEnable =false;
  static const bool isErrorEnable = false;

  static void d(String tag, String msg) {
    if (isEnable && isDebugEnable) {
      print("D|[$tag]$msg");
    }
  }

  static void v(String tag, String msg) {
    if (isEnable && isVerboseEnable) {
      print("V|[$tag]$msg");
    }
  }
  static void i(String tag, String msg) {
    if (isEnable && isCommApiEnable) {
      print("I|[$tag]$msg");
    }
  }

  static void e(String tag, String msg) {
    if (isEnable && isErrorEnable) {
      print("E|[$tag]$msg");
    }
  }

  static void printStackTrace(Object e) {
    if (isEnable && isErrorEnable) {
      print("E|[printStackTrace]${e.toString()}");
    }
  }
}
