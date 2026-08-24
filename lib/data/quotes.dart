class QuoteItem {
  const QuoteItem({required this.text, required this.asset});

  final String text;
  final String asset;
}

const quotes = [
  QuoteItem(
    text: '같은 음식을 먹어도 반응이 달라요.',
    asset: 'assets/images/quote_avatar_1.png',
  ),
  QuoteItem(
    text: '증상이 어떤 음식 때문에\n 생긴 건지 모르겠어요.',
    asset: 'assets/images/quote_avatar_2.png',
  ),
  QuoteItem(
    text: '병원에서는 내 상황에 맞는 답이 나오지 않았어요.',
    asset: 'assets/images/quote_avatar_3.png',
  ),
  QuoteItem(
    text: '음식과 증상을 연결해서 보고 싶어요.',
    asset: 'assets/images/quote_avatar_4.png',
  ),
];
