import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/constants/icons.dart';
import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:daleel_store/app/core/utils/svg_icon.dart';
import 'package:flutter/material.dart';

class OperationDetails extends StatelessWidget {
  const OperationDetails({
    super.key,
    required this.label,
    required this.content,
  });
  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(border: Border.all(color: AppColors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          label != "عدد النقاط"
              ? Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    content,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              : Row(
                  children: [
                    const IconSvg(
                      AppIcons.star,
                      color: AppColors.secondaryOrange,
                      size: 14,
                    ),
                    AppSpaces.width4,
                    Text(
                      content,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.secondaryOrange),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
