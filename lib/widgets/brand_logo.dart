import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/typography.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({
    super.key,
    this.markHeight = 30,
    this.showWordmark = true,
    this.light = false,
  });

  final double markHeight;
  final bool showWordmark;
  final bool light;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: markHeight,
          filterQuality: FilterQuality.high,
          errorBuilder: (_, _, _) => Container(
            width: markHeight,
            height: markHeight,
            decoration: BoxDecoration(
              color: AppColors.green100,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        if (showWordmark) ...[
          const SizedBox(width: 8),
          Text(
            '먹어도돼?',
            style: AppTypography.headerWordmark.copyWith(
              color: light ? const Color(0xFFFEFEFE) : AppColors.textPrimary,
            ),
          ),
        ],
      ],
    );
  }
}
