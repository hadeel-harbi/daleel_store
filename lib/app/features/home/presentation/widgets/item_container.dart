import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AppSpaces.screenWidth(context) * 0.4,
        height: AppSpaces.screenWidth(context) * 0.4,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ));
  }
}
