
import 'package:mts/utils/DialogUtils.dart';
import 'package:mts/utils/LogCat.dart';

import '../../base/BasePageController.dart';

class SplashPageController extends BasePageController<SplashPageController> {
  static const TAG = 'SplashPageController';

  @override
  void onReady() async {
    LogCat.d(TAG,"init Call!!");
    super.onReady();
    var isAuthSuccess = await globalCtrl.getAuthKey();

    if(!isAuthSuccess){
      DialogUtils.showToast('인증 정보를 가져오는데 실패했습니다. 햅을 다시 실행해주세요'); /// TODO : 앱 종료 다이럴로그로 수정
    }

    var isMstSuccess = await globalCtrl.getJmMst();

    if(isMstSuccess){
      DialogUtils.showToast('종목 정보를 가져오는데 실패했습니다. 햅을 다시 실행해주세요'); /// TODO : 앱 종료 다이럴로그로 수정
    }

  }
  List<Map<String, dynamic>> getJmData() {
    List<Map<String, dynamic>> result = [];

    return result;
  }
}