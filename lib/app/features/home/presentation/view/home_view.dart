import 'package:daleel_store/app/core/utils/exports.dart';

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
    return Scaffold(
      body: HomeViewBackground(
        children: [
          const ViewPadding([
            Header(),
            TextFieldWidget(
              hint: "بطاقة يلا لودو",
              suffixIcon:
                  IconSvg(AppIcons.search, color: AppColors.dark, size: 16),
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
                  image: AppImages.mobileLegends,
                ),
                ItemContainer(
                  image: AppImages.pubg,
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
      ),
    );
  }
}
