import 'package:flutter/material.dart';

import '../theme/layout.dart';

/// Desktop 1440 프레임에 맞춰 가운데 정렬한다.
class DesignCanvas extends StatelessWidget {
  const DesignCanvas({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppLayout.canvasWidth),
        child: child,
      ),
    );
  }
}
