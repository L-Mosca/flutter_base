import 'package:flutter_base_project/domain/models/product/product.dart';

class ProductDto {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  ProductDto({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  @override
  String toString() {
    return 'ProductDto{id: $id, title: $title, price: $price, description: $description, category: $category, image: $image}';
  }

  ProductDto.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    if (json["price"] is int) {
      price = json["price"].toDouble();
    } else {
      price = json["price"];
    }
    description = json["description"];
    category = json["category"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["price"] = price;
    data["description"] = description;
    data["category"] = category;
    data["image"] = image;
    return data;
  }
}

extension ProductDtoExtensions on ProductDto? {
  Product? toProduct() {
    if (this == null) return null;

    return Product(
      id: this?.id,
      title: this?.title,
      price: this?.price,
      description: this?.description,
      category: this?.category,
      image: this?.image,
    );
  }
}

extension ProductDtoListExtensions on List<ProductDto?>? {
  List<Product> toProductList() {
    final list = <Product>[];
    this?.forEach((e) {
      if (e != null) {
        final data = e.toProduct();
        if (data != null) list.add(data);
      }
    });
    return list;
  }
}
