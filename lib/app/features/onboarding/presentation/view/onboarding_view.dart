import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/constants/icons.dart';
import 'package:daleel_store/app/core/constants/images.dart';
import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:daleel_store/app/core/utils/svg_icon.dart';
import 'package:daleel_store/app/features/onboarding/presentation/cubit/onboaring_cubit.dart';
import 'package:daleel_store/app/features/onboarding/presentation/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = OnboaringCubit.get(context);
    return Scaffold(
      body: BlocBuilder<OnboaringCubit, OnboaringState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                child: cubit.currentIndex == 0
                    ? Image.asset(
                        AppImages.onboarding1,
                      ).animate().fadeIn()
                    : Image.asset(
                        AppImages.onboarding2,
                      ).animate().fadeIn(),
              ),
              PositionedDirectional(
                top: -120,
                end: -130,
                child: Opacity(
                  opacity: 1,
                  child: AnimatedBuilder(
                      animation: cubit.pageController,
                      builder: (context, child) {
                        return RotationTransition(
                          turns: const AlwaysStoppedAnimation(0 / 360),
                          child: FirstRotate(
                            image: AppImages.vector1,
                            pageOffset: cubit.currentOffset,
                          ),
                        );
                      }),
                ),
              ),
              PositionedDirectional(
                bottom: -25,
                start: -95,
                child: Opacity(
                  opacity: 1,
                  child: AnimatedBuilder(
                      animation: cubit.pageController,
                      builder: (context, child) {
                        return RotationTransition(
                          turns: const AlwaysStoppedAnimation(0 / 360),
                          child: SecondRotate(
                            image: AppImages.vector2,
                            pageOffset: cubit.currentOffset,
                          ),
                        );
                      }),
                ),
              ),
              PositionedDirectional(
                bottom: -140,
                start: -340,
                child: Opacity(
                  opacity: 1,
                  child: AnimatedBuilder(
                      animation: cubit.pageController,
                      builder: (context, child) {
                        return RotationTransition(
                          turns: const AlwaysStoppedAnimation(0 / 360),
                          child: ThirdRotate(
                            image: AppImages.vector3,
                            pageOffset: cubit.currentOffset,
                          ),
                        );
                      }),
                ),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: cubit.pageController,
                  onPageChanged: (value) {
                    cubit.changeIndex(value);
                  },
                  children: const [
                    OnboardingFirst(),
                    OnboardingSecond(),
                  ],
                ),
              ),
              Positioned(
                bottom: 33,
                child: Column(
                  children: [
                    cubit.currentIndex == 0
                        ? Text(
                            "جميع المنتجات",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ).animate().fade()
                        : Text(
                            "أرسل هديتك الآن",
                            style: Theme.of(context).textTheme.headlineMedium,
                          )
                            .animate()
                            .fade(delay: const Duration(milliseconds: 20)),
                    AppSpaces.height8,
                    SizedBox(
                      width: AppSpaces.screenWidth(context) - 70,
                      child: Text(
                        "الوجهة الأولى والأسرع لشراء البطاقات الرقمية، مئات العلامات التجارية المحلية والعالمية وأفضل سوق للبطاقات الرقمية للاعبين في الشرق الأوسط",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    AppSpaces.height32,
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
                      width: AppSpaces.screenWidth(context),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: SmoothPageIndicator(
                          controller: cubit.pageController,
                          count: 4,
                          effect: ExpandingDotsEffect(
                              dotWidth: 7,
                              dotHeight: 5,
                              activeDotColor: AppColors.primary,
                              dotColor: AppColors.primary.withOpacity(0.3)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class OnboardingFirst extends StatelessWidget {
  const OnboardingFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboaringCubit, OnboaringState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            const PositionedDirectional(
              top: 160,
              end: 40,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(-30 / 360),
                child: ShopCard(
                  logo: "assets/logo/UM.png",
                  color: Color(0xff273BAC),
                  padding: 8,
                ),
              ),
            ),
            const PositionedDirectional(
              top: 360,
              start: 25,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(-20 / 360),
                child: ShopCard(
                  logo: "assets/logo/P.png",
                  color: Color(0xffED1736),
                  padding: 10,
                ),
              ),
            ),
            //---- mobile image
            Positioned(
              top: 100,
              child: Image.asset(
                AppImages.mobile1,
                width: 400,
              ),
            ),
            const PositionedDirectional(
              top: 170,
              start: 30,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(30 / 360),
                child: ShopCard(
                  color: Color(0xff009FCE),
                  logo: "assets/logo/a.png",
                  imageColor: Colors.white,
                  padding: 16,
                ),
              ),
            ),
            const PositionedDirectional(
              top: 405,
              end: 50,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(10 / 360),
                child: ShopCard(
                  color: Color(0xffF4EB0E),
                  logo: "assets/logo/noon.png",
                  padding: 16,
                ),
              ),
            ),

            //-------- Daleel logo
            Positioned(
              top: 50,
              child: Container(
                alignment: Alignment.center,
                width: AppSpaces.screenWidth(context),
                child: Image.asset(
                  AppImages.daleelLogo,
                  width: 50,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class OnboardingSecond extends StatelessWidget {
  const OnboardingSecond({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            turns: const AlwaysStoppedAnimation(-25 / 360),
            child: Image.asset(
              AppImages.gift,
              width: 500,
            ),
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

//----- Rotations

class FirstRotate extends StatelessWidget {
  const FirstRotate({super.key, required this.image, required this.pageOffset});

  final String image;
  final double pageOffset;

  @override
  Widget build(BuildContext context) {
    double value = 0.0;
    value = pageOffset.abs();
    return Transform.rotate(
      angle: value * 2.9,
      child: Image.asset(
        image,
      ),
    );
  }
}

class SecondRotate extends StatelessWidget {
  const SecondRotate(
      {super.key, required this.image, required this.pageOffset});

  final String image;
  final double pageOffset;

  @override
  Widget build(BuildContext context) {
    double value = 0.0;
    value = pageOffset.abs();

    return Transform.translate(
      offset: Offset(-pageOffset * 350, pageOffset * 100),
      child: Transform.rotate(
        angle: -value * 2.9,
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}

class ThirdRotate extends StatelessWidget {
  const ThirdRotate({super.key, required this.image, required this.pageOffset});

  final String image;
  final double pageOffset;

  @override
  Widget build(BuildContext context) {
    double value = 0.0;
    value = pageOffset.abs();

    return Transform.translate(
      offset: Offset(-pageOffset * 300, -pageOffset * 100),
      child: Transform.rotate(
        angle: -value * 2.9,
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
