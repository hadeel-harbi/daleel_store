import 'package:daleel_store/app/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BackgroundImages extends StatelessWidget {
  const BackgroundImages({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: index == 0
          ? Image.asset(
              AppImages.onboarding1,
            ).animate().fadeIn()
          : Image.asset(
              AppImages.onboarding2,
            ).animate().fadeIn(),
    );
  }
}
