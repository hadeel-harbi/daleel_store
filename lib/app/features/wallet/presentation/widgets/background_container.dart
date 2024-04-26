import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/utils/device_utils.dart';
import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceUtils.screenWidth(context),
      constraints:
          BoxConstraints(minHeight: DeviceUtils.screenHeight(context) * 0.6),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.light,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.09),
              blurRadius: 20,
              spreadRadius: 7,
              offset: const Offset(0, 0))
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
