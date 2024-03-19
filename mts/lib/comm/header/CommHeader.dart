
class CommHeader {
  String contentType = "application/json";
  String authorization = "";  // 접근토큰 String 40 OAuth 토큰이 필요한 API 경우 발급한 Access token
                              //  일반고객(Access token 유효기간 1일, OAuth 2.0의 Client Credentials Grant 절차를 준용)
                              //  법인(Access token 유효기간 3개월, Refresh token 유효기간 1년, OAuth 2.0의 Authorization Code Grant 절차를 준용)
                              //
                              //  ※ 토큰 지정시 토큰 타입("Bearer") 지정 필요. 즉, 발급받은 접근토큰 앞에 앞에 "Bearer" 붙여서 호출
                              //  EX) "Bearer eyJ..........8GA"
  String appkey = "";         // 앱키 String 36 한국투자증권 홈페이지에서 발급받은 appkey (절대 노출되지 않도록 주의해주세요.)
  String appsecret = "";      // 앱시크릿키 String 180 한국투자증권 홈페이지에서 발급받은 appsecret (절대 노출되지 않도록 주의해주세요.)
  String personalseckey = ""; //  고객식별키 String  180 [법인 필수] 제휴사 회원 관리를 위한 고객식별키
  String tr_id = "";          // 거래ID String 13 [실전투자]
                              // TTTC0802U : 주식 현금 매수 주문
                              // TTTC0801U : 주식 현금 매도 주문
                              //  [모의투자]
                              //  VTTC0802U : 주식 현금 매수 주문
                              //  VTTC0801U : 주식 현금 매도 주문
  String tr_cont = "";        // 연속 거래 여부 String  1 공백 : 초기 조회
                              // N : 다음 데이터 조회 (output header의 tr_cont가 M일 경우)
  String custtype = "";       // 고객타입 String  1 B : 법인
                              // P : 개인
  String seq_no = "";         // 일련번호 String  2 [법인 필수] 01
  String mac_address = "";    // 맥주소 String  12 법인고객 혹은 개인고객의 Mac address 값
  String phone_number = "";   // 핸드폰번호 String  12 [법인 필수] 제휴사APP을 사용하는 경우 사용자(회원) 핸드폰번호
                              // ex) 01011112222 (하이픈 등 구분값 제거)
  String ip_addr = "";        // 접속 단말 공인 IP String  12 [법인 필수] 사용자(회원)의 IP Address
  String hashkey = "";        // 해쉬키 String  256 ※ 입력 불필요
  String gt_uid = "";         // Global UID String  32 [법인 필수] 거래고유번호로 사용하므로 거래별로 UNIQUE해야 함
}