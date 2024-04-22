import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:daleel_store/app/features/home/data/products_data.dart';
import 'package:daleel_store/app/features/home/domin/models/product_model.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key,
    required this.products,
    this.discount = false,
    this.points = false,
  });

  final List<Product> products;
  final bool? discount;
  final bool? points;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: points! ? 330 : 350,
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 16, right: 24),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: productList.length,
        itemBuilder: (context, index) => ProductCard(
          product: discount!
              ? products[(productList.length - index) - 1]
              : products[index],
          discount: discount,
          pionts: points,
        ),
        separatorBuilder: (context, index) => AppSpaces.width4,
      ),
    );
  }
}
