import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/utils/device_utils.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme textThemeMedium = TextTheme(
    headlineLarge:
        const TextStyle().copyWith(fontSize: 22.0, color: AppColors.dark),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 20.0, color: AppColors.dark, fontWeight: FontWeight.w700),
    headlineSmall:
        const TextStyle().copyWith(fontSize: 18.0, color: AppColors.dark),
    bodyLarge:
        const TextStyle().copyWith(fontSize: 16.0, color: AppColors.dark),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, color: AppColors.dark, fontWeight: FontWeight.w500),
    bodySmall:
        const TextStyle().copyWith(fontSize: 12.0, color: AppColors.dark),
  );

  static TextTheme textThemeSmall = TextTheme(
    headlineLarge:
        const TextStyle().copyWith(fontSize: 20.0, color: AppColors.dark),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 18.0, color: AppColors.dark, fontWeight: FontWeight.w700),
    headlineSmall:
        const TextStyle().copyWith(fontSize: 16.0, color: AppColors.dark),
    bodyLarge:
        const TextStyle().copyWith(fontSize: 14.0, color: AppColors.dark),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 12.0, color: AppColors.dark, fontWeight: FontWeight.w500),
    bodySmall:
        const TextStyle().copyWith(fontSize: 11.0, color: AppColors.dark),
  );

  static TextTheme textTheme(BuildContext context) {
    if (DeviceUtils.isLargeDevices(context)) {
      return textThemeMedium;
    }
    return textThemeSmall;
  }
}
