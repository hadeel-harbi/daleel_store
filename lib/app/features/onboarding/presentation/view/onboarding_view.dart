import 'package:daleel_store/app/features/onboarding/presentation/widgets/rotate_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_blocked_scroll_physics/horizontal_blocked_scroll_physics.dart';
import 'package:daleel_store/app/core/utils/exports.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = OnboaringCubit.get(context);
    return Scaffold(
      body: BlocBuilder<OnboaringCubit, OnboaringState>(
        builder: (context, state) {
          return Stack(
            children: [
              BackgroundImages(
                index: cubit.currentIndex,
              ),
              //--------------------------------
              PositionedDirectional(
                top: -120,
                end: -130,
                child: AnimatedBuilder(
                  animation: cubit.pageController,
                  builder: (context, child) {
                    return RotateImage(
                      image: AppImages.vector1,
                      pageOffset: cubit.currentOffset,
                    );
                  },
                ),
              ),
              PositionedDirectional(
                bottom: -25,
                start: -95,
                child: AnimatedBuilder(
                  animation: cubit.pageController,
                  builder: (context, child) {
                    return AnimatedSlide(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.ease,
                      offset: Offset(-cubit.currentOffset * 1.35,
                          cubit.currentOffset * 0.5),
                      child: RotateImage(
                        image: AppImages.vector2,
                        pageOffset: cubit.currentOffset,
                        isNegative: true,
                      ),
                    );
                  },
                ),
              ),
              PositionedDirectional(
                bottom: -140,
                start: -340,
                child: AnimatedBuilder(
                  animation: cubit.pageController,
                  builder: (context, child) {
                    return AnimatedSlide(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.ease,
                      offset: Offset(-cubit.currentOffset * 2.3,
                          -cubit.currentOffset * 0.7),
                      child: RotateImage(
                        image: AppImages.vector3,
                        pageOffset: cubit.currentOffset,
                        isNegative: true,
                      ),
                    );
                  },
                ),
              ),
              //--------------------------------
              Positioned(
                bottom: 48,
                child: OnboardingTexts(index: cubit.currentIndex),
              ),
              //----------- Page View -----------
              Directionality(
                textDirection: TextDirection.ltr,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: cubit.pageController,
                  physics: cubit.currentIndex == 1
                      ? const LeftBlockedScrollPhysics()
                      : const PageScrollPhysics(),
                  onPageChanged: (value) {
                    cubit.changeIndex(value);
                  },
                  children: const [
                    OnboardingFirst(),
                    OnboardingSecond(),
                  ],
                ),
              ),
              //--------------------------------
              Positioned(
                bottom: 33,
                child: SwipeButton(cubit: cubit),
              ),
            ],
          );
        },
      ),
    );
  }
}
