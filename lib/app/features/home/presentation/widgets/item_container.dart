import 'package:daleel_store/app/core/utils/device_utils.dart';
import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    final vactor = DeviceUtils.screenWidth(context) > 850 ? 0.25 : 0.4;
    return Container(
        width: DeviceUtils.screenWidth(context) * vactor,
        height: DeviceUtils.screenWidth(context) * vactor,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ));
  }
}
