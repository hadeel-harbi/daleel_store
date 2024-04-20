import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpaces.screenWidth(context) * 0.65,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsetsDirectional.only(end: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(color: AppColors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 14,
              spreadRadius: 0,
              offset: const Offset(0, 5),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            width: AppSpaces.screenWidth(context) * 0.6,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          AppSpaces.height24,
          Text("بطاقات بلايستيشن",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
          AppSpaces.height16,
          Row(
            children: [
              const Icon(
                Icons.arrow_right_rounded,
                color: AppColors.primary,
              ),
              Text(
                "عرض كل البطاقات",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.primary, fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      ),
    );
  }
}
