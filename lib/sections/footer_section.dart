import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/layout.dart';
import '../theme/typography.dart';
import '../widgets/landing_scope.dart';
import '../widgets/section_container.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = LandingScope.of(context).breakpoint.isCompact;
    return ColoredBox(
      color: AppColors.footer,
      child: SectionContainer(
        padding: AppLayout.pagePadding(
          LandingScope.of(context).breakpoint,
        ).copyWith(top: 28, bottom: 28),
        child: compact
            ? const Column(
                children: [
                  _BrandName(),
                  SizedBox(height: 12),
                  _Copy(),
                ],
              )
            : const Row(
                children: [
                  _BrandName(),
                  Spacer(),
                  _Copy(),
                ],
              ),
      ),
    );
  }
}

class _BrandName extends StatelessWidget {
  const _BrandName();

  @override
  Widget build(BuildContext context) {
    return Text(
      '먹어도돼?',
      style: AppTypography.headerWordmark.copyWith(
        color: const Color(0xFFFEFEFE),
      ),
    );
  }
}

class _Copy extends StatelessWidget {
  const _Copy();

  @override
  Widget build(BuildContext context) {
    return Text(
      '© 2026 먹어도 돼? All rights reserved.',
      style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
    );
  }
}
