import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/typography.dart';

/// 에셋이 없으면 라벨 박스를 보여 준다. 같은 경로에 파일을 넣으면 자동으로 바뀐다.
class LandingImage extends StatelessWidget {
  const LandingImage({
    super.key,
    required this.asset,
    this.label,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.background = AppColors.gray30,
  });

  final String asset;
  final String? label;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Color background;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.zero;
    return ClipRRect(
      borderRadius: radius,
      child: SizedBox(
        width: width,
        height: height,
        child: Image.asset(
          asset,
          fit: fit,
          width: width,
          height: height,
          errorBuilder: (_, _, _) => _Placeholder(
            label: label ?? asset.split('/').last,
            background: background,
          ),
        ),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.label, required this.background});

  final String label;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: background,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: AppTypography.caption.copyWith(
              color: AppColors.textTertiary,
            ),
          ),
        ),
      ),
    );
  }
}
