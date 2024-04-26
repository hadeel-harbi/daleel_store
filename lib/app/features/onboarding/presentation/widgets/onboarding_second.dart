import 'package:daleel_store/app/core/utils/device_utils.dart';
import 'package:daleel_store/app/core/constants/images.dart';
import 'package:daleel_store/app/features/onboarding/presentation/cubit/onboaring_cubit.dart';
import 'package:flutter/material.dart';

class OnboardingSecond extends StatelessWidget {
  const OnboardingSecond({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = OnboaringCubit.get(context);
    return Padding(
      padding:
          EdgeInsets.only(top: DeviceUtils.isLargeDevices(context) ? 20 : 0),
      child: Stack(
        children: [
          Positioned(
            top: 70,
            child: Image.asset(
              AppImages.mobile2,
              width: 390,
            ),
          ),
          Positioned(
            left: DeviceUtils.isLargeDevices(context) ? 90 : 75,
            bottom: DeviceUtils.isLargeDevices(context) ? 240 : 210,
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
                          width: DeviceUtils.screenWidth(context) * 1.2,
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Positioned(
            top: 50,
            child: Container(
              alignment: Alignment.center,
              width: DeviceUtils.screenWidth(context),
              child: Image.asset(
                AppImages.daleelLogo,
                width: 45,
              ),
            ),
          )
        ],
      ),
    );
  }
}
