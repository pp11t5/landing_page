import 'package:flutter/material.dart';

import '../theme/typography.dart';
import '../widgets/landing_scope.dart';
import '../widgets/mock_shot.dart';
import '../widgets/section_container.dart';

class SymptomSection extends StatelessWidget {
  const SymptomSection({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = LandingScope.of(context).breakpoint.isCompact;
    const preview = MockShot(
      asset: 'assets/images/mock_symptom.png',
      height: 280,
    );
    final text = Column(
      crossAxisAlignment: compact
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          '몸이 보낸 신호를 기록해요.',
          textAlign: compact ? TextAlign.center : TextAlign.start,
          style: compact ? AppTypography.titleSmall : AppTypography.title,
        ),
        const SizedBox(height: 16),
        Text(
          '컨디션부터 심한 불편함까지 현재 상태를 선택하고\n속 쓰림·신물·기침·답답함 등의 증상을 직접 기록해 주세요.',
          textAlign: compact ? TextAlign.center : TextAlign.start,
          style: AppTypography.body,
        ),
      ],
    );

    return SectionContainer(
      child: compact
          ? Column(children: [preview, const SizedBox(height: 32), text])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(child: preview),
                const SizedBox(width: 48),
                Expanded(child: text),
              ],
            ),
    );
  }
}
