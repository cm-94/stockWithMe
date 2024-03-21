class JmKospi{
  JmKospi();

  /// F70100001KR5701000014 한투글로벌신성장2호(A)                  BC 000000000000NN 0NNN NN    N  0        0000009990000100000NNN00NNN000000100N09000000000000000000000100020231103000000000019841000000000019841403000         0 NNN00000000000000000000000000000000000000.00        000000198   NNN

  String jmCode = ""; // 단축코드 9
  String jmStdCode = ""; // 표준코드 12
  String jmName = ""; // 한글명 비정규..

  String grCd = ""; // 그룹코드 2
  String totPriceAmt = ""; // 시가총액규모 1
  String idxSectorMain = ""; // 지수업종대분류 4
  String idxSectorMid = ""; // 지수업종중분류 4
  String idxSectorSub = ""; // 지수업종소분류 4
  String cateTypeManufacture = ""; // 제조업 1
  String lowLiquidty = ""; // 저유동성 1
  String govidxItem = ""; // 지배구조지수종목 1
  String kos200Sector = ""; // KOSPI200섹터업종 1
  String kospi100 = ""; // KOSPI100 1
  String kospi150 = ""; // KOSPI50 1
  String krx = ""; // KRX 1
  String etp = ""; // ETP 1
  String isEls = ""; // ELW발행 1
  String krx1001 = ""; // KRX1001
  String krxCar = ""; // KRX자동차 1
  String krxSemicon = ""; // KRX반도체 1
  String krxBio = ""; // KRX바이오 1
  String krxBank = ""; // KRX은행 1
  String spac = ""; // SPAC 1
  String krxEnergy = ""; // KRX에너지화학 1
  String krxSteel = ""; // KRX철강 1
  String shortTermOverHeat = ""; // 단기과열 1
  String krxMedia = ""; // KRX미디어통신 1
  String krxBuild = ""; // KRX건설 1
  String non1 = ""; // Non1 1
  String krxStock = ""; // KRX증권 1
  String krxShip = ""; // KRX선박 1
  String krxEnsure = ""; // KRX섹터_보험 1
  String krxTransit = ""; // KRX섹터_운송 1
  String sri = ""; // SRI 1
  String prcStandart = ""; // 기준가 9
  String orderUnit = ""; // 매매수량단위 5
  String overOrderUnit = ""; // 시간외수량단위 5
  String transSuspend = ""; // 거래정지 1
  String liquSale = ""; // 정리매매 1
  String mngStock = ""; // 관리종목 1
  String warnStock = ""; // 시장경고 2
  String preWarnStock = ""; // 경고예고 1
  String insincDisclosure = ""; // 불성실공시 1
  String bdList = ""; // 우회상장 1
  String lockType = ""; // 락구분 2
  String stockChange = ""; // 액면변경 2
  String capiIncType = ""; // 증자구분 2
  String marginRate = ""; // 증거금비율 3
  String creditType = ""; // 신용가능 1
  String creditPeriod = ""; // 신용기간 3
  String preTradeAmt = ""; // 전일거래량 12
  String faceVal = ""; // 액면가 12
  String listDt = ""; // 상장일자 8
  String listAmt = ""; // 상장주수 15
  String capital = ""; // 자본금 21
  String settleMonth = ""; // 결산월 2
  String pubPrice = ""; // 공모가 7
  String prefStock = ""; // 우선주 1
  String shortOverheat = ""; // 공매도과열 1
  String strangeGrade = ""; // 이상급등 1
  String krx300 = ""; // KRX300 1
  String kospi = ""; // KOSPI 1
  String take = ""; // 매출액 9
  String operProf = ""; // 영업이익 9
  String ordiProf = ""; // 경상이익 9
  String netIncome = ""; // 당기순이익 5
  String roe = ""; // ROE 9
  String standardDt = ""; // 기준년월 8
  String totStockPrc = ""; // 시가총액 9
  String grpCode = ""; // 그룹사코드 3
  String creditLimited = ""; // 회사신용한도초과 1
  String mortLoanAble = ""; // 담보대출가능 1
  String lentStockAble = ""; // 대주가능 1

  factory JmKospi.fromMapToJmKospi(Map<String,String> input){
    var jmData = JmKospi();
    return jmData;
  }

  static List<int> sizeList = [
    2, 1, 4, 4, 4, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 9, 5, 5, 1, 1, 1, 2, 1, 1,
    1, 2, 2, 2, 3, 1, 3, 12, 12, 8,
    15, 21, 2, 7, 1, 1, 1, 1, 1, 9,
    9, 9, 5, 9, 8, 9, 3, 1, 1, 1
  ];

  static List<String> keyList = [
    'grCd', 'totPriceAmt', 'idxSectorMain', 'idxSectorMid', 'idxSectorSub',
    'cateTypeManufacture', 'lowLiquidty', 'govidxItem', 'kos200Sector', 'kospi100',
    'kospi150', 'ckr', 'etp', 'isEls', 'krx100',
    'krxCar', 'krxSemicon', 'krxBio', 'krxBank', 'spac',
    'krxEnergy', 'krxSteel', 'shortTermOverHeat', 'krxMedia', 'krxBuild',
    'non1', 'krxStock', 'krxShip', 'krxEnsure', 'krxTransit',
    'sri', 'prcStandart', 'orderUnit', 'overOrderUnit', 'transSuspend',
    'liquSale', 'mngStock', 'warnStock', 'preWarnStock', 'insincDisclosure',
    'bdList', 'lockType', 'stockChange', 'capiIncType', 'marginRate',
    'creditType', 'creditPeriod', 'preTradeAmt', 'faceVal', 'listDt',
    'listAmt', 'capital', 'settleMonth', 'pubPrice', 'prefStock',
    'shortOverheat', 'strangeGrade', 'krx300', 'kospi', 'take',
    'operProf', 'ordiProf', 'netIncome', 'roe', 'standardDt',
    'totStockPrc', 'grpCode', 'creditLimited', 'mortLoanAble', 'lentStockAble'
  ];
}