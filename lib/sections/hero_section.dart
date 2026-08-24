import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/layout.dart';
import '../theme/typography.dart';
import '../widgets/design_canvas.dart';
import '../widgets/landing_scope.dart';
import '../widgets/store_badges.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bp = LandingScope.of(context).breakpoint;
    final compact = bp.isCompact;
    final width = MediaQuery.sizeOf(context).width;
    final scale = AppLayout.canvasScale(width);
    final heroH = compact ? null : AppLayout.heroHeight * scale;
    final display = compact
        ? AppTypography.heroDisplay.copyWith(fontSize: 32, height: 76 / 60)
        : AppTypography.heroDisplay;
    final subtitle = compact
        ? AppTypography.heroSubtitle.copyWith(fontSize: 18)
        : AppTypography.heroSubtitle;
    final badge = compact
        ? AppTypography.heroBadge.copyWith(fontSize: 14)
        : AppTypography.heroBadge;

    final text = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: compact
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.green100,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text('역류성 식도염을 위한 식단 기록 앱', style: badge),
        ),
        SizedBox(height: compact ? 20 : 24),
        _Headline(style: display, center: compact),
        SizedBox(height: compact ? 16 : 20),
        Text(
          '내 데이터를 바탕으로 주의해야 할\n음식을 알려드릴게요.',
          textAlign: compact ? TextAlign.center : TextAlign.start,
          style: subtitle,
        ),
        SizedBox(height: compact ? 24 : 32),
        const StoreBadges(),
      ],
    );

    final stack = Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFEEF8F2),
                  Color(0xFFF7FBF8),
                  Color(0xFFFFFFFF),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: IgnorePointer(child: DesignCanvas(child: _HeroFoods())),
        ),
        if (!compact)
          Positioned(
            right: 0,
            top: 0,
            width: AppLayout.heroPhoneWidth * scale,
            height: AppLayout.heroPhoneHeight * scale,
            child: const _HeroPhone(),
          ),
        DesignCanvas(
          child: Padding(
            padding: AppLayout.heroPadding(
              bp,
              MediaQuery.sizeOf(context).height,
            ),
            child: compact
                ? Column(
                    children: [
                      text,
                      const SizedBox(height: 32),
                      const SizedBox(height: 340, child: _HeroPhone()),
                    ],
                  )
                : Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(width: 560 * scale, child: text),
                  ),
          ),
        ),
      ],
    );

    if (compact) return stack;
    return SizedBox(height: heroH, width: double.infinity, child: stack);
  }
}

class _Headline extends StatelessWidget {
  const _Headline({required this.style, required this.center});

  final TextStyle style;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final align = center ? Alignment.center : Alignment.centerLeft;
    final textAlign = center ? TextAlign.center : TextAlign.start;
    return Column(
      crossAxisAlignment: center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text('오늘 먹을 음식,', textAlign: textAlign, style: style, maxLines: 1),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: align,
          child: Text(
            '내 몸에 먼저 물어보세요.',
            textAlign: textAlign,
            style: style,
            maxLines: 1,
            softWrap: false,
          ),
        ),
      ],
    );
  }
}

class _HeroFoods extends StatelessWidget {
  const _HeroFoods();

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.26,
      child: ClipRect(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: 4.237,
            sigmaY: 4.237,
            tileMode: TileMode.decal,
          ),
          child: Image.asset(
            'assets/images/hero_bg_foods.png',
            width: double.infinity,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            filterQuality: FilterQuality.high,
            errorBuilder: (_, _, _) => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

class _HeroPhone extends StatelessWidget {
  const _HeroPhone();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/hero_phone.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.contain,
      alignment: Alignment.centerRight,
      filterQuality: FilterQuality.high,
      errorBuilder: (_, _, _) => const SizedBox.shrink(),
    );
  }
}
