import 'package:flutter/material.dart';

import 'sections/audience_section.dart';
import 'sections/cta_section.dart';
import 'sections/faq_section.dart';
import 'sections/flow_section.dart';
import 'sections/footer_section.dart';
import 'sections/hero_section.dart';
import 'sections/insight_section.dart';
import 'sections/pre_meal_section.dart';
import 'sections/problem_section.dart';
import 'sections/solution_section.dart';
import 'sections/symptom_section.dart';
import 'sections/timeline_section.dart';
import 'theme/colors.dart';
import 'theme/layout.dart';
import 'widgets/landing_scope.dart';
import 'widgets/site_header.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _controller = ScrollController();
  final _anchors = LandingAnchors();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      alignment: 0.12,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bp = Breakpoint.ofWidth(constraints.maxWidth);
          return LandingScope(
            breakpoint: bp,
            anchors: _anchors,
            onScrollTo: _scrollTo,
            child: Stack(
              children: [
                CustomScrollView(
                  controller: _controller,
                  physics: const ClampingScrollPhysics(),
                  slivers: const [
                    SliverToBoxAdapter(child: HeroSection()),
                    SliverToBoxAdapter(child: ProblemSection()),
                    SliverToBoxAdapter(child: SolutionSection()),
                    SliverToBoxAdapter(
                      child: ColoredBox(
                        color: AppColors.mint,
                        child: Column(
                          children: [
                            PreMealSection(),
                            SymptomSection(),
                            TimelineSection(),
                            InsightSection(),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: FlowSection()),
                    SliverToBoxAdapter(child: AudienceSection()),
                    SliverToBoxAdapter(child: FaqSection()),
                    SliverToBoxAdapter(child: CtaSection()),
                    SliverToBoxAdapter(child: FooterSection()),
                  ],
                ),
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SiteHeader(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
