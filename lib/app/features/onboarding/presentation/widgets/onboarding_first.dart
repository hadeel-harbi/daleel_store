import 'package:daleel_store/app/core/utils/device_utils.dart';
import 'package:daleel_store/app/core/constants/images.dart';
import 'package:daleel_store/app/features/onboarding/presentation/cubit/onboaring_cubit.dart';
import 'package:daleel_store/app/features/onboarding/presentation/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingFirst extends StatelessWidget {
  const OnboardingFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = OnboaringCubit.get(context);
    return BlocBuilder<OnboaringCubit, OnboaringState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
              top: DeviceUtils.isLargeDevices(context) ? 20 : 0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              PositionedDirectional(
                top: 160,
                end: 40,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(-30 / 360),
                  child: AnimatedBuilder(
                      animation: cubit.pageController,
                      builder: (context, child) {
                        return AnimatedRotation(
                          duration: const Duration(milliseconds: 50),
                          turns: cubit.currentOffset * 0.09,
                          child: const ShopCard(
                            logo: "assets/logo/UM.png",
                            color: Color(0xff273BAC),
                            padding: 8,
                          ),
                        );
                      }),
                ),
              ),
              PositionedDirectional(
                top: 360,
                start: 25,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(-20 / 360),
                  child: AnimatedBuilder(
                      animation: cubit.pageController,
                      builder: (context, child) {
                        return AnimatedSlide(
                          duration: const Duration(milliseconds: 50),
                          offset: Offset(cubit.currentOffset, 0),
                          child: AnimatedRotation(
                            duration: const Duration(milliseconds: 50),
                            turns: cubit.currentOffset * 0.09,
                            child: const ShopCard(
                              logo: "assets/logo/playstation.png",
                              color: Color(0xffED1736),
                              padding: 18,
                            ),
                          ),
                        );
                      }),
                ),
              ),
              //---- mobile image
              Positioned(
                top: 100,
                child: Image.asset(
                  AppImages.mobile1,
                  width: DeviceUtils.screenWidth(context) * 0.9,
                ),
              ),
              PositionedDirectional(
                top: 170,
                start: 30,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(30 / 360),
                  child: AnimatedBuilder(
                      animation: cubit.pageController,
                      builder: (context, child) {
                        return AnimatedSlide(
                          duration: const Duration(milliseconds: 50),
                          offset: Offset(cubit.currentOffset * 2, 0),
                          child: AnimatedRotation(
                            duration: const Duration(milliseconds: 50),
                            turns: cubit.currentOffset * -0.2,
                            child: const ShopCard(
                              color: Color(0xff009FCE),
                              logo: "assets/logo/a.png",
                              imageColor: Colors.white,
                              padding: 16,
                            ),
                          ),
                        );
                      }),
                ),
              ),
              PositionedDirectional(
                top: 405,
                end: 50,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(10 / 360),
                  child: AnimatedBuilder(
                      animation: cubit.pageController,
                      builder: (context, child) {
                        return AnimatedSlide(
                          duration: const Duration(milliseconds: 50),
                          offset: Offset(-cubit.currentOffset * 1.5, 0),
                          child: AnimatedRotation(
                            duration: const Duration(milliseconds: 50),
                            turns: cubit.currentOffset * -0.1,
                            child: const ShopCard(
                              color: Color(0xffF4EB0E),
                              logo: "assets/logo/noon.png",
                              padding: 16,
                            ),
                          ),
                        );
                      }),
                ),
              ),

              //-------- Daleel logo
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
      },
    );
  }
}
