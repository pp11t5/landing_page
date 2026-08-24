import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/links.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import 'landing_tap.dart';

class StoreBadges extends StatelessWidget {
  const StoreBadges({super.key, this.light = false});

  final bool light;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        _Badge(
          asset: light
              ? 'assets/images/appstore_white.png'
              : 'assets/images/appstore.png',
          caption: 'Download on the',
          title: 'App Store',
          url: StoreLinks.appStore,
          light: light,
        ),
        _Badge(
          asset: light
              ? 'assets/images/playstore_white.png'
              : 'assets/images/google_playstore.png',
          caption: 'GET IT ON',
          title: 'Google Play',
          url: StoreLinks.googlePlay,
          light: light,
        ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.asset,
    required this.caption,
    required this.title,
    required this.url,
    required this.light,
  });

  final String asset;
  final String caption;
  final String title;
  final String url;
  final bool light;

  Future<void> _open(BuildContext context) async {
    if (url.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('앱 출시 준비 중이에요')));
      return;
    }
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    const height = 40.0;
    return LandingTap(
      onTap: () => _open(context),
      child: Image.asset(
        asset,
        height: height,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
        errorBuilder: (_, _, _) =>
            _Fallback(caption: caption, title: title, light: light),
      ),
    );
  }
}

class _Fallback extends StatelessWidget {
  const _Fallback({
    required this.caption,
    required this.title,
    required this.light,
  });

  final String caption;
  final String title;
  final bool light;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: light ? AppColors.white : AppColors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            caption,
            style: AppTypography.caption.copyWith(
              fontSize: 9,
              height: 1.1,
              color: light ? AppColors.black : AppColors.white,
            ),
          ),
          Text(
            title,
            style: AppTypography.bodyStrong.copyWith(
              fontSize: 14,
              height: 1.1,
              color: light ? AppColors.black : AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
