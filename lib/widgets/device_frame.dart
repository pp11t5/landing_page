import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/layout.dart';
import 'landing_image.dart';

class DeviceFrame extends StatelessWidget {
  const DeviceFrame({
    super.key,
    required this.asset,
    required this.label,
    this.width = AppLayout.deviceWidth,
  });

  final String asset;
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    final height = width * (AppLayout.deviceHeight / AppLayout.deviceWidth);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppLayout.deviceRadius),
        border: Border.all(color: AppColors.gray40),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 28,
            offset: Offset(0, 16),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: LandingImage(
        asset: asset,
        label: label,
        borderRadius: BorderRadius.circular(AppLayout.deviceRadius - 8),
      ),
    );
  }
}
