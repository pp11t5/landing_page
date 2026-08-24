import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/layout.dart';
import '../theme/typography.dart';
import 'brand_logo.dart';
import 'landing_scope.dart';
import 'landing_tap.dart';

class SiteHeader extends StatelessWidget {
  const SiteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final scope = LandingScope.of(context);
    final compact = scope.breakpoint.isCompact;

    return Padding(
      padding: AppLayout.headerPadding(scope.breakpoint),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppLayout.headerWidth),
          child: Material(
            color: const Color(0xFFFEFEFE),
            elevation: 0,
            borderRadius: BorderRadius.circular(AppLayout.headerRadius),
            child: Container(
              constraints: const BoxConstraints(
                minHeight: AppLayout.headerHeight,
              ),
              padding: EdgeInsets.fromLTRB(
                compact ? 16 : AppLayout.headerPadLeft,
                AppLayout.headerPadY,
                compact ? 16 : AppLayout.headerPadRight,
                AppLayout.headerPadY,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFEFEFE),
                borderRadius: BorderRadius.circular(AppLayout.headerRadius),
                border: Border.all(color: const Color(0x14FFFFFF)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1F151C18),
                    blurRadius: 48,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const BrandLogo(),
                  if (!compact)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _NavLink(
                            label: '서비스 이야기',
                            onTap: () => scope.onScrollTo(scope.anchors.intro),
                          ),
                          const SizedBox(width: 28),
                          _NavLink(
                            label: '주요 기능',
                            onTap: () =>
                                scope.onScrollTo(scope.anchors.features),
                          ),
                          const SizedBox(width: 28),
                          _NavLink(
                            label: 'FAQ',
                            onTap: () => scope.onScrollTo(scope.anchors.faq),
                          ),
                        ],
                      ),
                    )
                  else
                    const Spacer(),
                  _InstallButton(
                    onTap: () => scope.onScrollTo(scope.anchors.download),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: AppTypography.headerNav.copyWith(
            color: _hover ? AppColors.textPrimary : AppColors.nav,
          ),
        ),
      ),
    );
  }
}

class _InstallButton extends StatelessWidget {
  const _InstallButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return LandingTap(
      onTap: onTap,
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.textPrimary,
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Text('앱 설치하기', style: AppTypography.headerCta),
      ),
    );
  }
}
