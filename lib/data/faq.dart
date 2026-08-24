class FaqItem {
  const FaqItem({required this.question, required this.answer});

  final String question;
  final String answer;
}

const faqItems = [
  FaqItem(
    question: '분석 결과는 어떻게 만들어지나요?',
    answer:
        '식사와 증상 기록을 바탕으로 반복되는 패턴을 분석해요.\n의학 정보는 미국소화기학회(ACG) 위식도역류질환 진료지침(2022)을 바탕으로 분석해요',
  ),
  FaqItem(
    question: '의료 진단을 대신하나요?',
    answer: '이 앱은 건강 참고 정보이며, 진단은 의료진과 상담해주세요.',
  ),
  FaqItem(
    question: '내 기록은 다른 사람과 공유될 수도 있나요?',
    answer: '네, 이미지를 다운받아 다른 사람에게 공유할 수 있어요.',
  ),
];
