import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/constants/icons.dart';
import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:daleel_store/app/core/utils/svg_icon.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpaces.screenWidth(context) * 0.8,
      height: 184,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            const Color(0xff2AB97E).withOpacity(0.95),
            const Color(0xff4ABC8D).withOpacity(0.65)
          ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "الرصيد الحالي",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.light),
          ),
          AppSpaces.height4,
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "34.",
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.light,
                ),
              ),
              Text(
                "14,235 ريال",
                style: TextStyle(
                    fontSize: 30,
                    color: AppColors.light,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          AppSpaces.height8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const IconSvg(
                    AppIcons.addCircle,
                    color: AppColors.light,
                    size: 20,
                  ),
                  AppSpaces.height8,
                  Text(
                    "إضافة أموال",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.light, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Container(
                width: 1,
                height: 25,
                color: AppColors.light,
              ),
              Column(
                children: [
                  const IconSvg(
                    AppIcons.gift,
                    color: AppColors.light,
                    size: 20,
                  ),
                  AppSpaces.height8,
                  Text(
                    "إهداء أموال",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.light, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 1,
                  height: 25,
                  color: AppColors.light,
                ),
              ),
              Column(
                children: [
                  const IconSvg(
                    AppIcons.income,
                    color: AppColors.light,
                    size: 20,
                  ),
                  AppSpaces.height8,
                  Text(
                    "طلب أموال",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.light, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
