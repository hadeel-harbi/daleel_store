import 'package:daleel_store/app/core/utils/exports.dart';

class ProductCard extends StatefulWidget {
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
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool inCart = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpaces.screenWidth(context) * 0.6,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsetsDirectional.only(end: 14),
      constraints: const BoxConstraints(maxWidth: 300),
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
            width: AppSpaces.screenWidth(context) * 0.55,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              widget.product.image ?? "",
              fit: BoxFit.cover,
            ),
          ),
          AppSpaces.height16,
          Text(widget.product.name ?? "",
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
                  AppImages.saudiArabia,
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
          widget.pionts!
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
                      AppSpaces.width4,
                      IconSvg(
                        AppIcons.star,
                        color: AppColors.light,
                        size: 12,
                      )
                    ],
                  ),
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        Text(widget.product.price ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: AppColors.secondaryGreen,
                                    fontWeight: FontWeight.w600)),
                        AppSpaces.width8,
                        Text(widget.discount! ? "50.99" : "",
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
                          flex: 3,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                inCart = !inCart;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 32,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                  color: inCart
                                      ? AppColors.light
                                      : AppColors.secondaryRed,
                                  borderRadius: BorderRadius.circular(17),
                                  border: Border.all(
                                      color: AppColors.secondaryRed,
                                      width: 1.5)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  inCart
                                      ? const Text(
                                          "في السلة",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.secondaryRed,
                                          ),
                                        ).animate().fadeIn()
                                      : const Text(
                                          "أضف للسلة",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.light,
                                          ),
                                        ).animate().fadeIn(
                                          delay: const Duration(
                                              milliseconds: 100)),
                                  inCart
                                      ? Container(
                                          padding: const EdgeInsets.all(2),
                                          margin:
                                              const EdgeInsetsDirectional.only(
                                                  end: 5),
                                          decoration: const BoxDecoration(
                                              color: AppColors.secondaryRed,
                                              shape: BoxShape.circle),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 11,
                                          ),
                                        ).animate().slideY(begin: 0.5)
                                      : const IconSvg(
                                          AppIcons.cart,
                                          color: AppColors.light,
                                        ).animate().slideY(
                                          begin: -0.4,
                                          delay:
                                              const Duration(milliseconds: 100))
                                ],
                              ),
                            ),
                          ),
                        ),
                        AppSpaces.width8,
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: 32,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(17)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconSvg(
                                  AppIcons.apple,
                                  color: AppColors.light,
                                  size: 14,
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
