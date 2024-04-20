import 'package:badges/badges.dart' as badges;
import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/utils/svg_icon.dart';
import 'package:flutter/material.dart';

class IconWithBadge extends StatelessWidget {
  const IconWithBadge({
    super.key,
    required this.icon,
    required this.color,
    required this.badgeCount,
  });
  final String icon;
  final Color color;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: Text(
        '$badgeCount',
        style: const TextStyle(
          color: AppColors.light,
        ),
      ),
      position: badges.BadgePosition.topStart(),
      badgeStyle: badges.BadgeStyle(
          badgeColor: color,
          borderSide: const BorderSide(color: AppColors.light)),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: IconSvg(
          icon,
          color: AppColors.light,
        ),
      ),
    );
  }
}
