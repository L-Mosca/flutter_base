import 'package:flutter_base_project/data/dto/product/product_dto.dart';
import 'package:flutter_base_project/data/remote/client_helper/client_helper.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';
import 'package:flutter_base_project/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ClientHelper clientHelper;

  ProductRepositoryImpl({required this.clientHelper});

  @override
  Future<List<Product>> getAllProducts() async {
    final data = await clientHelper.getAllProducts();
    return data.toProductList();
  }

  @override
  Future<Product?> getProductById({required int id}) async {
    final data = await clientHelper.getProductById(id: id);
    return data.toProduct();
  }

}