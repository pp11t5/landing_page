import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/typography.dart';
import '../widgets/landing_image.dart';
import '../widgets/landing_scope.dart';
import '../widgets/section_container.dart';

class SolutionSection extends StatelessWidget {
  const SolutionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = LandingScope.of(context).breakpoint.isCompact;
    final text = Column(
      crossAxisAlignment: compact
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          '필요한 건 복잡한 식단표가 아니라\n음식과 몸의 반응을 연결하는 기록입니다.',
          textAlign: compact ? TextAlign.center : TextAlign.start,
          style: compact ? AppTypography.titleSmall : AppTypography.title,
        ),
        const SizedBox(height: 16),
        Text(
          '식사와 증상을 함께 기록해 나에게 편한 음식과\n편치 않은 음식의 패턴을 발견할 수 있어요.',
          textAlign: compact ? TextAlign.center : TextAlign.start,
          style: AppTypography.body,
        ),
      ],
    );

    final photo = LandingImage(
      asset: 'assets/images/solution_photo.png',
      label: 'solution_photo.png',
      width: compact ? 220 : 280,
      height: compact ? 220 : 280,
      borderRadius: BorderRadius.circular(140),
    );

    return ColoredBox(
      color: AppColors.white,
      child: SectionContainer(
        child: compact
            ? Column(children: [text, const SizedBox(height: 32), photo])
            : Row(
                children: [
                  Expanded(child: text),
                  const SizedBox(width: 48),
                  photo,
                ],
              ),
      ),
    );
  }
}
