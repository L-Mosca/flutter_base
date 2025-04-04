import 'package:flutter_base_project/domain/models/product/product.dart';

class ProductDto {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  ProductRatingDto? rating;

  ProductDto({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  @override
  String toString() {
    return 'ProductDto{id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating}';
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
    rating = ProductRatingDto.fromJson(json["rating"]);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["price"] = price;
    data["description"] = description;
    data["category"] = category;
    data["image"] = image;
    data["rating"] = rating?.toJson();
    return data;
  }
}

class ProductRatingDto {
  double? rate;
  int? count;

  ProductRatingDto({
    required this.rate,
    required this.count,
  });

  @override
  String toString() {
    return 'ProductRatingDto{rate: $rate, count: $count}';
  }

  ProductRatingDto.fromJson(Map<String, dynamic> json) {
    rate = json["rate"]?.toDouble();
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["rate"] = rate;
    data["count"] = count;
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
      rating: this?.rating.toProductRating(),
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

extension ProductRationDtoExtension on ProductRatingDto? {
  ProductRating toProductRating() {
    return ProductRating(
      rate: this?.rate ?? 0.0,
      count: this?.count ?? 0,
    );
  }
}
