class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  ProductRating? rating;

  Product({
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
    return 'Product{id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating}';
  }

  Product.fromJson(Map<String, dynamic> json) {
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
    rating = ProductRating.fromJson(json["rating"]);
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

class ProductRating {
  double? rate;
  int? count;

  ProductRating({
    required this.rate,
    required this.count,
  });

  @override
  String toString() {
    return 'ProductRating{rate: $rate, count: $count}';
  }

  ProductRating.fromJson(Map<String, dynamic> json) {
    rate = json["rate"];
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["rate"] = rate;
    data["count"] = count;
    return data;
  }
}

extension ProductListExtension on dynamic {
  List<Product> toProductList() {
    final list = <Product>[];
    if (this != null) {
      forEach((key, value) {
        list.add(Product.fromJson(value));
      });
    }
    return list;
  }
}
