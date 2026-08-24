import 'package:flutter/material.dart';

import '../data/audiences.dart';
import '../theme/colors.dart';
import '../theme/layout.dart';
import '../theme/typography.dart';
import '../widgets/landing_scope.dart';

class AudienceSection extends StatelessWidget {
  const AudienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = LandingScope.of(context).breakpoint.isCompact;
    final cards = GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: audiences.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: compact ? 1 : 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: compact ? 120 : 140,
      ),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.check, color: AppColors.green100, size: 20),
              const SizedBox(height: 12),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  audiences[index],
                  style: AppTypography.bodyStrong,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
            ],
          ),
        );
      },
    );

    if (compact) {
      return ClipRect(
        child: ColoredBox(
          color: AppColors.cream,
          child: Padding(
            padding: AppLayout.pagePadding(
              LandingScope.of(context).breakpoint,
            ).copyWith(top: 48, bottom: 0),
            child: Column(
              children: [
                const _IntroCopy(),
                const SizedBox(height: 28),
                cards,
                const SizedBox(height: 24),
                const Center(child: _SaladCircle(size: 240)),
              ],
            ),
          ),
        ),
      );
    }

    const saladSize = 380.0;
    final pad = AppLayout.pagePadding(LandingScope.of(context).breakpoint);
    return ClipRect(
      child: ColoredBox(
        color: AppColors.cream,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: pad.copyWith(top: 80, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.only(right: 24),
                      child: _IntroCopy(alignStart: true),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(flex: 6, child: cards),
                ],
              ),
            ),
            Positioned(
              left: pad.left,
              bottom: -(saladSize * 0.42),
              child: const _SaladCircle(size: saladSize),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroCopy extends StatelessWidget {
  const _IntroCopy({this.alignStart = false});

  final bool alignStart;

  @override
  Widget build(BuildContext context) {
    final align = alignStart ? TextAlign.start : TextAlign.center;
    return Column(
      crossAxisAlignment: alignStart
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          '이런 분께\n‘먹어도 돼?’가 필요해요.',
          textAlign: align,
          style: LandingScope.of(context).breakpoint.isCompact
              ? AppTypography.titleSmall
              : AppTypography.title,
        ),
        const SizedBox(height: 16),
        Text(
          '식사 후 반복되는 불편을 그냥 넘기지 않고,\n내 몸에 맞는 식사 기준을 찾고 싶은 분을 위한 서비스입니다.',
          textAlign: align,
          style: AppTypography.body,
        ),
      ],
    );
  }
}

class _SaladCircle extends StatelessWidget {
  const _SaladCircle({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: Image.asset(
          'assets/images/audience_photo.png',
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          errorBuilder: (_, _, _) => ColoredBox(
            color: AppColors.gray30,
            child: Center(
              child: Text(
                'audience_photo.png',
                style: AppTypography.caption.copyWith(
                  color: AppColors.textTertiary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
