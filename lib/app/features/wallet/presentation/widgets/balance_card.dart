import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/utils/device_utils.dart';
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
      width: DeviceUtils.screenWidth(context) * 0.8,
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
            mainAxisAlignment: DeviceUtils.screenWidth(context) > 850
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              BalanceButton(
                icon: AppIcons.addCircle,
                text: "إضافة أموال",
              ),
              VertDivider(),
              BalanceButton(
                icon: AppIcons.gift,
                text: "إهداء أموال",
              ),
              VertDivider(),
              BalanceButton(
                icon: AppIcons.income,
                text: "طلب أموال",
              ),
            ],
          )
        ],
      ),
    );
  }
}

class VertDivider extends StatelessWidget {
  const VertDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 1,
        height: 25,
        color: AppColors.light,
      ),
    );
  }
}

class BalanceButton extends StatelessWidget {
  const BalanceButton({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconSvg(
          icon,
          color: AppColors.light,
          size: 20,
        ),
        AppSpaces.height8,
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.light, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
