class RemoteCategory {
  final int id;
  final String name;
  const RemoteCategory(this.id, this.name);
}

class RemoteApp {
  final int id;
  final String name;
  final String shortDesc;
  final String description;
  final String url;
  final String imageUrl;
  final int price;
  final int shippingFee;
  final List<int> categoryIds;

  final String? savingInfo;
  final String? benefitInfo;
  final String? shippingInfo;

  final String? manufacturer;
  final String? brand;
  final String? modelName;
  final String? origin;
  final String? detailFeatures;
  final String? productForm;
  final String? capacity;
  final String? keyFeatures;

  RemoteApp({
    required this.id,
    required this.name,
    required this.shortDesc,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.price,
    required this.shippingFee,
    required this.categoryIds,
    this.savingInfo,
    this.benefitInfo,
    this.shippingInfo,
    this.manufacturer,
    this.brand,
    this.modelName,
    this.origin,
    this.detailFeatures,
    this.productForm,
    this.capacity,
    this.keyFeatures,
  });
}


class ProductRemoteDataSource {
  Future<List<RemoteCategory>> fetchCategories() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return const [
      RemoteCategory(1, '추천'),
      RemoteCategory(2, '스마트스토어'),
      RemoteCategory(3, '브랜드스토어'),
      RemoteCategory(4, '도서'),
    ];
  }

  Future<List<RemoteApp>> fetchProducts() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));

    // 네가 준 링크 그대로 DB에 저장(설명(description)에 링크 넣음)
    return [
      RemoteApp(
        id: 6474568630,
        name: '프리메라 내추럴 리치 클렌징 폼 150ml',
        shortDesc: '폼 클렌징 - 아모레퍼시픽',
        description: '''
부드럽게 거품이 올라오는 데일리 폼 클렌저예요.
세안 후 당김을 줄이면서 노폐물/피지를 깔끔하게 정리해주는 타입(데모 문구)입니다.

✅ 이런 점이 좋아요
• 촘촘한 거품으로 세정감이 깔끔해요
• 피부에 자극을 줄이도록 설계된 타입(예시)
• 아침/저녁 데일리로 쓰기 좋아요

🧴 사용 방법(예시)
1) 미온수로 얼굴을 적신 뒤
2) 소량을 충분히 거품 내고
3) 부드럽게 롤링 후 깨끗이 헹궈주세요

ℹ️ 안내
• 피부 상태에 따라 사용감이 다를 수 있어요.
''',
        url: 'https://smartstore.naver.com/beautystoreland/products/6474568630?tr=oyp',
        imageUrl: 'https://shop-phinf.pstatic.net/20240328_36/17115929910448Y5g2_JPEG/112728889732130740_160650876.JPG?type=o1000',
        categoryIds: const [1, 2],
        price: 11400,
        shippingFee: 3000,

        // (이전 메시지에서 추가한 필드들 있으면 그대로 유지)
      ),


      RemoteApp(
        id: 7015376368,
        name: '아이시스8.0 무라벨 2L x 24펫',
        shortDesc: '생수 - 롯데칠성',
        description: '''
무라벨로 깔끔하게, 대용량으로 넉넉하게.
일상에서 부담 없이 마시기 좋은 생수 묶음 상품(데모 문구)입니다.

✅ 핵심 포인트
• 무라벨 패키지로 분리배출이 간편해요(예시)
• 2L x 24개 대용량 구성
• 가정/사무실/행사용으로 편하게 준비 가능

📦 구성(예시)
• 2L 페트 24개

ℹ️ 보관/안내
• 직사광선을 피하고 서늘한 곳에 보관해주세요.
• 제품/패키지 디자인은 시점에 따라 달라질 수 있어요.
''',
        url: 'https://brand.naver.com/lottechilsung/products/7015376368?tr=oyp',
        imageUrl: 'https://shop-phinf.pstatic.net/20251124_55/1763963983104qIErB_JPEG/98096939357221495_421490665.jpg?type=o1000',
        categoryIds: const [1, 3],
        price: 22400,
        shippingFee: 0,
      ),


      RemoteApp(
        id: 2492718178,
        name: '속 앤 플롯 55g - 샴푸 바',
        shortDesc: '고체 샴푸, 비건화장품 - 러쉬',
        description: '''
샴푸를 ‘바(bar)’ 형태로 간편하게.
여행/운동/출근 가방에 쏙 넣기 좋은 고체 샴푸(데모 문구)입니다.

✅ 이런 점이 좋아요
• 고체 타입이라 휴대/보관이 편해요
• 사용 후 물기만 잘 관리하면 오래 쓰기 좋아요
• 우디/스위트 계열의 향(예시)

🧼 사용 방법(예시)
1) 머리를 충분히 적신 뒤
2) 샴푸 바를 손에 문질러 거품을 내거나
3) 두피에 가볍게 문지른 후 마사지해 주세요

ℹ️ 안내
• 사용 환경에 따라 거품/사용감이 달라질 수 있어요.
''',
        url: 'https://brand.naver.com/lush/products/2492718178?nl-au=1a7fe60014234a4db97919a22d9d5d97',
        imageUrl: 'https://shop-phinf.pstatic.net/20230731_61/1690763386501FDVwB_JPEG/2391484382150752_1473445022.jpg?type=o1000',
        categoryIds: const [1, 3],
        price: 20000,
        shippingFee: 2500,
      ),


      RemoteApp(
        id: 10839555143,
        name: '유리아쥬 제모스 토너 500ML',
        shortDesc: '히알루론산 토너 - 유리아쥬',
        description: '''
대용량으로 넉넉하게 쓰는 데일리 토너.
세안 후 피부를 촉촉하게 정돈해주는 타입(데모 문구)입니다.

✅ 핵심 포인트
• 500ml 대용량으로 가성비 좋게 사용
• 스킨케어 첫 단계에서 피부 결 정돈용으로 적합(예시)
• 가볍게 레이어링하기 좋은 제형(예시)

💧 사용 방법(예시)
• 화장솜/손에 덜어 피부 결 방향으로 부드럽게 정돈해 주세요.

ℹ️ 안내
• 피부 상태/계절에 따라 사용감이 다를 수 있어요.
''',
        url: 'https://shop-phinf.pstatic.net/20251001_67/17592838924498j4kW_JPEG/93416878555279203_1217150722.jpg?type=o1000',
        imageUrl: 'https://shop-phinf.pstatic.net/20230731_61/1690763386501FDVwB_JPEG/2391484382150752_1473445022.jpg?type=o1000',
        categoryIds: const [1, 3],
        price: 38000,
        shippingFee: 0,
      ),


      RemoteApp(
        id: 9635699175,
        name: '루테인지아잔틴 코스트코 120캡슐',
        shortDesc: '루테인지아잔틴 - 아이시안',
        description: '''
하루 한 번, 꾸준히 챙기기 좋은 캡슐형 제품(데모 문구)입니다.
대용량(120캡슐) 구성으로 장기간 섭취 플랜에 적합하게 구성했어요(예시).

✅ 제품 포인트
• 120캡슐 대용량
• 1일 1캡슐 섭취 가이드(예시)
• 휴대/보관이 편한 캡슐 타입

ℹ️ 안내(예시)
• 본 문구는 데모용이며, 실제 효능/표기/섭취 방법은 판매 페이지를 확인해 주세요.
''',
        url: 'https://smartstore.naver.com/express999/products/9635699175?nl-au=f7bcd0a0a42441568fd0e0c497377fdd',
        imageUrl: 'https://shop-phinf.pstatic.net/20250815_92/1755235025509hSXHk_JPEG/7582438400004023_1794488924.jpg?type=o1000',
        categoryIds: const [1, 2],
        price: 33950,
        shippingFee: 0,
      ),


      RemoteApp(
        id: 10635135788,
        name: '센트룸 포 맨 더블업 종합 멀티 비타민 112정 남성 대용량 영양제',
        shortDesc: '멀티 비타민 - 센트룸',
        description: '''
매일 챙기기 좋은 멀티 비타민 대용량 구성(데모 문구)입니다.
정제 타입으로 보관이 편하고, 112정으로 넉넉하게 구성했어요.

✅ 핵심 포인트
• 112정 대용량
• 데일리 루틴에 넣기 좋은 정제 타입
• 바쁜 일정에도 간편하게 섭취(예시)

ℹ️ 안내(예시)
• 섭취 방법/주의사항/원료 정보는 판매 페이지 표기를 확인해 주세요.
''',
        url: 'https://smartstore.naver.com/tsshop1/products/10635135788?nl-au=d94fe21229f1407fae4fad9dc3181405',
        imageUrl: 'https://shop-phinf.pstatic.net/20251204_206/1764826303519JraqM_PNG/40444335986220886_286719227.PNG?type=o1000',
        categoryIds: const [1, 2],
        price: 35900,
        shippingFee: 0,
      ),


      RemoteApp(
        id: 7868256026,
        name: '종근당 이뮨 듀오 멀티비타맥스 액상비타민 종합 이뮨멀티비타민 7개입, 2개',
        shortDesc: '액상비타민 - 종근당',
        description: '''
한 번에 ‘올인원’으로 챙기는 복합 구성(데모 문구).
액상 + 정제 + 캡슐 형태로 구성되어 루틴화하기 좋게 설계된 타입(예시)입니다.

✅ 구성 포인트(예시)
• 액상 + 정제 + 캡슐 3종 복합 구성
• 하루 1회 섭취 가이드(예시)
• 휴대가 간편한 패키징(예시)

ℹ️ 안내
• 실제 섭취 방법/함량/주의사항은 판매 페이지 표기를 확인해 주세요.
''',
        url: 'https://brand.naver.com/meditree/products/7868256026?nl-au=fabb86c4d3db49ff9f045a95badc7695',
        imageUrl: 'https://shop-phinf.pstatic.net/20260206_258/17703486171020LUGv_JPEG/61149589401867343_129845859.jpg?type=o1000',
        categoryIds: const [1, 3],
        price: 70000,
        shippingFee: 0,
      ),


      RemoteApp(
        id: 11525829619,
        name: '알파CD 원핏 제로파우더 알파시클로덱스트린 2박스+추가6포 총46포 알파시디',
        shortDesc: '알파시클로덱스트린 - 에이치엘사이언스',
        description: '''
스틱형 분말로 간편하게 챙기는 제품(데모 문구)입니다.
총 46포 구성이라 ‘꾸준히’ 섭취 플랜을 만들기 좋게 구성했어요(예시).

✅ 핵심 포인트
• 스틱형 분말(휴대/보관 편리)
• 총 46포 대용량 구성
• 깔끔하게 물과 함께 섭취(예시)

ℹ️ 안내
• 실제 함량/원료/섭취 방법은 판매 페이지 표기를 확인해 주세요.
''',
        url: 'https://brand.naver.com/hleshop/products/11525829619?nl-au=9e95c3e4290a4d6e810f78161e543bc1',
        imageUrl: 'https://shop-phinf.pstatic.net/20250808_170/1754639742283IdNA0_PNG/88772567333979173_717965079.png?type=o1000',
        categoryIds: const [1, 3],
        price: 72000,
        shippingFee: 0,
      ),


      RemoteApp(
        id: 9167344454,
        name: '세븐 파워',
        shortDesc: '세븐 파워 - 해밀턴 헬머',
        description: '''
‘위대한 기업이 되는 조건’을 7가지 전략으로 정리한 경영서(데모 문구)입니다.
조직/제품/브랜드/전략을 어떻게 설계해야 하는지 큰 틀을 잡고 싶을 때 읽기 좋아요.

✅ 이런 분께 추천(예시)
• 전략/경영 프레임워크를 빠르게 잡고 싶은 분
• 제품/비즈니스의 ‘성장 구조’를 이해하고 싶은 분
• 실무 관점에서 의사결정 기준을 만들고 싶은 분

📌 키워드(예시)
• 전략 • 경쟁우위 • 조직 설계 • 성장 메커니즘
''',
        url: 'https://smartstore.naver.com/kyobobook/products/9167344454?nl-au=072b3e0100484e408721b094bc636e0e',
        imageUrl: 'https://shop-phinf.pstatic.net/20231215_134/1702626216800bXvbE_JPEG/15901390604431826_109490902.jpg?type=o1000',
        categoryIds: const [1, 2],
        price: 16650,
        shippingFee: 0,
      ),


      RemoteApp(
        id: 12385168874,
        name: 'AX3000SE 와이파이6 기가비트 유무선 공유기',
        shortDesc: '공유기 - ipTIME',
        description: '''
집/사무실 네트워크를 안정적으로 구성하기 좋은 Wi-Fi 6 공유기(데모 문구)입니다.
유선 기가비트 + 무선 고속 환경을 기본으로, Mesh/VPN 같은 기능 옵션을 제공하는 타입(예시)이에요.

✅ 핵심 기능(예시)
• Wi-Fi 6 지원
• 기가비트 유선 포트
• Mesh / VPN 기능 지원(모델/펌웨어에 따라 상이)

ℹ️ 안내
• 실제 지원 기능/스펙은 판매 페이지 표기를 확인해 주세요.
''',
        url: 'https://smartstore.naver.com/iptimeshopping/products/12385168874?nl-au=5c04c6f0c8e24b1890f7a3551ff11ff0',
        imageUrl: 'https://shop-phinf.pstatic.net/20250911_214/1757559711739CRyLm_JPEG/1684261356536119_1003237719.jpg?type=o1000',
        categoryIds: const [1, 2],
        price: 58900,
        shippingFee: 0,
      ),


      RemoteApp(
        id: 6576886971,
        name: '주영엔에스 관절엔 콘드로이친 1200 60정, 5개',
        shortDesc: '콘드로이친 - 주영엔에스',
        description: '''
대용량 세트 구성으로 넉넉하게 준비하는 건강기능식품 타입(데모 문구)입니다.
60정 x 5개 구성이라 가족/장기 루틴에 맞춰 구성하기 좋아요(예시).

✅ 구성 포인트
• 60정 x 5개 세트
• 정제 타입(보관 편리)
• 꾸준한 섭취 루틴 구성에 적합(예시)

ℹ️ 안내
• 실제 기능성/표기/섭취 방법은 판매 페이지 표기를 확인해 주세요.
''',
        url: 'https://brand.naver.com/jyns/products/6576886971?nl-au=63887eaef2b44bed88970aa4a4268b3c',
        imageUrl: 'https://shop-phinf.pstatic.net/20251212_244/1765505998239Nytgm_JPEG/12790781057274829_394737362.jpg?type=o1000',
        categoryIds: const [1, 3],
        price: 495000,
        shippingFee: 0,
      ),


      RemoteApp(
        id: 32467012122,
        name: '돈의 심리학',
        shortDesc: '돈의 심리학 - 모건 하우절',
        description: '''
‘돈을 벌고 불리는 방법’보다 더 중요한 것은 ‘사람의 심리’라고 말하는 책(데모 문구)입니다.
시장 데이터만으로 설명되지 않는 선택과 습관, 그리고 인간의 본능이 어떻게 부의 결과를 바꾸는지
짧은 이야기로 설득력 있게 풀어가요.

✅ 이 책에서 얻는 것(예시)
• 투자/소비에서 흔들리는 이유를 심리로 이해하기
• 장기적으로 유지 가능한 돈 습관 만들기
• “현실적인” 부의 전략을 내 상황에 적용하기

📌 키워드(예시)
• 행동경제학 • 장기 투자 • 리스크 • 습관 • 확률

ℹ️ 안내
• 본 문구는 데모용 요약입니다.
''',
        url: 'https://search.shopping.naver.com/book/catalog/32467012122',
        imageUrl: 'https://shopping-phinf.pstatic.net/main_3246701/32467012122.20260117074526.jpg',
        categoryIds: const [1, 4],
        price: 14800,
        shippingFee: 0,
      ),
    ];
  }
}
