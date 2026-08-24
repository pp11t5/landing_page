import 'package:flutter/material.dart';

import '../theme/typography.dart';
import '../widgets/landing_scope.dart';
import '../widgets/mock_shot.dart';
import '../widgets/section_container.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = LandingScope.of(context).breakpoint.isCompact;
    final text = Column(
      crossAxisAlignment: compact
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          '무엇을 먹고 언제 불편했는지\n하나의 흐름으로 확인해요.',
          textAlign: compact ? TextAlign.center : TextAlign.start,
          style: compact ? AppTypography.titleSmall : AppTypography.title,
        ),
        const SizedBox(height: 16),
        Text(
          '식사 시간과 증상이 나타난 시점을 한눈에 확인해요.',
          textAlign: compact ? TextAlign.center : TextAlign.start,
          style: AppTypography.body,
        ),
      ],
    );

    const mock = MockShot(asset: 'assets/images/mock_timeline.png');

    return SectionContainer(
      child: compact
          ? Column(children: [text, const SizedBox(height: 40), mock])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: text),
                const SizedBox(width: 24),
                const Expanded(child: mock),
              ],
            ),
    );
  }
}
