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
              icon: "assets/icons/platforms.svg",
              text: "منصات الشراء",
            ),
            CategoryWidget(
              icon: "assets/icons/stores.svg",
              text: "متاجر رقمية",
            ),
            CategoryWidget(
              icon: "assets/icons/gaming.svg",
              text: "منصات الألعاب",
            ),
            CategoryWidget(
              icon: "assets/icons/shopping.svg",
              text: "التسوق",
            ),
            CategoryWidget(
              icon: "assets/icons/data.svg",
              text: "الاتصال والبيانات",
            ),
          ],
        ),
      ),
    );
  }
}
