import 'dart:convert';

ProductCommerce ProductCommerceFromMap(String str) =>
    ProductCommerce.fromMap(json.decode(str));

class ProductCommerce {
  ProductCommerce({
    this.name,
    this.description,
    this.brand,
    this.categories,
    this.price,
    this.image,
    this.popularity,
    this.objectId,
  });

  final String? name;
  final String? description;
  final String? brand;
  final List<String>? categories;
  final double? price;
  final String? image;
  final int? popularity;
  final String? objectId;

  factory ProductCommerce.fromMap(Map<String, dynamic> json) => ProductCommerce(
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        brand: json["brand"] == null ? null : json["brand"],
        categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((x) => x)),
        price: json["price"] == null ? null : json["price"].toDouble(),
        image: json["image"] == null ? null : json["image"],
        popularity: json["popularity"] == null ? null : json["popularity"],
        objectId: json["objectID"] == null ? null : json["objectID"],
      );
}
