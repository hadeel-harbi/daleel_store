import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:daleel_store/app/core/utils/svg_icon.dart';
import 'package:daleel_store/app/features/home/domin/models/product_model.dart';
import 'package:daleel_store/app/features/home/domin/repositories/products_usecase.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/home_view_background.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/partners_list_view.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/stores_list_view.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/categories_row.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/header.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/images_slider.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/item_container.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/products_list_view.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/text_field.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/title_row.dart';
import 'package:daleel_store/app/shared/widgets/view_padding.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Product> products = [];
  @override
  void initState() {
    products = ProductsRepository().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeViewBackground(
      children: [
        const ViewPadding([
          Header(),
          TextFieldWidget(
            hint: "بطاقة يلا لودو",
            suffixIcon: IconSvg("assets/icons/search.svg",
                color: AppColors.dark, size: 16),
          ),
          TitleRow(headline: "تصنيفات المنتجات"),
        ]),
        const CategoriesRow(),
        const ImagesSlider(),
        AppSpaces.height32,
        const ViewPadding([
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemContainer(
                image: "assets/images/Mobile-Legends.png",
              ),
              ItemContainer(
                image: "assets/images/PUBG.png",
              )
            ],
          ),
          AppSpaces.height16,
          TitleRow(
            headline: "اطلبها مجدداً",
            subtitle: "طلباتي السابقة",
          ),
        ]),
        ProductsListView(products: products),
        const ViewPadding([
          TitleRow(
            headline: "الأكثر مبيعاً",
            subtitle: "مشاهدة الكل",
          ),
        ]),
        const StoresListView(),
        const ViewPadding([
          TitleRow(
            headline: "البطاقات المخفضة",
            subtitle: "مشاهدة الكل",
          ),
        ]),
        ProductsListView(
          products: products,
          discount: true,
        ),
        const ViewPadding([
          TitleRow(headline: "أحدث المنتجات"),
        ]),
        const StoresListView(),
        const ViewPadding([
          TitleRow(
            headline: "استبدل نقاطك",
            subtitle: "مشاهدة الكل",
          ),
        ]),
        ProductsListView(
          products: products,
          discount: true,
          points: true,
        ),
        const ViewPadding([
          TitleRow(
            headline: "عروض الشركاء",
            subtitle: "مشاهدة الكل",
          ),
        ]),
        const PartnersListView(),
        AppSpaces.height112,
      ],
    );
  }
}
