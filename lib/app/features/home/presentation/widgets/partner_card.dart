import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/utils/device_utils.dart';
import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:flutter/material.dart';

class PartnerCard extends StatelessWidget {
  const PartnerCard({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceUtils.screenWidth(context) * 0.6,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsetsDirectional.only(end: 14),
      constraints: const BoxConstraints(maxWidth: 300),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          AppSpaces.height16,
          Text("كوبون  فوغاكلوسيت",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
          AppSpaces.height16,
          Text(
            "خصم يصل إلى 30%",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.dark.withOpacity(0.5),
                fontWeight: FontWeight.w600),
          ),
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                color: AppColors.secondaryGreen,
                borderRadius: BorderRadius.circular(17)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "كود الخصم",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
