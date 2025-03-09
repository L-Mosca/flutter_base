class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  @override
  String toString() {
    return 'Product{id: $id, title: $title, price: $price, description: $description, category: $category, image: $image}';
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
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic> {};
    data["id"] = id;
    data["title"] = title;
    data["price"] = price;
    data["description"] = description;
    data["category"] = category;
    data["image"] = image;
    return data;
  }
}
