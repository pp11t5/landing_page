import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:landing_page/app.dart';
import 'package:landing_page/sections/audience_section.dart';
import 'package:landing_page/sections/flow_section.dart';
import 'package:landing_page/theme/layout.dart';
import 'package:landing_page/widgets/landing_scope.dart';

void main() {
  testWidgets('landing renders hero and header', (tester) async {
    tester.view.physicalSize = const Size(1440, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const LandingApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.textContaining('오늘 먹을 음식'), findsOneWidget);
    expect(find.text('앱 설치하기'), findsOneWidget);
    expect(find.text('먹어도돼?'), findsWidgets);
  });

  testWidgets('audience desktop hugs card grid', (tester) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: LandingScope(
          breakpoint: Breakpoint.expanded,
          anchors: LandingAnchors(),
          onScrollTo: (_) {},
          child: CustomScrollView(
            slivers: const [SliverToBoxAdapter(child: AudienceSection())],
          ),
        ),
      ),
    );
    await tester.pump();

    final box = tester.renderObject<RenderBox>(find.byType(AudienceSection));
    expect(box.size.height, lessThan(600));
    expect(box.size.height, greaterThan(500));
  });

  testWidgets('flow cards do not overflow on a narrow phone width', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(375, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final overflows = <String>[];
    final previous = FlutterError.onError;
    FlutterError.onError = (details) {
      final text = details.toString();
      if (text.contains('overflowed') || text.contains('OVERFLOW')) {
        overflows.add(text);
      }
      previous?.call(details);
    };

    await tester.pumpWidget(
      MaterialApp(
        home: LandingScope(
          breakpoint: Breakpoint.compact,
          anchors: LandingAnchors(),
          onScrollTo: (_) {},
          child: const SingleChildScrollView(child: FlowSection()),
        ),
      ),
    );
    await tester.pump();
    FlutterError.onError = previous;

    expect(overflows, isEmpty);
    expect(find.text('메뉴 검색'), findsOneWidget);
    expect(find.text('먹을 메뉴를 검색해요.'), findsOneWidget);
  });
}
