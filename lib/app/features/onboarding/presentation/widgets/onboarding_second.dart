import 'package:daleel_store/app/core/constants/images.dart';
import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:daleel_store/app/features/onboarding/presentation/cubit/onboaring_cubit.dart';
import 'package:flutter/material.dart';

class OnboardingSecond extends StatelessWidget {
  const OnboardingSecond({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = OnboaringCubit.get(context);
    return Stack(
      children: [
        Positioned(
          top: 70,
          child: Image.asset(
            AppImages.mobile2,
            width: 390,
          ),
        ),
        Positioned(
          left: 75,
          bottom: 210,
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(50 / 360),
            child: AnimatedBuilder(
                animation: cubit.pageController,
                builder: (context, child) {
                  return AnimatedRotation(
                    duration: const Duration(milliseconds: 100),
                    turns: cubit.currentOffset * -0.2,
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.ease,
                      scale: cubit.currentOffset,
                      child: Image.asset(
                        AppImages.gift,
                        width: 500,
                      ),
                    ),
                  );
                }),
          ),
        ),
        Positioned(
            top: 60,
            child: Container(
                alignment: Alignment.center,
                width: AppSpaces.screenWidth(context),
                child: Image.asset(AppImages.daleelLogo)))
      ],
    );
  }
}
