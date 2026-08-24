import 'package:flutter/material.dart';

import 'colors.dart';

abstract final class AppTypography {
  static const String fontFamily = 'Pretendard';
  static const String notoSansKr = 'Noto Sans KR';
  static const String helveticaNeue = 'Helvetica Neue';
  static const String sbAggro = 'SBAggroOTF';

  static const TextStyle headerWordmark = TextStyle(
    fontFamily: notoSansKr,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 30 / 20,
    letterSpacing: -1.349,
    color: AppColors.textPrimary,
  );

  static const TextStyle headerNav = TextStyle(
    fontFamily: notoSansKr,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 21 / 14,
    letterSpacing: -0.15,
    color: AppColors.nav,
  );

  static const TextStyle headerCta = TextStyle(
    fontFamily: notoSansKr,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 21 / 14,
    letterSpacing: -0.15,
    color: Color(0xFFFEFEFE),
  );

  /// 히어로 배지. Hangul은 Helvetica Neue에 없어 Pretendard 700으로 폴백.
  static const TextStyle heroBadge = TextStyle(
    fontFamily: helveticaNeue,
    fontFamilyFallback: [fontFamily, 'Arial'],
    fontSize: 19.456,
    fontWeight: FontWeight.w700,
    height: 1.30,
    color: Color(0xFFFFFFFF),
  );

  /// 히어로 헤드라인. Aggro 파일이 없어 Pretendard Bold로 두께를 맞춘다.
  static const TextStyle heroDisplay = TextStyle(
    fontFamily: fontFamily,
    fontSize: 60,
    fontWeight: FontWeight.w700,
    height: 76 / 60,
    letterSpacing: -0.6,
    color: AppColors.textPrimary,
  );

  /// 히어로 서브. Header_1 Regular 24/36.
  static const TextStyle heroSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static const TextStyle display = TextStyle(
    fontFamily: fontFamily,
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 1.25,
    letterSpacing: -0.8,
    color: AppColors.textPrimary,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.3,
    letterSpacing: -0.4,
    color: AppColors.textPrimary,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodyStrong = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static const TextStyle nav = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: AppColors.white,
  );
}
