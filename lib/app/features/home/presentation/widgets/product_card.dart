import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:daleel_store/app/core/utils/svg_icon.dart';
import 'package:daleel_store/app/features/home/domin/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.discount = false,
    this.pionts = false,
  });
  final Product product;
  final bool? discount;
  final bool? pionts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpaces.screenWidth(context) * 0.65,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsetsDirectional.only(end: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(color: AppColors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 14,
              spreadRadius: 0,
              offset: const Offset(0, 5),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 144,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              product.image ?? "",
              fit: BoxFit.cover,
            ),
          ),
          AppSpaces.height16,
          Text(product.name ?? "",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w600)),
          AppSpaces.height8,
          Row(
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(end: 8),
                height: 16,
                width: 16,
                child: Image.asset(
                  "assets/images/saudi-arabia.png",
                  fit: BoxFit.cover,
                ),
              ),
              Text("المتجر السعودي",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
          AppSpaces.height8,
          pionts!
              ? Container(
                  height: 30,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                      color: AppColors.secondaryOrange,
                      borderRadius: BorderRadius.circular(17)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "استبدل نقاطك",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "1543",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconSvg(
                        "assets/icons/star.svg",
                        color: AppColors.light,
                        size: 16,
                      )
                    ],
                  ),
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        Text(product.price ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: AppColors.secondaryGreen,
                                    fontWeight: FontWeight.w600)),
                        AppSpaces.width8,
                        Text(discount! ? "50.99" : "",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: AppColors.secondaryRed,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: AppColors.secondaryRed)),
                      ],
                    ),
                    AppSpaces.height16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                                color: AppColors.secondaryRed,
                                borderRadius: BorderRadius.circular(17)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "أضف للسلة",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                IconSvg(
                                  "assets/icons/cart.svg",
                                  color: AppColors.light,
                                )
                              ],
                            ),
                          ),
                        ),
                        AppSpaces.width8,
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(17)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconSvg(
                                  "assets/icons/apple.svg",
                                  color: AppColors.light,
                                  size: 16,
                                ),
                                Text(
                                  "Pay",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
