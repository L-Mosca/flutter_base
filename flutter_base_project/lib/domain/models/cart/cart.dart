import 'package:flutter_base_project/domain/models/payment/payment.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';

class Cart {
  int id;
  List<Product> products;
  Payment payment;

  Cart({
    required this.id,
    required this.products,
    required this.payment,
  });

  @override
  String toString() {
    return 'Cart{id: $id, products: $products, payment: $payment}';
  }

  Cart.createNewCart()
      : id = 1,
        products = [],
        payment = Payment.createDefaultPayment();

  Cart.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        products = [],
        payment = Payment.fromJson(json["payment"]) {
    products = toProductList(json["products"]);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] = id;
    data["products"] = products.map((e) => e.toJson()).toList();
    data["payment"] = payment.toJson();
    return data;
  }

  void addProduct(Product product) {
    final index = products.indexWhere((p) => p.id == product.id);
    // Has product in list, change quantity
    if (index != -1) {
      final newProduct = products[index];
      newProduct.quantity = newProduct.quantity + 1;
      products[index] = newProduct;
    } else {
      products.add(product);
    }
    updateTotalValue();
  }

  void removeProduct(Product product) {
    final index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      final newProduct = products[index];
      newProduct.quantity = newProduct.quantity - 1;
      if (newProduct.quantity <= 0) {
        products.removeAt(index);
      } else {
        products[index] = newProduct;
      }
    }
    updateTotalValue();
  }

  void updateTotalValue() {
    final total =
        products.fold(0.0, (sum, product) => sum + ((product.price ?? 0.0) * product.quantity));
    payment.updateTotalValue(total);
  }

  List<Product> toProductList(dynamic data) {
    if (data is List) {
      return (data)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}
