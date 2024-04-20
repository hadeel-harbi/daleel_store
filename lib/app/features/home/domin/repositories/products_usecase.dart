import 'package:daleel_store/app/features/home/data/products_data.dart';
import 'package:daleel_store/app/features/home/domin/models/product_model.dart';

class ProductsRepository {
  List<Product> getProducts() {
    List<Product> productsObjects = [];
    for (var element in productList) {
      productsObjects.add(Product.fromJson(element));
    }

    return productsObjects;
  }
}
