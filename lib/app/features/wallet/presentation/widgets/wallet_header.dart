import 'package:daleel_store/app/core/utils/exports.dart';

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
            AppIcons.menu,
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
                AppImages.person,
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
          icon: AppIcons.alart,
          color: AppColors.secondaryGreen,
          badgeCount: 0,
        ),
        AppSpaces.width16,
        const IconWithBadge(
          icon: AppIcons.cart,
          color: AppColors.secondaryGreen,
          badgeCount: 0,
        ),
      ],
    );
  }
}
