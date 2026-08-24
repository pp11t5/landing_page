import 'package:flutter/material.dart';

import '../data/features.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../widgets/landing_scope.dart';
import '../widgets/mock_shot.dart';
import '../widgets/section_container.dart';

class PreMealSection extends StatelessWidget {
  const PreMealSection({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = LandingScope.of(context).breakpoint.isCompact;
    final text = Column(
      crossAxisAlignment: compact
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          '먹기 전에 검색하고,\n주의해야 할 이유까지 확인해요.',
          textAlign: compact ? TextAlign.center : TextAlign.start,
          style: compact ? AppTypography.titleSmall : AppTypography.title,
        ),
        const SizedBox(height: 24),
        for (final bullet in preMealBullets) _Bullet(text: bullet),
      ],
    );

    const mock = MockShot(asset: 'assets/images/mock_pre_meal.png');

    return SectionContainer(
      key: LandingScope.of(context).anchors.features,
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

class _Bullet extends StatelessWidget {
  const _Bullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.green100, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: AppTypography.bodyStrong)),
        ],
      ),
    );
  }
}
