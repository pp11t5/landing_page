import 'package:flutter/material.dart';

import 'landing_image.dart';

/// 시안에서 폰 목업 전체를보내기한 이미지. 프레임을 씌우지 않는다.
class MockShot extends StatelessWidget {
  const MockShot({super.key, required this.asset, this.height = 649});

  final String asset;
  final double height;

  @override
  Widget build(BuildContext context) {
    return LandingImage(
      asset: asset,
      label: asset.split('/').last,
      width: double.infinity,
      height: height,
      fit: BoxFit.contain,
      background: Colors.transparent,
    );
  }
}
