import 'package:flutter/material.dart';

enum Breakpoint {
  compact,
  medium,
  expanded;

  bool get isCompact => this == compact;
  bool get isExpanded => this == expanded;

  static Breakpoint ofWidth(double width) {
    if (width < 800) return compact;
    if (width < 1100) return medium;
    return expanded;
  }
}

abstract final class AppLayout {
  /// Figma Desktop 1440 프레임.
  static const double canvasWidth = 1440;
  static const double maxWidth = 1120;

  /// Floating Header: 1160 × 68, left 140, top 34, radius 22.
  static const double headerWidth = 1160;
  static const double headerHeight = 68;
  static const double headerRadius = 22;
  static const double headerInsetTop = 34;
  static const double headerInsetX = 140;
  static const double headerPadLeft = 20;
  static const double headerPadRight = 12;
  static const double headerPadY = 10;

  /// SVG Desktop 1440 실측.
  static const double heroHeight = 760;
  static const double heroPhoneLeft = 470;
  static const double heroPhoneWidth = 970;
  static const double heroPhoneHeight = 900;
  static const double heroInsetX = 130;
  static const double heroInsetY = 68;

  static const double quoteCardWidth = 414;
  static const double quoteCardHeight = 167;
  static const double quoteCardGap = 8;

  static const double deviceWidth = 297;
  static const double deviceHeight = 644;
  static const double deviceRadius = 38;

  static const double ctaWidth = 1224;
  static const double ctaHeight = 350;
  static const double ctaRadius = 28;

  static EdgeInsets headerPadding(Breakpoint bp) {
    return switch (bp) {
      Breakpoint.compact => const EdgeInsets.fromLTRB(16, 12, 16, 0),
      Breakpoint.medium => const EdgeInsets.fromLTRB(24, 24, 24, 0),
      Breakpoint.expanded => const EdgeInsets.fromLTRB(0, headerInsetTop, 0, 0),
    };
  }

  static double canvasScale(double viewWidth) {
    return (viewWidth / canvasWidth).clamp(0.5, 1.0);
  }

  static EdgeInsets heroPadding(Breakpoint bp, double viewHeight) {
    final x = switch (bp) {
      Breakpoint.compact => 20.0,
      Breakpoint.medium => 48.0,
      Breakpoint.expanded => heroInsetX,
    };
    if (bp.isCompact) {
      return EdgeInsets.fromLTRB(x, headerHeight + 24, x, 40);
    }
    final top = headerInsetTop + headerHeight + 24;
    return EdgeInsets.fromLTRB(x, top, x, 24);
  }

  static EdgeInsets pagePadding(Breakpoint bp) {
    return switch (bp) {
      Breakpoint.compact => const EdgeInsets.symmetric(horizontal: 20),
      Breakpoint.medium => const EdgeInsets.symmetric(horizontal: 40),
      Breakpoint.expanded => const EdgeInsets.symmetric(horizontal: 48),
    };
  }

  static EdgeInsets sectionPadding(Breakpoint bp) {
    final vertical = bp.isCompact ? 64.0 : 96.0;
    return pagePadding(bp).copyWith(top: vertical, bottom: vertical);
  }
}
