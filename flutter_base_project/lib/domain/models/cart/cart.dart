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
        products = json["products"].toProductList(),
        payment = Payment.fromJson(json["payment"]);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] = id;
    data["products"] = products.map((e) => e.toJson()).toList();
    data["payment"] = payment.toJson();
    return data;
  }

  void addProduct(Product product) {
    products.add(product);
    updateTotalValue();
  }

  void removeProduct(Product product) {
    products.remove(product);
    updateTotalValue();
  }

  void updateTotalValue() {
    final total = products.fold(0.0, (sum, product) => sum + (product.price ?? 0.0));
    payment.updateTotalValue(total);
  }
}
