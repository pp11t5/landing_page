class FlowStep {
  const FlowStep({
    required this.number,
    required this.title,
    required this.body,
  });

  final String number;
  final String title;
  final String body;
}

const flowSteps = [
  FlowStep(number: '01', title: '메뉴 검색', body: '먹을 메뉴를 검색해요.'),
  FlowStep(number: '02', title: '분석 결과 확인', body: '내 상태를 반영한 결과를 봐요.'),
  FlowStep(number: '03', title: '식사 후 증상 기록', body: '식사 뒤 몸 상태를 남겨요.'),
  FlowStep(number: '04', title: '음식과 증상 연결', body: '어떤 음식이 영향 줬는지 이어요.'),
  FlowStep(number: '05', title: '식사 패턴 발견', body: '나에게 맞는 식사 기준을 찾아요.'),
];
