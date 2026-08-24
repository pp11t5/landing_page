import 'package:flutter/material.dart';

import '../data/faq.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../widgets/landing_scope.dart';
import '../widgets/section_container.dart';

class FaqSection extends StatefulWidget {
  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  int _openIndex = 0;

  @override
  Widget build(BuildContext context) {
    final compact = LandingScope.of(context).breakpoint.isCompact;
    return ColoredBox(
      color: AppColors.white,
      child: SectionContainer(
        key: LandingScope.of(context).anchors.faq,
        child: Column(
          children: [
            Text(
              '자주 묻는 질문',
              style: compact ? AppTypography.titleSmall : AppTypography.title,
            ),
            const SizedBox(height: 32),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 999),
              child: Column(
                children: [
                  for (var i = 0; i < faqItems.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _FaqTile(
                        item: faqItems[i],
                        expanded: _openIndex == i,
                        onTap: () => setState(() {
                          _openIndex = _openIndex == i ? -1 : i;
                        }),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  const _FaqTile({
    required this.item,
    required this.expanded,
    required this.onTap,
  });

  final FaqItem item;
  final bool expanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.gray20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.5)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(item.question, style: AppTypography.bodyStrong),
                  ),
                  Icon(
                    expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                child: expanded
                    ? Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(item.answer, style: AppTypography.body),
                        ),
                      )
                    : const SizedBox(width: double.infinity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
