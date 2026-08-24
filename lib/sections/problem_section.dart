import 'package:flutter/material.dart';

import '../data/quotes.dart';
import '../theme/colors.dart';
import '../theme/layout.dart';
import '../theme/typography.dart';
import '../widgets/landing_image.dart';
import '../widgets/landing_scope.dart';
import '../widgets/section_container.dart';

class ProblemSection extends StatelessWidget {
  const ProblemSection({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = LandingScope.of(context).breakpoint.isCompact;
    final titleStyle = compact
        ? AppTypography.titleSmall
        : AppTypography.title;
    return ColoredBox(
      color: AppColors.white,
      child: Column(
        children: [
          SectionContainer(
            key: LandingScope.of(context).anchors.intro,
            child: Text.rich(
              TextSpan(
                style: titleStyle,
                children: [
                  const TextSpan(text: '먹고 나서 '),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: ColoredBox(
                      color: const Color(0xFFFFE566),
                      child: Text(
                        '불편',
                        style: titleStyle.copyWith(height: 1),
                      ),
                    ),
                  ),
                  const TextSpan(text: '했는데,\n어떤 음식 때문인지 모르겠나요?'),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          const _QuoteMarquee(),
          const SizedBox(height: 56),
        ],
      ),
    );
  }
}

class _QuoteMarquee extends StatefulWidget {
  const _QuoteMarquee();

  @override
  State<_QuoteMarquee> createState() => _QuoteMarqueeState();
}

class _QuoteMarqueeState extends State<_QuoteMarquee>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 28),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final compact = LandingScope.of(context).breakpoint.isCompact;
    final cardW = compact ? 300.0 : AppLayout.quoteCardWidth;
    final gap = AppLayout.quoteCardGap;
    final itemW = cardW + gap;
    final loop = quotes.length * itemW;

    return SizedBox(
      height: AppLayout.quoteCardHeight,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final dx = _controller.value * loop;
          return OverflowBox(
            maxWidth: double.infinity,
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(-dx, 0),
              child: Row(
                children: [
                  for (var i = 0; i < quotes.length * 2; i++)
                    Padding(
                      padding: EdgeInsets.only(right: gap),
                      child: _QuoteCard(
                        item: quotes[i % quotes.length],
                        width: cardW,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _QuoteCard extends StatelessWidget {
  const _QuoteCard({required this.item, required this.width});

  final QuoteItem item;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: AppLayout.quoteCardHeight,
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      decoration: BoxDecoration(
        color: AppColors.quoteBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.text, style: AppTypography.bodyStrong, maxLines: 2),
          const Spacer(),
          LandingImage(
            asset: item.asset,
            label: 'avatar',
            width: 36,
            height: 36,
            borderRadius: BorderRadius.circular(18),
          ),
        ],
      ),
    );
  }
}
