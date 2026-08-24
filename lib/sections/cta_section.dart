import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/layout.dart';
import '../theme/typography.dart';
import '../widgets/landing_scope.dart';
import '../widgets/section_container.dart';
import '../widgets/store_badges.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = LandingScope.of(context).breakpoint.isCompact;
    return ColoredBox(
      color: AppColors.white,
      child: SectionContainer(
        key: LandingScope.of(context).anchors.download,
        padding: AppLayout.sectionPadding(
          LandingScope.of(context).breakpoint,
        ).copyWith(top: 48, bottom: 64),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              height: compact ? 280 : AppLayout.ctaHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppLayout.ctaRadius),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const ColoredBox(color: AppColors.cta),
                    Opacity(
                      opacity: 0.28,
                      child: Image.asset(
                        'assets/images/cta_bg.png',
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        errorBuilder: (_, _, _) => const SizedBox.shrink(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: compact ? 24 : 48,
                        vertical: compact ? 36 : 48,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '오늘 한 끼부터,\n‘먹어도 돼?’와 함께하세요.',
                            textAlign: TextAlign.center,
                            style:
                                (compact
                                        ? AppTypography.titleSmall
                                        : AppTypography.title)
                                    .copyWith(color: const Color(0xFFFFFFFF)),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '내 몸의 신호를 알아가는 가장 안전한 식사 기록을 지금 시작하세요.',
                            textAlign: TextAlign.center,
                            style: AppTypography.body.copyWith(
                              color: const Color(0xFFEAEAEA),
                            ),
                          ),
                          const SizedBox(height: 28),
                          const StoreBadges(light: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
