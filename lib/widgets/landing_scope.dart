import 'package:flutter/material.dart';

import '../theme/layout.dart';

class LandingAnchors {
  LandingAnchors();

  final intro = GlobalKey();
  final features = GlobalKey();
  final faq = GlobalKey();
  final download = GlobalKey();
}

class LandingScope extends InheritedWidget {
  const LandingScope({
    super.key,
    required this.breakpoint,
    required this.anchors,
    required this.onScrollTo,
    required super.child,
  });

  final Breakpoint breakpoint;
  final LandingAnchors anchors;
  final void Function(GlobalKey key) onScrollTo;

  static LandingScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LandingScope>();
    assert(scope != null, 'LandingScope not found');
    return scope!;
  }

  @override
  bool updateShouldNotify(LandingScope oldWidget) {
    return breakpoint != oldWidget.breakpoint;
  }
}
