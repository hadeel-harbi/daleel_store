import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:daleel_store/app/core/utils/svg_icon.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.icon,
    required this.text,
  });
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.ternaryGrey,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.grey),
          ),
          child: IconSvg(
            icon,
            color: AppColors.primary,
            size: 24,
          ),
        ),
        AppSpaces.height8,
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.dark.withOpacity(0.65),
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
