import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:daleel_store/app/core/utils/svg_icon.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/icon_with_badge.dart';
import 'package:daleel_store/app/shared/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => drawerKey.currentState!.openDrawer(),
          child: const IconSvg(
            "assets/icons/menu.svg",
            size: 14,
            color: AppColors.light,
          ),
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
              ?.copyWith(color: AppColors.light, fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        const IconWithBadge(
          icon: "assets/icons/alart.svg",
          color: AppColors.secondaryGreen,
          badgeCount: 0,
        ),
        AppSpaces.width16,
        const IconWithBadge(
          icon: "assets/icons/cart.svg",
          color: AppColors.secondaryGreen,
          badgeCount: 0,
        ),
      ],
    );
  }
}
