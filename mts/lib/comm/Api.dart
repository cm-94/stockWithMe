import 'package:mts/env/environment.dart';

class Api {
  static const String kospiMst = 'https://new.real.download.dws.co.kr/common/master/kospi_code.mst.zip'; /// 코스닥 마스터
  static const String kosdaqMst = 'https://new.real.download.dws.co.kr/common/master/kosdaq_code.mst.zip'; /// 코스닥 마스터
  static const String overseasMst = 'https://new.real.download.dws.co.kr/common/master/%smst.cod.zip'; /// 해외(미국)

  static const List<String> overseasMstType = ['nas','nys','ams','shs','shi','szs','szi','tse','hks','hnx','hsx'];


  static const String AuthToken = '/oauth2/Approval'; /// 웹소켓 토큰
  static const String KrTradeMount = '/uapi/domestic-stock/v1/quotations/volume-rank'; /// 거래량순위[v1_국내주식-047]
  static const String KrJmDefalt = '/uapi/domestic-stock/v1/quotations/search-info'; /// 상품기본조회
  static const String KrJmDetail = '/uapi/domestic-stock/v1/quotations/search-stock-info'; ///  국내주식 종목의 종목상세

}