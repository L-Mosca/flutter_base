import 'package:flutter_base_project/domain/models/product/product.dart';

abstract interface class ProductRepository {
  Future<Product?> getProductById({required int id});
  Future<List<Product>> getAllProducts();
}
