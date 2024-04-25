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
          child: const Padding(
            padding: EdgeInsetsDirectional.only(top: 12, bottom: 12, end: 8),
            child: IconSvg(
              AppIcons.menu,
              size: 14,
              color: AppColors.light,
            ),
          ),
        ),
        ClipOval(
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
        AppSpaces.width8,
        Text(
          "خالد عليان",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: AppColors.light),
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
