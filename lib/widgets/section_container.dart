import 'package:flutter/material.dart';

import '../theme/layout.dart';
import 'landing_scope.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.color,
    this.padding,
  });

  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final scope = LandingScope.of(context);
    final resolved = padding ?? AppLayout.sectionPadding(scope.breakpoint);
    return ColoredBox(
      color: color ?? Colors.transparent,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppLayout.maxWidth),
          child: Padding(padding: resolved, child: child),
        ),
      ),
    );
  }
}
