import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/utils/device_utils.dart';
import 'package:daleel_store/app/core/constants/icons.dart';
import 'package:daleel_store/app/core/utils/svg_icon.dart';
import 'package:daleel_store/app/features/onboarding/presentation/cubit/onboaring_cubit.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SwipeButton extends StatelessWidget {
  const SwipeButton({
    super.key,
    required this.cubit,
  });

  final OnboaringCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            cubit.nextPage(context);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const IconSvg(
              AppIcons.arrowForward,
              color: AppColors.light,
              size: 11,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: DeviceUtils.screenWidth(context),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: SmoothPageIndicator(
              controller: cubit.pageController,
              count: 2,
              effect: ExpandingDotsEffect(
                  dotWidth: 7,
                  dotHeight: 5,
                  activeDotColor: AppColors.primary,
                  dotColor: AppColors.primary.withOpacity(0.3)),
            ),
          ),
        ),
      ],
    );
  }
}
