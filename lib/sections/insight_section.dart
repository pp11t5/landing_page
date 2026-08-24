import 'package:flutter/material.dart';

import '../theme/layout.dart';
import '../theme/typography.dart';
import '../widgets/landing_scope.dart';
import '../widgets/mock_shot.dart';
import '../widgets/section_container.dart';

class InsightSection extends StatelessWidget {
  const InsightSection({super.key});

  static const _mockHeight = 520.0;

  @override
  Widget build(BuildContext context) {
    final bp = LandingScope.of(context).breakpoint;
    final compact = bp.isCompact;
    return SectionContainer(
      padding: AppLayout.sectionPadding(bp).copyWith(bottom: 0),
      child: Column(
        children: [
          Text(
            '기록이 쌓일수록\n나에게 맞는 음식이 선명해져요.',
            textAlign: TextAlign.center,
            style: compact ? AppTypography.titleSmall : AppTypography.title,
          ),
          const SizedBox(height: 12),
          Text(
            '음식 체크에서는 권장·주의 음식을 확인하고\n주간 리포트에서 시간 분포와 증상 추이를 볼 수 있어요.',
            textAlign: TextAlign.center,
            style: AppTypography.body,
          ),
          const SizedBox(height: 48),
          if (compact)
            const Column(
              children: [
                MockShot(
                  asset: 'assets/images/mock_insight_left.png',
                  height: _mockHeight,
                ),
                SizedBox(height: 24),
                MockShot(
                  asset: 'assets/images/mock_insight_right.png',
                  height: _mockHeight,
                ),
              ],
            )
          else
            const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: MockShot(
                    asset: 'assets/images/mock_insight_left.png',
                    height: _mockHeight,
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: MockShot(
                    asset: 'assets/images/mock_insight_right.png',
                    height: _mockHeight,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
