import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/utils/svg_icon.dart';
import 'package:daleel_store/app/shared/drawer/widgets/light_dark_switch.dart';
import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  const DrawerListItem(
    this.text,
    this.icon, {
    super.key,
  });
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: text != "تسجيل الخروج" ? AppColors.dark : AppColors.error,
            fontWeight: FontWeight.w500),
      ),
      leading: IconSvg(
        icon,
        color: text != "تسجيل الخروج" ? AppColors.dark : AppColors.error,
      ),
      trailing: text != "الوضع المظلم"
          ? Icon(
              Icons.arrow_forward_ios_rounded,
              color: text != "تسجيل الخروج" ? AppColors.dark : AppColors.error,
              size: 14,
            )
          : const LightDarkSwitch(),
    );
  }
}
