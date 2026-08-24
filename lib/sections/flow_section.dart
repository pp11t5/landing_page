import 'package:flutter/material.dart';

import '../data/flow_steps.dart';
import '../theme/colors.dart';
import '../theme/layout.dart';
import '../theme/typography.dart';
import '../widgets/landing_scope.dart';
import '../widgets/section_container.dart';

class FlowSection extends StatelessWidget {
  const FlowSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bp = LandingScope.of(context).breakpoint;
    final compact = bp.isCompact;
    return ColoredBox(
      color: AppColors.white,
      child: Column(
        children: [
          SectionContainer(
            padding: AppLayout.sectionPadding(bp).copyWith(top: 140, bottom: 24),
            child: Text(
              '먹어도 돼?는 이렇게 사용해요.',
              textAlign: TextAlign.center,
              style: compact ? AppTypography.titleSmall : AppTypography.title,
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth < 700
                  ? 1
                  : constraints.maxWidth < 1000
                  ? 2
                  : 5;
              final pad = AppLayout.pagePadding(
                LandingScope.of(context).breakpoint,
              );

              if (columns == 1) {
                return Padding(
                  padding: pad,
                  child: Column(
                    children: [
                      for (var i = 0; i < flowSteps.length; i++) ...[
                        if (i > 0) const SizedBox(height: 21),
                        _FlowCard(step: flowSteps[i]),
                      ],
                    ],
                  ),
                );
              }

              const cardH = 199.0;
              final cards = Padding(
                padding: pad,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: flowSteps.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    mainAxisSpacing: 21,
                    crossAxisSpacing: 21,
                    mainAxisExtent: cardH,
                  ),
                  itemBuilder: (context, index) {
                    return _FlowCard(step: flowSteps[index]);
                  },
                ),
              );

              if (columns < 5) return cards;

              return SizedBox(
                height: cardH,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Positioned(
                      left: 0,
                      right: 0,
                      height: 73,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF00BEFF), Color(0xFF00BF72)],
                          ),
                        ),
                      ),
                    ),
                    cards,
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 140),
        ],
      ),
    );
  }
}

class _FlowCard extends StatelessWidget {
  const _FlowCard({required this.step});

  final FlowStep step;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        borderRadius: BorderRadius.circular(17.5),
        border: Border.all(color: AppColors.gray40, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            step.number,
            style: AppTypography.caption.copyWith(
              color: AppColors.green100,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(step.title, style: AppTypography.bodyStrong),
          const SizedBox(height: 8),
          Text(step.body, style: AppTypography.caption),
        ],
      ),
    );
  }
}
