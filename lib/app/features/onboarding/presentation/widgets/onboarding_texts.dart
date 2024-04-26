import 'package:daleel_store/app/core/utils/device_utils.dart';
import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingTexts extends StatelessWidget {
  const OnboardingTexts({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: DeviceUtils.screenWidth(context),
        ),
        index == 0
            ? Text(
                "جميع المنتجات",
                style: Theme.of(context).textTheme.headlineMedium,
              ).animate().fadeIn()
            : Text(
                "أرسل هديتك الآن",
                style: Theme.of(context).textTheme.headlineMedium,
              ).animate().fadeIn(delay: const Duration(milliseconds: 20)),
        AppSpaces.height8,
        SizedBox(
          width: DeviceUtils.screenWidth(context) - 70,
          child: Text(
            "الوجهة الأولى والأسرع لشراء البطاقات الرقمية، مئات العلامات التجارية المحلية والعالمية وأفضل سوق للبطاقات الرقمية للاعبين في الشرق الأوسط",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        AppSpaces.height96,
      ],
    );
  }
}
