import 'package:daleel_store/app/core/constants/icons.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryWidget(
              icon: AppIcons.platforms,
              text: "منصات الشراء",
            ),
            CategoryWidget(
              icon: AppIcons.stores,
              text: "متاجر رقمية",
            ),
            CategoryWidget(
              icon: AppIcons.gaming,
              text: "منصات الألعاب",
            ),
            CategoryWidget(
              icon: AppIcons.shopping,
              text: "التسوق",
            ),
            CategoryWidget(
              icon: AppIcons.data,
              text: "الاتصال والبيانات",
            ),
          ],
        ),
      ),
    );
  }
}
