class Product {
  final String? name;
  final String? price;
  final String? image;

  Product(this.name, this.price, this.image);

  factory Product.fromJson(Map<String, dynamic> json) =>
      Product(json['name'], json['price'], json['image']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}
