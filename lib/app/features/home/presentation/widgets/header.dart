import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:daleel_store/app/core/utils/svg_icon.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/icon_with_badge.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Row(
            children: [
              const IconSvg(
                "assets/icons/menu.svg",
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.primary, shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/images/person.png",
                      height: 36,
                      width: 36,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Text(
                "خالد عليان",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              )
            ],
          ),
          AppSpaces.height8,
          Row(
            children: [
              Row(
                children: [
                  const IconSvg(
                    "assets/icons/wallet.svg",
                    color: AppColors.secondaryGreen,
                    size: 20,
                  ),
                  AppSpaces.width4,
                  Text(
                    "200 ريال",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.secondaryGreen,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              AppSpaces.width8,
              Row(
                children: [
                  const IconSvg(
                    "assets/icons/star.svg",
                    color: AppColors.secondaryOrange,
                    size: 16,
                  ),
                  AppSpaces.width4,
                  Text(
                    "100 نقطة",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.secondaryOrange,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              const IconWithBadge(
                icon: "assets/icons/alart.svg",
                color: AppColors.primary,
                badgeCount: 1,
              ),
              AppSpaces.width16,
              const IconWithBadge(
                icon: "assets/icons/cart.svg",
                color: AppColors.secondaryRed,
                badgeCount: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
