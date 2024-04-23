import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/features/home/presentation/cubit/slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesSlider extends StatelessWidget {
  const ImagesSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = SliderCubit.get(context);
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: cubit.controller,
            itemCount: cubit.pages.length,
            itemBuilder: (_, index) {
              return cubit.pages[index];
            },
          ),
        ),
        SmoothPageIndicator(
            controller: cubit.controller,
            count: 4,
            effect: ExpandingDotsEffect(
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: AppColors.primary,
                dotColor: AppColors.primary.withOpacity(0.3)),
            onDotClicked: (index) {}),
      ],
    );
  }
}
